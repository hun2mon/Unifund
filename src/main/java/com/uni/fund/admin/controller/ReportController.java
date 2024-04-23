package com.uni.fund.admin.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.fund.admin.service.ReportService;

@Controller
public class ReportController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportService reportService;
	
	@RequestMapping(value = "/report/adminList.go")
	public String adminListGo() {
		return "report/adminList";
	}
	
	@RequestMapping(value = "/report/adminList.ajax")
	@ResponseBody
	public Map<String, Object> adminList(String category, String page, String cnt){
		logger.info("category : {}", category);
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = reportService.adminList(category,currPage,pagePerCnt);
		
		return map;
	}
	
	
}
