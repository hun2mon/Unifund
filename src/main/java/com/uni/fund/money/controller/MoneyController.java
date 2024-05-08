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
	public String chargeGo(HttpSession session, Model model) {
		String page = "./member/login";
		if (session.getAttribute("mem_id") != null) {
			page = "money/cashCharge";
		} else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		}
		return page;
	}
	
	@RequestMapping(value = "/money/charge.do")
	public String chargeDo(String cashCharge, HttpSession session) {
		logger.info("charge요청 들어옴");
		logger.info("cashCharge : {}", cashCharge);
		int mem_idx = (int) session.getAttribute("mem_idx");
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
	
	@RequestMapping(value = "/money/mileageList.go")
	public String mileageListGo(String mem_idx, Model model) {
		logger.info("mem_idx : {}", mem_idx );
		int mem_mileage = moneyService.selectMileage(mem_idx);
		model.addAttribute("mem_mileage", mem_mileage);
		return "money/mileageList";
	}
	
	@RequestMapping(value = "/money/cashList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cashListCall(String mem_idx,String year, String month,String page,String cnt){
		String serchMonth = "%" + month + "%";
		String serchYear = year + "%";
		String day = year + "-" + month + "%";
		logger.info("page : {}", page);
		logger.info("cnt : {}", cnt);
		logger.info("year : {}", year);
		logger.info("month:{}",month);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (!month.equals("전체")&&year.equals("전체")) {
			map = moneyService.filterListCall(mem_idx,serchMonth,currPage,pagePerCnt);
		} else if (month.equals("전체")&&!year.equals("전체")) {
			map = moneyService.filterListCall(mem_idx,serchYear,currPage,pagePerCnt);	
		}else if(!month.equals("전체")&&!year.equals("전체")){
			map = moneyService.filterListCall(mem_idx,day,currPage,pagePerCnt);	
		}else {
			logger.info("month:{}",month);
			map = moneyService.cashListCall(mem_idx,month,currPage,pagePerCnt);
		}
		return map;
	}
	
	@RequestMapping(value = "/money/mileageList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mileageListCall(String mem_idx,String year, String month,String page,String cnt){
		String serchMonth = "%" + month + "%";
		String serchYear = year + "%";
		String day = year + "-" + month + "%";
		logger.info("page : {}", page);
		logger.info("cnt : {}", cnt);
		logger.info("year : {}", year);
		logger.info("month:{}",month);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (!month.equals("전체")&&year.equals("전체")) {
			map = moneyService.mileFilterListCall(mem_idx,serchMonth,currPage,pagePerCnt);
		} else if (month.equals("전체")&&!year.equals("전체")) {
			map = moneyService.mileFilterListCall(mem_idx,serchYear,currPage,pagePerCnt);	
		}else if(!month.equals("전체")&&!year.equals("전체")){
			map = moneyService.mileFilterListCall(mem_idx,day,currPage,pagePerCnt);	
		}else {
			logger.info("month:{}",month);
			map = moneyService.mileageListCall(mem_idx,month,currPage,pagePerCnt);
		}
		return map;
	}
	
	@RequestMapping(value = "/money/adminCashList.go")
	public String adminCashListGo(HttpSession session) {
		String page = "member/login";
		if (session.getAttribute("mem_id") != null) {
			page = "money/adminCashList";
		}
		return page;
	}
	
	@RequestMapping(value = "/money/adminMileageList.go")
	public String adminMileageListGo(HttpSession session) {
		String page = "member/login";
		if (session.getAttribute("mem_id") != null) {
			page = "money/adminMileageList";
		}
		return page;
	}
	
	@RequestMapping(value = "/money/allCashList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> allCashListCall(String year, String month,String page,String cnt,String keyWord){
		String serchMonth = "%-" + month + "%";
		String serchYear = year + "%";
		String day = year + "-" + month + "%";
		logger.info("keyWord : {}", keyWord);
		logger.info("page : {}", page);
		logger.info("cnt : {}", cnt);
		logger.info("year : {}", year);
		logger.info("month:{}",month);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (!month.equals("전체")&&year.equals("전체")) {
			map = moneyService.allFilterListCall(serchMonth,currPage,pagePerCnt,keyWord);
		} else if (month.equals("전체")&&!year.equals("전체")) {
			map = moneyService.allFilterListCall(serchYear,currPage,pagePerCnt,keyWord);	
		}else if(!month.equals("전체")&&!year.equals("전체")){
			map = moneyService.allFilterListCall(day,currPage,pagePerCnt,keyWord);	
		}else {
			logger.info("month:{}",month);
	 		map = moneyService.allCashListCall(month,currPage,pagePerCnt,keyWord);
		}
 		return map;
	}
	
	@RequestMapping(value = "/money/allMileageList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> allMileageListCall(String year, String month,String page,String cnt,String keyWord){
		String serchMonth = "%-" + month + "%";
		String serchYear = year + "%";
		String day = year + "-" + month + "%";
		logger.info("keyWord : {}", keyWord);
		logger.info("page : {}", page);
		logger.info("cnt : {}", cnt);
		logger.info("year : {}", year);
		logger.info("month:{}",month);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (!month.equals("전체")&&year.equals("전체")) {
			map = moneyService.allMileFilterListCall(serchMonth,currPage,pagePerCnt,keyWord);
		} else if (month.equals("전체")&&!year.equals("전체")) {
			map = moneyService.allMileFilterListCall(serchYear,currPage,pagePerCnt,keyWord);	
		}else if(!month.equals("전체")&&!year.equals("전체")){
			map = moneyService.allMileFilterListCall(day,currPage,pagePerCnt,keyWord);	
		}else {
			logger.info("month:{}",month);
	 		map = moneyService.allMileListCall(month,currPage,pagePerCnt,keyWord);
		}
 		return map;
	}
	
	
	
	
	
	
	
}
