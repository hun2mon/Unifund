package com.uni.fund.money.controller;

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
	
	@RequestMapping(value = "/money/cashList.go")
	public String cashListGo(String mem_idx, Model model) {
		logger.info("mem_idx : {}", mem_idx );
		int mem_cash = moneyService.selectCash(mem_idx);
		model.addAttribute("mem_cash", mem_cash);
		return "money/cashList";
	}
	
	@RequestMapping(value = "/money/cashList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cashListCall(String mem_idx,String year, String month){
		Map<String, Object> map = moneyService.cashListCall(mem_idx,year,month);
		logger.info("year:{}", year);
		logger.info("month:{}", month);
		return map;
	}
	
}
