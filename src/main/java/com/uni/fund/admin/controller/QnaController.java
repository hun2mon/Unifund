package com.uni.fund.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.fund.admin.service.QnaService;

@Controller
public class QnaController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired QnaService qnaService;
	
	@RequestMapping(value = "/qna/adminQnaList.go")
	public String adminListGo(HttpSession session) {
		 String memId = (String) session.getAttribute("mem_id");
		 String page = "redirect:/member/login.go";
			if (memId != null) {
				page ="qna/adminQnaList";
			}
	 	return page;
	}
	
	@RequestMapping(value = "/qna/adminQnaList.ajax")
	@ResponseBody
	public Map<String, Object> adminQnaList(String category, String page, String cnt){
		logger.info("category : {}", category);
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = qnaService.adminQnaList(category,currPage,pagePerCnt);
		
		return map;
	}
	
	@RequestMapping(value = "/qna/search.ajax")
	@ResponseBody
	public Map<String, Object> search(String keyWord, String page, String cnt){
		
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);

		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = qnaService.search(keyWord,currPage,pagePerCnt);
		return map;
	}
	
	@RequestMapping(value = "/qna/statusUpdate.do")
	public String statusUpdateDo(int qna_idx,String status) {
		logger.info("qna_idx : " +qna_idx);
		logger.info("status : " +status);
		
		qnaService.statusUpdate(qna_idx,status);
		
		return "redirect:/qna/adminQnaList.go";
	}
	
	@RequestMapping(value = "/qna/list.go")
	public String ListGo(HttpSession session) {
		 String memId = (String) session.getAttribute("mem_id");
		 String page = "redirect:/member/login.go";
			if (memId != null) {
				page = "qna/list";
			}
		
		return page;
	}
	
	@RequestMapping(value = "/qna/userQnaList.ajax")
	@ResponseBody
	public Map<String, Object> userQnaList(String category, String page, String cnt){
		logger.info("category : {}", category);
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = qnaService.userQnaList(category,currPage,pagePerCnt);
		
		return map;
	}
}
