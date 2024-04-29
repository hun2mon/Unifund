package com.uni.fund.main.dto;

import java.sql.Date;

public class NotiDTO {
	private int noti_idx;
	private int mng_idx;
	private String noti_content;
	private Date noti_sendate;
	private String noti_status;
	
	public int getNoti_idx() {
		return noti_idx;
	}
	public void setNoti_idx(int noti_idx) {
		this.noti_idx = noti_idx;
	}
	public int getMng_idx() {
		return mng_idx;
	}
	public void setMng_idx(int mng_idx) {
		this.mng_idx = mng_idx;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public Date getNoti_sendate() {
		return noti_sendate;
	}
	public void setNoti_sendate(Date noti_sendate) {
		this.noti_sendate = noti_sendate;
	}
	public String getNoti_status() {
		return noti_status;
	}
	public void setNoti_status(String noti_status) {
		this.noti_status = noti_status;
	}

}
