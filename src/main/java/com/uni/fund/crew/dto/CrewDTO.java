package com.uni.fund.crew.dto;

import java.sql.Date;

public class CrewDTO {
	private int crew_idx;
	private int mem_idx;
	private String crew_name;
	private String crew_exp;
	private String crew_con;
	private int crew_num;
	private String crew_logo;
	private String crew_link;
	private String crew_local;
	private String crew_histroy;
	private String crew_status;
	private Date crew_date;
	private String pho_name;

	
	public int getCrew_idx() {
		return crew_idx;
	}
	public void setCrew_idx(int crew_idx) {
		this.crew_idx = crew_idx;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getCrew_name() {
		return crew_name;
	}
	public void setCrew_name(String crew_name) {
		this.crew_name = crew_name;
	}
	public String getCrew_exp() {
		return crew_exp;
	}
	public void setCrew_exp(String crew_exp) {
		this.crew_exp = crew_exp;
	}
	public String getCrew_con() {
		return crew_con;
	}
	public void setCrew_con(String crew_con) {
		this.crew_con = crew_con;
	}
	public int getCrew_num() {
		return crew_num;
	}
	public void setCrew_num(int crew_num) {
		this.crew_num = crew_num;
	}
	public String getCrew_logo() {
		return crew_logo;
	}
	public void setCrew_logo(String crew_logo) {
		this.crew_logo = crew_logo;
	}
	public String getCrew_link() {
		return crew_link;
	}
	public void setCrew_link(String crew_link) {
		this.crew_link = crew_link;
	}
	public String getCrew_local() {
		return crew_local;
	}
	public void setCrew_local(String crew_local) {
		this.crew_local = crew_local;
	}
	public String getCrew_histroy() {
		return crew_histroy;
	}
	public void setCrew_histroy(String crew_histroy) {
		this.crew_histroy = crew_histroy;
	}
	public String getCrew_status() {
		return crew_status;
	}
	public void setCrew_status(String crew_status) {
		this.crew_status = crew_status;
	}
	public Date getCrew_date() {
		return crew_date;
	}
	public void setCrew_date(Date crew_date) {
		this.crew_date = crew_date;
	}
	public String getPho_name() {
		return pho_name;
	}
	public void setPho_name(String pho_name) {
		this.pho_name = pho_name;
	}

}
