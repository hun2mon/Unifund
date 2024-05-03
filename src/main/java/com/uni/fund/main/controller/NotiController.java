package com.uni.fund.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.fund.main.dto.NotiDTO;
import com.uni.fund.main.service.NotiService;

@Controller
public class NotiController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiService notiService;
	
	@RequestMapping(value = "/mainNotiList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> notiList(HttpSession session){
		int mem_idx = 0;			
		try {
			mem_idx = (int) session.getAttribute("mem_idx");		
		} catch (Exception e) {
			
		}
		logger.info("mem_idx = " + mem_idx);
		List<NotiDTO> list = notiService.notiList(mem_idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value = "/blindNoti.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> blindNorti(String noti_idx) {
		logger.info("noti_idx : {}", noti_idx);
		int row = notiService.blindNoti(noti_idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("row", row);
		logger.info("row : {}", row);
		return map;
	}
	
	
}
