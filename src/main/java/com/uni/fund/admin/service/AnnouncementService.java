package com.uni.fund.admin.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.admin.dao.AnnouncementDAO;
import com.uni.fund.admin.dto.AnnouncementDTO;
import com.uni.fund.crew.dto.CrewDTO;

@Service
public class AnnouncementService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AnnouncementDAO annDAO;

	public String file_root = "/Users/jeounghun/upload/Unifund/";

	public Map<String, Object> annList(int currPage, int pagePerCnt) {
		int start = (currPage - 1) * pagePerCnt;

		Map<String, Object> result = new HashMap<String, Object>();
		List<AnnouncementDTO> annList = annDAO.annList(start, pagePerCnt);
		result.put("annList", annList);
		result.put("currPage", currPage);
		result.put("totalPages", annDAO.allCount(pagePerCnt));
		logger.info("result:{}", result);

		return result;
	}

	public Map<String, Object> adminList(int currPage, int pagePerCnt) {
		logger.info("adminList :::::::");
		int start = (currPage - 1) * pagePerCnt;

		Map<String, Object> result = new HashMap<String, Object>();
		List<AnnouncementDTO> adminList = annDAO.adminList(start, pagePerCnt);
		result.put("adminList", adminList);
		result.put("currPage", currPage);
		result.put("totalPages", annDAO.allCount(pagePerCnt));
		logger.info("result:{}", result);

		return result;
	}

	public int adminAnnForm(MultipartFile noti_photo, Map<String, String> param, HttpSession session) {
		logger.info(":::annForm Service IN:::");
		int row = -1;
		AnnouncementDTO announcementDTO = new AnnouncementDTO();
		announcementDTO.setNoti_title(param.get("noti_title"));
		announcementDTO.setNoti_content(param.get("noti_content"));
		announcementDTO.setNoti_top(param.get("noti_top"));
		announcementDTO.setMng_idx(Integer.parseInt(param.get("mng_idx")));

		logger.info("param" + announcementDTO.getMng_idx());
		logger.info("param" + announcementDTO.getNoti_content());
		logger.info("param" + announcementDTO.getNoti_title());

		row = annDAO.adminAnnForm(announcementDTO);

		if (row > 0) {
			int noti_idx = announcementDTO.getNoti_idx();
			session.setAttribute("noti_idx", noti_idx);

			logger.info("adminAnnForm noti_idx = " + noti_idx);
			String notiPhotoDiv = "공지사항사진";
			annFileSave(noti_idx, noti_photo, notiPhotoDiv);
		}
		logger.info("adminAnnForm service end");

		return row;
	}

	private void annFileSave(int noti_idx, MultipartFile noti_photo, String notiPhotoDiv) {
		if (noti_photo != null) {
			String oriName = noti_photo.getOriginalFilename();
			String annPhoto = "";
			if(oriName.isEmpty()) {
				return;
			}
			annPhoto = oriName.substring(oriName.lastIndexOf("."));
					
			String newAnnFileName = System.currentTimeMillis() + annPhoto;

			Path AnnPath = Paths.get(file_root + newAnnFileName);

			try {
				byte[] annBytes = noti_photo.getBytes();
				Files.write(AnnPath, annBytes);
				annDAO.createNotiPhoto(noti_idx, newAnnFileName, notiPhotoDiv);
				Thread.sleep(1);
			} catch (Exception e) {
				logger.info(":::NotiFileSave Service FILE Exception:::");
				e.printStackTrace();
			}

		}

	}

	public Map<String, Object> annListSearch(String keyWord, int currPage, int pagePerCnt) {
		int start = (currPage - 1) * pagePerCnt;

		List<AnnouncementDTO> list = annDAO.annListSearch(keyWord, start, pagePerCnt); // 검색어를 LIKE 연산자로 감싸서 전달
		Map<String, Object> result = new HashMap<String, Object>();
		int totalCount = annDAO.searchAllCount(keyWord, pagePerCnt); // 검색 결과에 대한 총 공지사항 수 가져오기
		int totalPages = (int) Math.ceil(totalCount / pagePerCnt); // 전체 페이지 수 계산

		logger.info(totalCount + "asdfasd" + totalPages);

		result.put("annList", list);
		result.put("currPage", currPage);
		result.put("totalPages", totalCount); // 검색어를 LIKE 연산자로 감싸서 전달
//	    logger.info(annDAO.searchAllCount(keyWord, pagePerCnt) + "asdfasd");
		return result;
	}

	public Map<String, Object> adminListSearch(String keyWord, int currPage, int pagePerCnt) {
		int start = (currPage - 1) * pagePerCnt;

		List<AnnouncementDTO> list = annDAO.adminListSearch(keyWord, start, pagePerCnt); // 검색어를 LIKE 연산자로 감싸서 전달
		Map<String, Object> result = new HashMap<String, Object>();
		int totalCount = annDAO.searchAllCount(keyWord, pagePerCnt); // 검색 결과에 대한 총 공지사항 수 가져오기
		int totalPages = (int) Math.ceil(totalCount / pagePerCnt); // 전체 페이지 수 계산

		logger.info(totalCount + "asdfasd" + totalPages);

		result.put("adminList", list);
		result.put("currPage", currPage);
		result.put("totalPages", totalCount); // 검색어를 LIKE 연산자로 감싸서 전달
//	    logger.info(annDAO.searchAllCount(keyWord, pagePerCnt) + "asdfasd");
		return result;
	}

	public void annDel(List<Integer> notiIdxList) {
		annDAO.updateAnnouncementStatus(notiIdxList, 'B');

	}

	public AnnouncementDTO annDetail(int noti_idx) {
		logger.info("noti_idx : " + noti_idx);
		return annDAO.annDetail(noti_idx);
	}

	public String notiPhoto(int noti_idx) {
		logger.info("mng_idx : " + noti_idx);
		return annDAO.notiPhoto(noti_idx);
	}

	public int adminAnnUpdate(MultipartFile noti_photo, Map<String, String> param, HttpSession session) {
		logger.info("::: annUpdate Service IN :::");
		int row = -1;
		AnnouncementDTO announcementDTO = new AnnouncementDTO();
		announcementDTO.setNoti_idx(Integer.parseInt(param.get("noti_idx")));
		logger.info("noti_idx"+announcementDTO.getNoti_idx() );
		announcementDTO.setNoti_title(param.get("noti_title"));
		announcementDTO.setNoti_content(param.get("noti_content"));
		announcementDTO.setNoti_top(param.get("noti_top"));
		announcementDTO.setMng_idx(Integer.parseInt(param.get("mng_idx")));
		row = annDAO.adminAnnUpdate(announcementDTO); // 공지사항 정보 업데이트

		logger.info("noti_title" + announcementDTO.getNoti_title() + "noti_content" + announcementDTO.getNoti_content()
				+ "noti_top" + announcementDTO.getNoti_top() + "mng_idx" + announcementDTO.getMng_idx() + "noti_idx"
				+ announcementDTO.getNoti_idx());

		if (row > 0) {
			String notiPhotoDiv = "공지사항사진";
			annFileUpdate(announcementDTO.getNoti_idx(), noti_photo, notiPhotoDiv); // 사진 업데이트
		}
		logger.info("adminAnnUpdate service end");

		return row;
	}

	private void annFileUpdate(int noti_idx, MultipartFile noti_photo, String notiPhotoDiv) {
		if (noti_photo != null) {
			logger.info("annFileUpdate IN:::::::");
			// 파일이 업로드되었을 때만 처리
			String oriName = noti_photo.getOriginalFilename();
			String annPhoto = "";
			if (oriName.isEmpty()) {
				return;
			}

			annPhoto = oriName.substring(oriName.lastIndexOf("."));
			String newAnnFileName = System.currentTimeMillis() + annPhoto;

			Path AnnPath = Paths.get(file_root + newAnnFileName);
			try {
				byte[] annBytes = noti_photo.getBytes();
				Files.write(AnnPath, annBytes);
				if (annDAO.photoCount(noti_idx) > 0) {
					annDAO.updateNotiPhoto(noti_idx, newAnnFileName, notiPhotoDiv); // 데이터베이스 업데이트

				} else {
					annDAO.createNotiPhoto(noti_idx, newAnnFileName, notiPhotoDiv);

				}
				logger.info("annFileUpdate 업데용");
				Thread.sleep(1);
			} catch (Exception e) {
				logger.info("::: NotiFileUpdate Service FILE Exception :::");
				e.printStackTrace();
			}
		}
	}

//	
//	public Map<String, Object> annListSearch(String keyWord, int currPage, int pagePerCnt) {
//	    int start = (currPage - 1) * pagePerCnt;
//	    List<AnnouncementDTO> list = annDAO.annListSearch(keyWord, start, pagePerCnt);
//	    int totalCount = annDAO.searchAllCount("%" + keyWord + "%"); // 검색 결과에 대한 총 공지사항 수 가져오기
//	    int totalPages = (int) Math.ceil((double) totalCount / pagePerCnt); // 전체 페이지 수 계산
//	    Map<String, Object> result = new HashMap<String, Object>();
//	    result.put("annList", list);
//	    result.put("currPage", currPage);
//	    result.put("totalPages", totalPages); // 검색 결과에 대한 전체 페이지 수 전달
//	    return result;
//	}

}
