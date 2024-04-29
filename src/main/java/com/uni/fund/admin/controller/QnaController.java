package com.uni.fund.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uni.fund.admin.service.QnaService;

@Controller
public class QnaController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired QnaService qnaService;
	
	
	
	
	@RequestMapping(value="/qna/create.go")
	public String writeForm() {
		return "qna/qnaForm";
	}
	
	@RequestMapping(value="/qna/create.do", method=RequestMethod.POST)
	public String qnaForm(HttpSession session, @RequestParam Map<String,String> param) {
		
		logger.info("param = {}",param);
		String page = "redirect:/member/login";
		if (session.getAttribute("mem_id") != null) {
			
			int row = qnaService.qnaForm(param);
			if(row>1)
				page = "qna/qnaDetail";
		}
		
		
		return page;
	}
	
	
}
