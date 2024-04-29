package com.uni.fund.project.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.project.dao.ProjectDAO;
import com.uni.fund.project.dto.ProjectDTO;
import com.uni.fund.project.dto.ReviewDTO;

@Service
public class ProjectService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	ProjectDAO projectDAO;

	public String file_root = "/Users/jeounghun/upload/Unifund/";

	public ProjectDTO detail(String pro_idx,int memIdx) {
		logger.info("pro_idx : {}",pro_idx);
		logger.info("memIdx : {}",memIdx);
		return projectDAO.detail(memIdx,pro_idx);
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 등록하기
	 * */
	public int projectCreate(MultipartFile pro_main_photo, MultipartFile pro_photo, Map<String, String> param,
			int mem_idx) {
		logger.info(":::projectCreate Service IN:::");
		int row = -1;
		
		SimpleDateFormat parseDate = new SimpleDateFormat("yyyy-MM-dd");
		ProjectDTO projectDTO = new ProjectDTO();
		projectDTO.setMem_idx(mem_idx);
		projectDTO.setPro_title(param.get("pro_title"));
		projectDTO.setPro_content(param.get("pro_content"));
		projectDTO.setCate_idx(Integer.parseInt(param.get("cate_idx")));
		projectDTO.setPro_phone(param.get("pro_phone"));
		projectDTO.setRew_name(param.get("rew_name"));
		projectDTO.setRew_max(Integer.parseInt(param.get("rew_max")));
		projectDTO.setOri_price(Integer.parseInt(param.get("ori_price")));
		projectDTO.setRew_price(Integer.parseInt(param.get("rew_price")));
		try {
			Date deadLineDate = parseDate.parse(param.get("pro_deadline"));
			projectDTO.setPro_deadline(new java.sql.Date(deadLineDate.getTime()));

			Date startDate = parseDate.parse(param.get("pro_startdate"));
			projectDTO.setPro_startdate(new java.sql.Date(startDate.getTime()));

			// projectDTO.setPro_deadline((Date)parseDate.parse(param.get("pro_deadline")));
			// projectDTO.setPro_startdate((Date)parseDate.parse(param.get("pro_startdate")));
		} catch (ParseException e) {
			logger.info(":::projectCreate Service Date Exception:::");
			e.printStackTrace();
		}
		projectDTO.setPro_tos(param.get("pro_tos"));

		row = projectDAO.projectCreate(projectDTO);

		if (row > 0) {
			int pro_idx = projectDTO.getPro_idx();


			String projectMainPhotoDiv = "프로젝트대표사진";
			String projectPhotoDiv = "프로젝트";
			projectMainFileSave(pro_idx, pro_main_photo, projectMainPhotoDiv);
			projectFileSave(pro_idx, pro_photo, projectPhotoDiv);
		}

		return row;
	}

	/* *
	 * 작성자 : 허승경
	 * 프로젝트 대표사진 저장
	 * */
	private void projectMainFileSave(int pro_idx, MultipartFile pro_main_photo, String projectMainPhotoDiv) {
		
		if (pro_main_photo != null && pro_main_photo.getSize() > 0) {
			String oriName = pro_main_photo.getOriginalFilename();
			String projectMainPhoto = oriName.substring(oriName.lastIndexOf("."));
			String newProjectMainFileName = System.currentTimeMillis() + projectMainPhoto;

			Path ProjectMainPath = Paths.get(file_root + newProjectMainFileName);

			try {
				byte[] mainPhotoBytes = pro_main_photo.getBytes();
				Files.write(ProjectMainPath, mainPhotoBytes);
				projectDAO.createMainPhoto(pro_idx, newProjectMainFileName, projectMainPhotoDiv);
				Thread.sleep(1);
			} catch (Exception e) {
				logger.info(":::projectMainFileSave Service FILE Exception:::");
				e.printStackTrace();
			}

		}

	}

	/* *
	 * 작성자 : 허승경
	 * 프로젝트 내용사진 저장
	 * */
	private void projectFileSave(int pro_idx, MultipartFile pro_photo, String projectPhotoDiv) {
		if (pro_photo != null && pro_photo.getSize() > 0) {
			String oriName = pro_photo.getOriginalFilename();
			String projectPhoto = oriName.substring(oriName.lastIndexOf("."));
			String newProjectFileName = System.currentTimeMillis() + projectPhoto;

			Path ProjectPath = Paths.get(file_root + newProjectFileName);

			try {
				byte[] photoBytes = pro_photo.getBytes();
				Files.write(ProjectPath, photoBytes);
				projectDAO.createPhoto(pro_idx, newProjectFileName, projectPhotoDiv);
				Thread.sleep(1);
			} catch (Exception e) {
				logger.info(":::projectFileSave Service FILE Exception:::");
				e.printStackTrace();
			}

		}

	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 수정전 내용 불러오기
	 * */
	public void updateForm(String pro_idx, Model model) {
		ProjectDTO projectdto = projectDAO.updateForm(pro_idx);
		model.addAttribute("project",projectdto);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String proDeadline = dateFormat.format(projectdto.getPro_deadline());
		String proStartDate = dateFormat.format(projectdto.getPro_startdate());
		model.addAttribute("proDeadline",proDeadline);
		model.addAttribute("proStartDate",proStartDate);
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 수정하기
	 * */
	public int projectUpdate(MultipartFile pro_main_photo, MultipartFile pro_photo, Map<String, String> param) {
		int row = -1;

		row = projectDAO.projectUpdate(param);
		
		if(row > 0) {
			int pro_idx = Integer.parseInt(param.get("pro_idx"));
			projectMainFileSave(pro_idx,pro_main_photo,"프로젝트대표사진");
			projectFileSave(pro_idx,pro_photo,"프로젝트");
		}
		
		return row;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 수정 버튼 클릭시 펀딩신청한 사람 체크하기
	 * */
	public Object checkFundPeople(Integer pro_idx) {
		return projectDAO.checkFundPeople(pro_idx);
	}

	/* *
	 * 작성자 : 허승경
	 * 각 회원별 프로젝트 등록 개수 세기
	 * */
	public int checkProject(Integer mem_idx) {
		return projectDAO.checkProject(mem_idx);
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 리스트 내용 불러오기
	 * */
	public List<ProjectDTO> projectList(Map<String, Object> param){
		List<ProjectDTO> list = projectDAO.checkList();
		Date now = new Date();
		
		for (ProjectDTO pro : list) {
			long sqlDate = pro.getPro_deadline().getTime();
			Date deadline = new Date(sqlDate);
			String pro_idx = ""+pro.getPro_idx();
			
			if (deadline.before(now) && pro.getProgress() == null) {
				projectDAO.fail(pro_idx);
				int[] appList = projectDAO.appList(pro_idx);
				logger.info("appList : {}", Arrays.toString(appList));
				
				for (int mem_idx :  appList) {
					projectDAO.moneyRefund(mem_idx, pro_idx);
					projectDAO.delCashHis(mem_idx, pro_idx);
					projectDAO.delMileHis(mem_idx, pro_idx);
					projectDAO.fundingCancle(mem_idx, pro_idx);
				} 
				
			} else if(deadline.before(now) && !pro.getProgress().equals("100")){
				projectDAO.fail(pro_idx);
				int[] appList = projectDAO.appList(pro_idx);
				logger.info("appList : {}", Arrays.toString(appList));
				
				for (int mem_idx :  appList) {
					projectDAO.moneyRefund(mem_idx, pro_idx);
					projectDAO.delCashHis(mem_idx, pro_idx);
					projectDAO.delMileHis(mem_idx, pro_idx);
					projectDAO.fundingCancle(mem_idx, pro_idx);
				} 
			}else if (pro.getProgress() != null && pro.getProgress().equals("100") && deadline.equals(now)) {
				projectDAO.proSuccess(pro_idx);
				projectDAO.appSuccess(pro_idx);
			}
		}
		
		List<ProjectDTO> projectList = projectDAO.projectList(param);

		return projectList;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 개수세기
	 * */
	public int projectTotalCnt(Map<String, Object> param) {
		return projectDAO.projectTotalCnt(param);
	}
	
	/* *
	 * 작성자 : 허승경
	 * 각 회원별 프로젝트 좋아요 불러오기
	 * */
	public int projectReadLike(int pro_idx, int mem_idx) {
		return projectDAO.projectReadLike(pro_idx,mem_idx);
	}

	/* *
	 * 작성자 : 허승경
	 * 각 회원별 프로젝트 좋아요 확인 / 취소 / 추가
	 * */
	public int projectCheckLike(Integer pro_idx, Integer mem_idx) {
		int projectCheckLikeRow = projectDAO.projectCheckLike(pro_idx,mem_idx);
		logger.info("projectCheckLikeRow : {}",projectCheckLikeRow);
		if(projectCheckLikeRow == 1) {
			projectDAO.projectDisLike(pro_idx,mem_idx);
			projectCheckLikeRow = 0;
		}else {
			projectDAO.projectAddLike(pro_idx,mem_idx);
			projectCheckLikeRow = 1;
		}
		return projectCheckLikeRow;
	}
	
	public int projectReadFavorites(Integer pro_idx, Integer mem_idx) {
		return projectDAO.projectReadFavorites(pro_idx,mem_idx);
	}
	
	/* *
	 * 작성자 : 허승경
	 * 프로젝트 즐겨찾기 확인 / 추가 / 삭제
	 * */
	public int projectCheckFavorites(Integer pro_idx, Integer mem_idx) {
		int projectCheckFavoritesRow = projectDAO.projectCheckFavorites(pro_idx,mem_idx);
		logger.info("projectCheckFavoritesRow : {}",projectCheckFavoritesRow);
		if(projectCheckFavoritesRow == 1) {
			String proIdx = pro_idx.toString();
			int memIDx = mem_idx;
			projectDAO.favoriteCancle(proIdx,memIDx);
			projectCheckFavoritesRow = 0;
		}else {
			String proIdx = pro_idx.toString();
			int memIDx = mem_idx;
			projectDAO.favorite(proIdx,memIDx);
			projectCheckFavoritesRow = 1;
		}
		return projectCheckFavoritesRow;
	}
	
	/* *
	 * 작성자 : 허승경
	 * 펀딩상태 실패 / 펀딩중 불러오기
	 * */
	public String projectFundingState(int pro_idx) {
		int result = projectDAO.projectFundingState(pro_idx);
		logger.info("성공여부 : {}", result);
		if(result > 0) {
			return "projectFundingFail";
		}else {
			return "projectFundingProgress";
		}
	}
	
	public void funding(Map<String, String> map) {
		int cnt = projectDAO.funding(map);
		projectDAO.moneyMng(map);
//		int cash = Integer.parseInt(map.get("total_Price")) - Integer.parseInt(map.get("mileage")); 
		projectDAO.cashHis(map);
		if (Integer.parseInt(map.get("mileage"))  != 0) {
			projectDAO.mileageHis(map);			
		}
		logger.info("성공여부 : {}", cnt);
	}

	public void fundingCancle(Map<String, String> map) {
		int mem_idx = Integer.parseInt(map.get("mem_idx")) ;
		String pro_idx = map.get("pro_idx");
		projectDAO.moneyRefund(mem_idx,pro_idx);
		projectDAO.cashHis(map);
		logger.info("mileage:{}", map.get("mileage"));
		String mileage = String.valueOf(projectDAO.mileageSelect(map));
		map.put("mileage", mileage);
		if (Integer.parseInt(map.get("mileage"))  != 0) {
			projectDAO.mileageHis(map);			
		}		
		int cnt = projectDAO.fundingCancle(mem_idx,pro_idx);
		logger.info("성공여부 : {}", cnt);
	}

	public int reviewDo(MultipartFile photo, Map<String, String> param, int mem_idx) {
		ProjectDTO proDTO = new ProjectDTO();
		proDTO.setPro_idx(Integer.parseInt(param.get("pro_idx")));
		proDTO.setMem_idx(mem_idx);
		proDTO.setRev_content(param.get("revContent"));
		proDTO.setRev_grade(Integer.parseInt(param.get("revNum")));
		
		String memId = projectDAO.checkRev(proDTO);
		if (memId == null) {
			projectDAO.mileageSaveUp(mem_idx);			
		}
		
		int row = projectDAO.reviewDo(proDTO);
		int rev_idx = proDTO.getRev_idx();
		logger.info("rev_idx = " + rev_idx);

		if (row > 0) {
			revFileSave(photo, rev_idx);
		}

		return row;
	}

	public void revFileSave(MultipartFile photo, int idx) {
		String fileName = photo.getOriginalFilename();
		logger.info("upload file name : " + fileName);
		if (!fileName.equals("")) {
			String ext = fileName.substring(fileName.lastIndexOf("."));

			String newFileName = System.currentTimeMillis() + ext;
			logger.info(fileName + " -> " + newFileName);

			try {
				byte[] bytes = photo.getBytes(); 
				Path path = Paths.get(file_root + newFileName); 
				Files.write(path, bytes);
				projectDAO.revFileWrite(idx,newFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public List<ReviewDTO> revList(String pro_idx,int limit) {
		return projectDAO.revList(pro_idx,limit);
	}

	public int revDel(String rev_idx) {
		return	projectDAO.revDel(rev_idx);
	}

	public Map<String, Object> list(int currPage, int pagePerCnt, String pro_idx) {
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<ProjectDTO> list = projectDAO.appListCall(start,pagePerCnt,pro_idx);
		logger.info("service_pro_idx = " +pro_idx);
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", projectDAO.allCount(pagePerCnt,pro_idx));
		logger.info("tatalPage = " + projectDAO.allCount(pagePerCnt,pro_idx));
		return result;
	}

	public void likeDo(String pro_idx, String msg, int mem_idx) {
		if (msg.equals("좋아요")) {
			projectDAO.likeDo(pro_idx,mem_idx);
		}
		if(msg.equals("좋아요 취소")){
			projectDAO.likeCancle(pro_idx,mem_idx);
		}
		if(msg.equals("즐겨찾기")){
			projectDAO.favorite(pro_idx,mem_idx);
		}
		if(msg.equals("즐겨찾기 취소")){
			projectDAO.favoriteCancle(pro_idx,mem_idx);
		}
		
	}

	public Map<String, Object> adminList(String category, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		List<ProjectDTO> list = projectDAO.adminList(category,start,pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", projectDAO.adminAllCount(category,pagePerCnt));
		
		return result;
	}

	public Map<String, Object> search(String keyWord, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		List<ProjectDTO> list = projectDAO.search(keyWord, start, pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", projectDAO.searchAllCount(keyWord, pagePerCnt));
		logger.info(projectDAO.searchAllCount(keyWord, pagePerCnt) + "asdfasd");
		return result;
	}

	public String stateCheck(String pro_idx) {
		return projectDAO.stateCheck(pro_idx);
	}

	public void agree(String pro_idx) {
		projectDAO.agree(pro_idx);
		projectDAO.agreeHis(pro_idx);
		
	}

	public void refuse(String pro_idx, String refuseContent) {
		projectDAO.refuse(pro_idx);
		projectDAO.refuseHis(pro_idx,refuseContent);
	}

	public void proDel(String pro_idx, String reportContent) {
		projectDAO.proDel(pro_idx);
		projectDAO.proDelHis(pro_idx, reportContent);
		int[] appList = projectDAO.appList(pro_idx);
		logger.info("appList : {}", Arrays.toString(appList));
		
		for (int mem_idx :  appList) {
			projectDAO.moneyRefund(mem_idx, pro_idx);
			projectDAO.delCashHis(mem_idx, pro_idx);
			projectDAO.delMileHis(mem_idx, pro_idx);
			projectDAO.fundingCancle(mem_idx, pro_idx);
		} 
	}

	public void stateChange(String pro_idx, String state) {
		projectDAO.stateChange(pro_idx, state);
	}
		
	public void report(String pro_idx, String repContent, int mem_idx) {
		projectDAO.report(pro_idx,repContent,mem_idx);
	}


}
