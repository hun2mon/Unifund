package com.uni.fund.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.uni.fund.project.dto.ProjectDTO;
import com.uni.fund.project.dto.ReviewDTO;
import com.uni.fund.project.service.ProjectService;

@Controller
public class ProjectController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ProjectService projectService;
	
	@RequestMapping(value = "/project/appList.go")
	public String appListGo() {
		return "project/appList";
	}
	
	@RequestMapping(value = "/project/appList.ajax", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> appListCall(String page, String cnt){
		logger.info("appListCall요청 들어옴");
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수 : " + cnt);
		logger.info("요청 페이지 : " + page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = projectService.list(currPage,pagePerCnt);
		return map;
	}
	
	@RequestMapping(value = "/")
	public String detail(Model model, HttpSession session, String row) {
		session.setAttribute("loginId", "dds");
		session.setAttribute("memIdx", "1");
		model.addAttribute("mem_idx",1);
		String memIdx = (String) session.getAttribute("memIdx");
		ProjectDTO project = projectService.detail(memIdx);
		model.addAttribute("project", project);
		logger.info("memIdx : " + memIdx);
		logger.info("row = " + row);
		if (row != null) {
			model.addAttribute("msg", "리뷰가 정상적으로 삭제되었습니다.");
		}
		return "project/detail";
	}
	
	@RequestMapping(value="/createForm")
	public String projectCreateForm() {
		logger.info(":: projectCreateForm IN ::");
		return "project/create";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String projectCreate(MultipartFile pro_main_photo, MultipartFile pro_photo,@RequestParam Map<String, String> param, Integer mem_idx,Model model) {
		logger.info(":: projectCreate CONTROLLER IN ::");
		logger.info(":: Create param:{}",param);
		String page = "project/create";
		String msg = "등록실패";
		mem_idx = 1;
		
		int row = projectService.projectCreate(pro_main_photo,pro_photo,param,mem_idx);
		if(row == 1) {
			page = "redirect:/";
			msg = "등록완료되었습니다. 심사가 완료될때까지 기다려주세요.";

		}
		
		model.addAttribute("msg",msg);
		
		return page;
	}
	
	@RequestMapping(value = "/pro_update.go")
	public String updateGo(String pro_idx) {
		logger.info("pro_idx {}",pro_idx);
		return "project/update";
	}
	
	@RequestMapping(value = "/fund.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fundDo(@RequestParam Map<String,String> map) {
		logger.info("mem_idx : {}" , map);
		Map<String, Object> mapMap = new HashMap<String, Object>();
		projectService.funding(map);
		return mapMap;
	}
	
	@RequestMapping(value = "/fund_cancle.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> fundCancle(@RequestParam Map<String,String> map) {
		logger.info("mem_idx : {}" , map);
		Map<String, Object> mapMap = new HashMap<String, Object>();
		projectService.fundingCancle(map);
		return mapMap;
	}
	
	@RequestMapping(value = "/review/write.do", method = RequestMethod.POST)
	public String reviewWrite(MultipartFile photo, @RequestParam Map<String,String> param, Model model) {
		String page = "redirect:/";
		logger.info("photo : {}", photo);
		logger.info("param : {}", param);
		int mem_idx = 1;
		int row = projectService.reviewDo(photo,param,mem_idx);
		logger.info("row : {}",row);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/review/list.ajax")
	@ResponseBody
	public Map<String, Object> reviewAjax(String pro_idx,int limit){
		logger.info("pro_idx : {}" , pro_idx);
		logger.info("limit : {}" , limit);
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReviewDTO> list = projectService.revList(pro_idx,limit);
		map.put("list", list);
		logger.info("list : {}",list);
		return map;
	}
	
	@RequestMapping(value = "/review/delete.do")
	public String revDel(String rev_idx) {
		logger.info("rev_idx :{}", rev_idx);
		String page = "redirect:/";
		int row = 0;
		row = projectService.revDel(rev_idx);
		if (row >0) {
			page = "redirect:/?row=" + row;
		}
		return page;
	}
	
	@RequestMapping(value = "/project/like.do")
	@ResponseBody
	public Map<String, Object> likeDo(HttpSession session, String pro_idx, String msg){
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("msg : {}", msg);
		logger.info("pro_idx : {}", pro_idx);
		logger.info("session : {}", session.getAttribute("memIdx"));
		String mem_idx = (String) session.getAttribute("memIdx");
		projectService.likeDo(pro_idx,msg,mem_idx);
		logger.info("session : {}", session.getAttribute("memIdx"));
		return map;
	}
	
	@RequestMapping(value = "/project/delForm.go")
	public String delFormGo() {
		return "project/delForm";
	}
	
	@RequestMapping(value = "/project/delete.do", method = RequestMethod.POST)
	public String proDel() {
		logger.info("del요청 들어옴");
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
