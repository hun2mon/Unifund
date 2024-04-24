package com.uni.fund.money.dao;

import java.util.List;

import com.uni.fund.money.dto.MoneyDTO;

public interface MoneyDAO {

	int chargeDo(String cashCharge, String mem_idx);

	void chargeHis(String cashCharge, String mem_idx);

	List<MoneyDTO> cashListCall(String mem_idx, String filterYear);

	int selectCash(String mem_idx);

	List<MoneyDTO> yearCall();

}
