package com.uni.fund.money.dto;

import java.sql.Date;

public class MoneyDTO {
	private int cash_idx;
	private int mem_idx;
	private String cash_content;
	private int cash_amount;
	private int ref_idx;
	private String cash_division;
	private Date cash_date;
	private int year;
	
	
	public int getCash_idx() {
		return cash_idx;
	}
	public void setCash_idx(int cash_idx) {
		this.cash_idx = cash_idx;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getCash_content() {
		return cash_content;
	}
	public void setCash_content(String cash_content) {
		this.cash_content = cash_content;
	}
	public int getCash_amount() {
		return cash_amount;
	}
	public void setCash_amount(int cash_amount) {
		this.cash_amount = cash_amount;
	}
	public int getRef_idx() {
		return ref_idx;
	}
	public void setRef_idx(int ref_idx) {
		this.ref_idx = ref_idx;
	}
	public String getCash_division() {
		return cash_division;
	}
	public void setCash_division(String cash_division) {
		this.cash_division = cash_division;
	}
	public Date getCash_date() {
		return cash_date;
	}
	public void setCash_date(Date cash_date) {
		this.cash_date = cash_date;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
}
