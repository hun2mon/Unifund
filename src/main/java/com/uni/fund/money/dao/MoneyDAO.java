package com.uni.fund.money.dao;

import java.util.List;

import com.uni.fund.money.dto.MoneyDTO;

public interface MoneyDAO {

	int chargeDo(String cashCharge, String mem_idx);

	void chargeHis(String cashCharge, String mem_idx);

	List<MoneyDTO> cashListCall(String mem_idx, String filterYear, int start, int pagePerCnt);
	
	List<MoneyDTO>mileageListCall(String mem_idx, String filterYear, int start, int pagePerCnt);

	int selectCash(String mem_idx);

	List<MoneyDTO> yearCall();

	int allCount(int pagePerCnt, String mem_idx);

	int filterAllCount(int pagePerCnt, String mem_idx, String serchMonth);
	
	int mileAllCount(int pagePerCnt, String mem_idx);

	int mileFilterAllCount(int pagePerCnt, String mem_idx, String serchMonth);

	int selectMileage(String mem_idx);

}
