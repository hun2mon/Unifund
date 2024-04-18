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
