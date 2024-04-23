package com.uni.fund.money.dao;

public interface MoneyDAO {

	int chargeDo(String cashCharge, String mem_idx);

	void chargeHis(String cashCharge, String mem_idx);

}
