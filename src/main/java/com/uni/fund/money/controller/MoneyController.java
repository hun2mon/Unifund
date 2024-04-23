package com.uni.fund.money.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.fund.money.service.MoneyService;

@Controller
public class MoneyController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MoneyService moneyService;
	
	@RequestMapping(value = "/money/charge.go")
	public String chargeGo() {
		
		return "money/cashCharge";
	}
	
	@RequestMapping(value = "/money/charge.do")
	public String chargeDo(String cashCharge, HttpSession session) {
		logger.info("charge요청 들어옴");
		logger.info("cashCharge : {}", cashCharge);
		String mem_idx = (String) session.getAttribute("memIdx");
		logger.info("mem_idx : {}", mem_idx);
		moneyService.chargeDo(cashCharge, mem_idx);
		return "mypage/profile";
	}
	
	@RequestMapping(value = "/money/close.ajax")
	@ResponseBody
	public Map<String, Object> close(){
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
}
