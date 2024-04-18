package com.uni.fund.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.fund.admin.dto.AnnouncementDTO;
import com.uni.fund.admin.service.AnnouncementService;

@Controller
public class AnnouncementController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AnnouncementService annService;
	
	
	@RequestMapping("/annList")
	public String annList(Model model) {
		logger.info("annList요청");
		List<AnnouncementDTO> annList = annService.annList();
		model.addAttribute("annList",annList);
		return "announcement/annList";
	}
	
	@RequestMapping(value="annList.ajax")
	@ResponseBody
	public Map<String, Object> listCall(String page, String cnt) {
		logger.info("listAjax in");
		logger.info("요청페이지:" + page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		Map<String, Object> map = annService.annList(currPage,pagePerCnt);
		return map;
	}
	
}
