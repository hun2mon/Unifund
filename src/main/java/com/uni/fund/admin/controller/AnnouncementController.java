package com.uni.fund.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.admin.dto.AnnouncementDTO;
import com.uni.fund.admin.service.AnnouncementService;

@Controller
public class AnnouncementController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AnnouncementService annService;

	@RequestMapping("/announcement/list.go")
	public String annList(Model model) {
		logger.info("annList요청");
		return "announcement/annList";
	}

	@RequestMapping(value = "/announcement/annList.ajax")
	@ResponseBody
	public Map<String, Object> listCall(String page, String cnt) {
		logger.info("listAjax in");
		logger.info("요청페이지:" + page);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		Map<String, Object> map = annService.annList(currPage, pagePerCnt);
		return map;
	}

	@RequestMapping("/announcement/adminList.go")
	public String adminList(Model model) {
		logger.info("adminList요청");
		return "announcement/adminList";
	}

	@RequestMapping(value = "/announcement/adminList.ajax")
	@ResponseBody
	public Map<String, Object> listCall2(String page, String cnt) {
		logger.info("listAjax in");
		logger.info("요청페이지:" + page);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		Map<String, Object> map = annService.adminList(currPage, pagePerCnt);
		return map;
	}

	@RequestMapping(value = "/announcement/annListSearch.ajax")
	@ResponseBody
	public Map<String, Object> annListSearch(String keyWord, String page, String cnt) {

		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		logger.info("keyword:::" + keyWord);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);

		Map<String, Object> map = annService.annListSearch(keyWord, currPage, pagePerCnt);
		return map;
	}

	@RequestMapping(value = "/announcement/adminListSearch.ajax")
	@ResponseBody
	public Map<String, Object> adminListSearch(String keyWord, String page, String cnt) {

		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		logger.info("keyword:::" + keyWord);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);

		Map<String, Object> map = annService.adminListSearch(keyWord, currPage, pagePerCnt);
		return map;
	}

	@RequestMapping(value = "/announcement/adminAnnForm.go")
	public String annWriteForm(HttpSession session) {
		logger.info(":: annWriteForm IN ::");
		String page = "redirect:/member/login.go";

		if (session.getAttribute("mem_idx") != null) {
			return "announcement/adminAnnForm";
		}
		return page;
	}

	@RequestMapping(value = "/announcement/adminAnnForm.do")
	public String adminAnnForm(MultipartFile noti_photo, HttpSession session, @RequestParam Map<String, String> param,
			Model model) {
		logger.info(":: annWrite CONTROLLER IN ::");
		logger.info("params ={}", param);
		String page = "redirect:/announcement/adminList.go";
		String msg = "등록실패";

		int mng_idx = session.getAttribute("mem_idx") == null ? 0 : (int) session.getAttribute("mem_idx");
		logger.info("mng_idx" + mng_idx);
		logger.info("noti_top" + param.get("noti_top"));
		param.put("mng_idx", Integer.toString(mng_idx));
		int row = annService.adminAnnForm(noti_photo, param, session);
		if (row == 1) {
			logger.info("송승헌 noti_idx=" + session.getAttribute("noti_idx"));
			page = "redirect:/announcement/annDetail.go?noti_idx=" + session.getAttribute("noti_idx");
			msg = "작성환료되었습니다.";

			session.removeAttribute("noti_idx");
			model.addAttribute("msg", msg);
		}

		logger.info("adminAnnForm controller end");

		return page;
	}

	@RequestMapping(value = "/announcement/delete.ajax", method = RequestMethod.POST)
	@ResponseBody
	public String annDel(@RequestParam("notiIdxList") List<Integer> notiIdxList) {
		// 공지사항 삭제 기능 구현
		annService.annDel(notiIdxList);
		return "success";
	}

	@RequestMapping(value = "/announcement/annDetail.go")
	public String annDetail(Model model, HttpSession session, Integer noti_idx) {
		logger.info("상세보기 요청");


		logger.info("noti_idx=" + noti_idx);
		AnnouncementDTO announcementDTO = annService.annDetail(noti_idx);
		// logger.info("UserInfo :{}",announcementDTO.toString());
		String notiPhoto = annService.notiPhoto(noti_idx);
		logger.info("PhoName :" + notiPhoto);
		model.addAttribute("announcementDTO", announcementDTO);
		model.addAttribute("noti_idx",noti_idx);
		model.addAttribute("notiPhoto", notiPhoto);

		return "announcement/annDetail";
	}

	@RequestMapping(value = "/announcement/update.go")
	public String annUpdateForm(Model model, HttpSession session, Integer noti_idx) {
	    logger.info(":: annUpdateForm IN ::");

	    // 해당 공지사항의 정보를 가져오는 서비스 메서드 호출
	    logger.info("noti_idx"+noti_idx);
	    AnnouncementDTO announcementDTO = annService.annDetail(noti_idx);
	    String notiPhoto = annService.notiPhoto(noti_idx);
	    announcementDTO.setNoti_idx(noti_idx);
	    // 모델에 공지사항 정보와 사진 정보를 추가하여 뷰로 전달
	    model.addAttribute("announcementDTO", announcementDTO);
	    model.addAttribute("notiPhoto", notiPhoto);

	    return "announcement/adminAnnUpdate";
	}
	
	@RequestMapping(value = "/announcement/update.do")
	public String annUpdate(MultipartFile noti_photo, HttpSession session, @RequestParam Map<String, String> param, Model model) {
	    logger.info(":: annUpdate CONTROLLER IN ::");
	    logger.info("params ={}", param);
	    String page = "announcement/adminAnnUpdate";
	    String msg = "수정 실패";

	    int mng_idx = session.getAttribute("mem_idx") == null ? 0 : (int) session.getAttribute("mem_idx");
	    logger.info("mng_idx" + mng_idx);
	    logger.info("noti_top" + param.get("noti_top"));
	    param.put("mng_idx", Integer.toString(mng_idx));
	    
	    // 공지사항 수정을 위한 서비스 메서드 호출
	    int row = annService.adminAnnUpdate(noti_photo, param, session);
	    logger.info("row"+row);
	    if (row == 1) {
	        page = "redirect:/announcement/annDetail.go?noti_idx=" + param.get("noti_idx");
	        msg = "수정 완료";
	    }

	    model.addAttribute("msg", msg);
	    logger.info("annUpdate controller end");

	    return page;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
