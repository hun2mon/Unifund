package com.uni.fund.admin.dto;

import java.sql.Date;

public class QnaDTO {
	private int qna_idx;
	private int mem_idx;
	private String mem_id;
	private String qna_title;
	private String qna_show;
	private Date qna_date;
	private int qna_pass;
	private String qna_status;
	
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_show() {
		return qna_show;
	}
	public void setQna_show(String qna_show) {
		this.qna_show = qna_show;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(int qna_pass) {
		this.qna_pass = qna_pass;
	}
	public String getQna_status() {
		return qna_status;
	}
	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	
	
}
