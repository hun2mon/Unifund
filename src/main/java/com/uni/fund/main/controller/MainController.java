package com.uni.fund.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.fund.crew.dto.CrewDTO;
import com.uni.fund.main.service.MainService;
import com.uni.fund.project.dto.ProjectDTO;
import com.uni.fund.project.service.ProjectService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MainService mainService;
	
	
	@RequestMapping(value = "/")
	public String main(Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/mainProList.ajax")
	@ResponseBody
	public Map<String, Object> mainproList() {
		List<ProjectDTO> list = mainService.mainProList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value = "/mainCrewList.ajax")
	@ResponseBody
	public Map<String, Object> mainCrewList() {
		List<CrewDTO> list = mainService.mainCrewList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
}
