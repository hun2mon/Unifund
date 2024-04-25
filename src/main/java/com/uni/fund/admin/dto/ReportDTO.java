package com.uni.fund.admin.dto;

import java.sql.Date;

public class ReportDTO {
	private int rep_idx;
	private int mem_idx;
	private int ref_idx;
	private String rep_content;
	private Date rep_date;
	private String rep_division;
	private String rns_state;
	private String mem_id;
	private String trans_content;
	
	
	public String getTrans_content() {
		return trans_content;
	}
	public void setTrans_content(String trans_content) {
		this.trans_content = trans_content;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getRep_idx() {
		return rep_idx;
	}
	public void setRep_idx(int rep_idx) {
		this.rep_idx = rep_idx;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public int getRef_idx() {
		return ref_idx;
	}
	public void setRef_idx(int ref_idx) {
		this.ref_idx = ref_idx;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public Date getRep_date() {
		return rep_date;
	}
	public void setRep_date(Date rep_date) {
		this.rep_date = rep_date;
	}
	public String getRep_division() {
		return rep_division;
	}
	public void setRep_division(String rep_division) {
		this.rep_division = rep_division;
	}
	public String getRns_state() {
		return rns_state;
	}
	public void setRns_state(String rns_state) {
		this.rns_state = rns_state;
	}
	
	
}
