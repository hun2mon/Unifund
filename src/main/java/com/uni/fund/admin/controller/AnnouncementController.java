package com.uni.fund.admin.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.admin.service.AnnouncementService;

@Controller
public class AnnouncementController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AnnouncementService annService;
	
	
	@RequestMapping("/annList.go")
	public String annList(Model model) {
		logger.info("annList요청");
		return "announcement/annList";
	}
	
	@RequestMapping(value="/annList.ajax")
	@ResponseBody
	public Map<String, Object> listCall(String page, String cnt) {
		logger.info("listAjax in");
		logger.info("요청페이지:" + page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		Map<String, Object> map = annService.annList(currPage,pagePerCnt);
		return map;
	}
	
	@RequestMapping(value = "/annListSearch.ajax")
	@ResponseBody
	public Map<String, Object> annListSearch(String keyWord, String page, String cnt){
		
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		logger.info("keyword:::"+ keyWord);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = annService.annListSearch(keyWord,currPage,pagePerCnt);
		return map;
	}
	



	@RequestMapping(value = "/annWrite")
	public String adminAnnForm(MultipartFile noti_photo,  @RequestParam Map<String, String> param, Integer mng_idx,Model model,String noti_title,String noti_content ) {
		
		
		
		logger.info("params ={}",param);
		String page = "announcement/adminAnnForm";
		String msg = "등록실패";
		mng_idx = 1;
		
		

		int row = annService.adminAnnForm(noti_photo,param,mng_idx);
		
		
		if(row==1) {
			page = "redirect:/notiDetail";
			msg = "작성환료되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		
		return page;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}