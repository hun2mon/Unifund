package com.uni.fund.project.dto;

import java.sql.Date;

public class ProjectDTO {
	
	private int pro_idx;
	private int mem_idx;
	private int cate_idx;
	private String pro_title;
	private String pro_content;
	private Date pro_deadline;
	private Date pro_startdate;
	private Date pro_regdate;
	private String rew_name;
	private String pro_state;
	private int ori_price;
	private int rew_price;
	private int rew_max;
	private String pro_phone;
	private String pro_tos;
	
	public int getPro_idx() {
		return pro_idx;
	}
	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public int getCate_idx() {
		return cate_idx;
	}
	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}
	public String getPro_title() {
		return pro_title;
	}
	public void setPro_title(String pro_title) {
		this.pro_title = pro_title;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
	public Date getPro_deadline() {
		return pro_deadline;
	}
	public void setPro_deadline(Date pro_deadline) {
		this.pro_deadline = pro_deadline;
	}
	public Date getPro_startdate() {
		return pro_startdate;
	}
	public void setPro_startdate(Date pro_startdate) {
		this.pro_startdate = pro_startdate;
	}
	public Date getPro_regdate() {
		return pro_regdate;
	}
	public void setPro_regdate(Date pro_regdate) {
		this.pro_regdate = pro_regdate;
	}
	public String getRew_name() {
		return rew_name;
	}
	public void setRew_name(String rew_name) {
		this.rew_name = rew_name;
	}
	public String getPro_state() {
		return pro_state;
	}
	public void setPro_state(String pro_state) {
		this.pro_state = pro_state;
	}
	public int getOri_price() {
		return ori_price;
	}
	public void setOri_price(int ori_price) {
		this.ori_price = ori_price;
	}
	public int getRew_price() {
		return rew_price;
	}
	public void setRew_price(int rew_price) {
		this.rew_price = rew_price;
	}
	public int getRew_max() {
		return rew_max;
	}
	public void setRew_max(int rew_max) {
		this.rew_max = rew_max;
	}
	public String getPro_phone() {
		return pro_phone;
	}
	public void setPro_phone(String pro_phone) {
		this.pro_phone = pro_phone;
	}
	public String getPro_tos() {
		return pro_tos;
	}
	public void setPro_tos(String pro_tos) {
		this.pro_tos = pro_tos;
	}

}
