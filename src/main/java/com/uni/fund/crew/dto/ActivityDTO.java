package com.uni.fund.crew.dto;

public class ActivityDTO {	
	
	private int crew_activity_details_idx;
	private String activity_content;
	private int crew_idx;
	private int mem_idx;
	private String pho_name;
	
	public int getCrew_activity_details_idx() {
		return crew_activity_details_idx;
	}
	public void setCrew_activity_details_idx(int crew_activity_details_idx) {
		this.crew_activity_details_idx = crew_activity_details_idx;
	}
	public String getActivity_content() {
		return activity_content;
	}
	public void setActivity_content(String activity_content) {
		this.activity_content = activity_content;
	}
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
	public String getPho_name() {
		return pho_name;
	}
	public void setPho_name(String pho_name) {
		this.pho_name = pho_name;
	}
}
