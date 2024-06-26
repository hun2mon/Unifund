package com.uni.fund.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.fund.admin.dto.ReportDTO;
import com.uni.fund.admin.service.ReportService;

@Controller
public class ReportController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportService reportService;
	
	
	@RequestMapping(value = "/report/adminList.go")
	public String adminListGo(HttpSession session) {
		String memId = (String) session.getAttribute("mem_id");
		String page = "redirect:/member/login.go";
		if (memId != null) {
			page = "report/adminList";
		}
		
		return page;
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
	
	@RequestMapping(value = "/report/search.ajax")
	@ResponseBody
	public Map<String, Object> search(String keyWord, String page, String cnt){
		
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = reportService.search(keyWord,currPage,pagePerCnt);
		return map;
	}
	
	@RequestMapping(value = "/report/adminDetail.go")
	public String adminDtailGo(String rep_idx,Model model,HttpSession session) {
		logger.info("adminDetailGo 요청");
		logger.info("rep_idx : ",rep_idx);
		String memId = (String) session.getAttribute("mem_id");
		String page = "redirect:/member/login.go";
		if (memId != null) {
			page = "report/adminDetail";
			ReportDTO detail = reportService.adminDetail(rep_idx);
			model.addAttribute("detail",detail);
		}
		return page;
	}
	
	@RequestMapping(value = "/report/transContent" ,method = RequestMethod.POST)
	public String transContent(String transContent, int refIdx, int cateRefIdx, String cate,String state,Model model,HttpSession session) {
		logger.info("refIdx : " +refIdx);
		logger.info("transContent : " +transContent);
		logger.info("cateRefIdx : " +cateRefIdx);
		logger.info("cate : " +cate);
		logger.info("state : " +state);
		
		int mem_idx = (int) session.getAttribute("mem_idx");
		
		if (state.equals("미처리")) {
			reportService.transContent(refIdx,mem_idx,transContent,cateRefIdx,cate);			
		}else {
			reportService.transContentUpdate(transContent,refIdx);		
		}
		
		return "redirect:/report/adminDetail.go?rep_idx="+refIdx;
	}
}
