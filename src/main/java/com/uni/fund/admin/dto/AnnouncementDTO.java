package com.uni.fund.admin.dto;

import java.sql.Date;

public class AnnouncementDTO {
	

	
	private int noti_idx;
	private String noti_title;
	private Date noti_date;
	private String noti_top;
	
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

}
