package com.uni.fund.project.controller;

import java.util.HashMap;
import java.util.Map;

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
import com.uni.fund.project.service.ProjectService;

@Controller
public class ProjectController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ProjectService projectService;
	
	@RequestMapping(value = "/")
	public String detail(Model model) {
		ProjectDTO project = projectService.detail();
		model.addAttribute("project", project);
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
	public String updateGo(String pro_idx,Model model) {
		logger.info(":: updateGo CONTROLLER IN ::");
		logger.info("pro_idx {}",pro_idx);
		projectService.updateForm(pro_idx,model);
		return "project/update";
	}
	
	@RequestMapping(value = "/projectUpdate.do", method = RequestMethod.POST)
	public String updateProject(MultipartFile pro_main_photo, MultipartFile pro_photo, @RequestParam Map<String, String> param) {
		logger.info(":: updateProject CONTROLLER IN ::");
		logger.info("pro_idx:{}",param.get("pro_idx"));
		logger.info("pro_title:{}",param.get("pro_title"));
		String page = "redirect:/pro_update.go";
		
		int row = projectService.projectUpdate(pro_main_photo,pro_photo,param);
		if(row == 1 ) {
			page = "redirect:/";
			//page = "redirect:/detail?idx=" + param.get("idx");
		}
		return page;
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
	
	@RequestMapping(value = "/review.do", method = RequestMethod.POST)
	public String reviewWrite(MultipartFile photo, String revNum, String revContent, String pro_idx) {
		logger.info("photo : {}", photo);
		logger.info("revNum : {}", revNum);
		logger.info("revContent : {}", revContent);
		logger.info("pro_idx : {}", pro_idx);
		int mem_idx = 1;
		return "/";
	}

}
