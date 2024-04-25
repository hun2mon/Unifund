package com.uni.fund.admin.dto;

import java.sql.Date;

public class AnnouncementDTO {
	

	
	private int noti_idx;
	private String noti_title;
	private Date noti_date;
	private String noti_top;
	private String noti_content;
	private int mng_idx;
	private String mem_id;
	private String noti_status;
	private String mem_status;
	
	
	public int getNoti_idx() {
		return noti_idx;
	}
	public void setNoti_idx(int noti_idx) {
		this.noti_idx = noti_idx;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public String getNoti_top() {
		return noti_top;
	}
	public void setNoti_top(String noti_top) {
		this.noti_top = noti_top;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public int getMng_idx() {
		return mng_idx;
	}
	public void setMng_idx(int mng_idx) {
		this.mng_idx = mng_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getNoti_status() {
		return noti_status;
	}
	public void setNoti_status(String noti_status) {
		this.noti_status = noti_status;
	}
	public String getMem_status() {
		return mem_status;
	}
	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}
	
	
}