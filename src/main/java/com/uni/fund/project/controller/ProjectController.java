package com.uni.fund.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.uni.fund.project.dto.ProjectDTO;
import com.uni.fund.project.service.ProjectService;

@Controller
public class ProjectController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ProjectService projectService;
	
	@RequestMapping(value = "/detail")
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
	public String updateGo(String pro_idx) {
		logger.info("pro_idx {}",pro_idx);
		return "project/update";
	}
	
	@RequestMapping(value = "/fund.do", method = RequestMethod.POST)
	public String fundDo(@RequestParam Map<String,String> map) {
		logger.info("mem_idx : {}" , map);
		return "project/detail";
	}

}
