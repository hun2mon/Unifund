package com.uni.fund.money.service;

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
	
	public void chargeDo(String cashCharge, String mem_idx) {
		int row = moneyDAO.chargeDo(cashCharge, mem_idx);
		if (row > 0) {
			moneyDAO.chargeHis(cashCharge, mem_idx);			
		}
	}

	public Map<String, Object> cashListCall(String mem_idx, String filterYear, String month) {
		String day = filterYear + "-" + month + "%";
		logger.info("day :{}", day);
		List<MoneyDTO> list = moneyDAO.cashListCall(mem_idx,day);
		List<MoneyDTO> year = moneyDAO.yearCall();
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("year", year);
		return result;
	}

	public int selectCash(String mem_idx) {
		return moneyDAO.selectCash(mem_idx);
	}
	
}
