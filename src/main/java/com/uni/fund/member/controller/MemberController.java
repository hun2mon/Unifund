package com.uni.fund.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.fund.member.dto.MemberDTO;
import com.uni.fund.member.service.MemberService;
import com.uni.fund.project.dto.ProjectDTO;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService memberService;
	
	@RequestMapping(value = "/user/adminMemberList.go")
	public String adminMemberList() {
	    return "/user/adminMemberList";
	}
	
	@RequestMapping(value = "/user/adminMemberList.ajax")
	@ResponseBody
	public Map<String, Object> adminMemberListAjax(@RequestParam Map<String,Object> param,Model model) {
		int pg = param.get("pg") == null ? 1 : Integer.parseInt((String) param.get("pg"));
		String searchType = (String)param.get("searchType");
		String keyword = (String)param.get("keyword");
		logger.info("pg::"+pg);
		logger.info("searchType::"+searchType);
		logger.info("keyword::"+keyword);
		
		int showList = 20;
		int spaceBlock = 5;
		param.put("start", (pg-1) * showList);
		int total = memberService.memberTotalCnt(param);
		int totalP = (total + (showList-1)) / showList;	
		int startPage = (pg-1) / spaceBlock*spaceBlock + 1;	
		int endPage= startPage + (spaceBlock-1);
		if(endPage > totalP) endPage = totalP;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberList",memberService.memberListAjax(param));
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalP", totalP);

		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("blockScale", spaceBlock);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchType", searchType);

		return map;
	}
	
}
