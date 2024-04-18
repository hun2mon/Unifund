package com.uni.fund.crew.controller;

import java.util.HashMap;
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

import com.uni.fund.crew.service.CrewService;

@Controller
public class CrewController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CrewService crewService;
	
	
	@RequestMapping(value="/crewCreate.go")
	public String crewCreateGo() {
		logger.info("crewCreate 들어왔다.");
		return "crew/crewCreateForm";
	}
	
	@RequestMapping(value="/crewCreate.do", method = RequestMethod.POST)
	public String crewCreateDo(MultipartFile[] photos ,HttpSession session, @RequestParam Map<String, String>param) {
		logger.info("create 들어왔다.");
		
		String page="redirect:/crewList";
		int row = crewService.crewCreateDo(photos,param);
		if(row < 1) {
			page ="crew/crewCreateForm";
		}
		
		return page;
	}
	
	@RequestMapping(value="/crewOverlay.do")
	@ResponseBody
	public Map<String, Object> crewOverlay(String crew_name){
		logger.info("crew_name =  "+crew_name);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("use",crewService.crewOverlay(crew_name));
		return map;
	}
	
	
}
