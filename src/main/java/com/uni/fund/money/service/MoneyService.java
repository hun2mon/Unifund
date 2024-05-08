package com.uni.fund.money.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.money.dao.MoneyDAO;
import com.uni.fund.money.dto.MoneyDTO;

@Service
public class MoneyService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MoneyDAO moneyDAO;
	
	public void chargeDo(String cashCharge, int mem_idx) {
		int row = moneyDAO.chargeDo(cashCharge, mem_idx);
		if (row > 0) {
			moneyDAO.chargeHis(cashCharge, mem_idx);			
		}
	}

	public int selectCash(String mem_idx) {
		return moneyDAO.selectCash(mem_idx);
	}
	
	public int selectMileage(String mem_idx) {
		return moneyDAO.selectMileage(mem_idx);
	}
	
	public Map<String, Object> cashListCall(String mem_idx, String month, int currPage, int pagePerCnt) {
		logger.info("cashListCall");
		int start = (currPage-1) * pagePerCnt;
		
		List<MoneyDTO> list = moneyDAO.cashListCall(mem_idx,month,start,pagePerCnt);
		List<MoneyDTO> year = moneyDAO.yearCall();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("year", year);
		result.put("currPage", currPage);
		result.put("totalPages", moneyDAO.allCount(pagePerCnt,mem_idx));
		logger.info("tatalPage = " + moneyDAO.allCount(pagePerCnt,mem_idx));
		return result;
	}


	public Map<String, Object> filterListCall(String mem_idx, String serchMonth, int currPage, int pagePerCnt) {
		logger.info("filterListCall");
		int start = (currPage-1) * pagePerCnt;
		List<MoneyDTO> list = moneyDAO.cashListCall(mem_idx,serchMonth,start,pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", moneyDAO.filterAllCount(pagePerCnt,mem_idx,serchMonth));
		logger.info("tatalPage = " + moneyDAO.filterAllCount(pagePerCnt,mem_idx,serchMonth));
		return result;
	}
	
	public Map<String, Object> mileageListCall(String mem_idx, String month, int currPage, int pagePerCnt) {
		logger.info("mileageListCall");
		int start = (currPage-1) * pagePerCnt;
		
		List<MoneyDTO> list = moneyDAO.mileageListCall(mem_idx,month,start,pagePerCnt);
		List<MoneyDTO> year = moneyDAO.mileYearCall();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("year", year);
		result.put("currPage", currPage);
		result.put("totalPages", moneyDAO.mileAllCount(pagePerCnt,mem_idx));
		logger.info("tatalPage = " + moneyDAO.mileAllCount(pagePerCnt,mem_idx));
		return result;
	}
	
	public Map<String, Object> mileFilterListCall(String mem_idx, String serchMonth, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		List<MoneyDTO> list = moneyDAO.mileageListCall(mem_idx,serchMonth,start,pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", moneyDAO.mileFilterAllCount(pagePerCnt,mem_idx,serchMonth));
		logger.info("tatalPage = " + moneyDAO.mileFilterAllCount(pagePerCnt,mem_idx,serchMonth));
		return result;
	}

	public Map<String, Object> allCashListCall(String month, int currPage, int pagePerCnt, String keyWord) {
		int start = (currPage-1) * pagePerCnt;
		logger.info("allCashListCall");
		List<MoneyDTO> list = moneyDAO.allListCall(month,start,pagePerCnt,keyWord);
		List<MoneyDTO> year = moneyDAO.yearCall();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("year", year);
		result.put("currPage", currPage);
		result.put("totalPages", moneyDAO.allCashCount(pagePerCnt,keyWord));
		logger.info("tatalPage = " + moneyDAO.allCashCount(pagePerCnt,keyWord));
		return result;
	}

	public Map<String, Object> allFilterListCall(String serchMonth, int currPage, int pagePerCnt, String keyWord) {
		int start = (currPage-1) * pagePerCnt;
		logger.info("allFilterListCall");
		List<MoneyDTO> list = moneyDAO.allListCall(serchMonth,start,pagePerCnt,keyWord);
		Map<String, Object> result = new HashMap<String, Object>();
		logger.info("serchMonth : {}", serchMonth);
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", moneyDAO.allFilterAllCount(pagePerCnt,serchMonth,keyWord));
		logger.info("tatalPage = " + moneyDAO.allFilterAllCount(pagePerCnt,serchMonth,keyWord));
		return result;
	}
	
	public Map<String, Object> allMileListCall(String month, int currPage, int pagePerCnt, String keyWord) {
		int start = (currPage-1) * pagePerCnt;
		logger.info("allMileListCall");
		List<MoneyDTO> list = moneyDAO.allMileListCall(month,start,pagePerCnt,keyWord);
		List<MoneyDTO> year = moneyDAO.mileYearCall();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("year", year);
		result.put("currPage", currPage);
		result.put("totalPages", moneyDAO.allMileCount(pagePerCnt,keyWord));
		logger.info("tatalPage = " + moneyDAO.allMileCount(pagePerCnt,keyWord));
		return result;
	}

	public Map<String, Object> allMileFilterListCall(String serchMonth, int currPage, int pagePerCnt, String keyWord) {
		int start = (currPage-1) * pagePerCnt;
		List<MoneyDTO> list = moneyDAO.allMileListCall(serchMonth,start,pagePerCnt,keyWord);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", moneyDAO.allMileFilterAllCount(pagePerCnt,serchMonth,keyWord));
		logger.info("tatalPage = " + moneyDAO.allMileFilterAllCount(pagePerCnt,serchMonth,keyWord));
		return result;
	}



	
}
