package com.uni.fund.member.dto;

import java.sql.Date;

public class MemberDTO {
	private int mem_idx;
	private String mem_id;
    private String mem_pw;
    private String mem_name;
    private String mem_number;
    private String mem_gender;
    private String mem_email;
    private String mem_bank;
    private String mem_cor;
    private String mem_uni;
    private String mem_birth;
	private String mem_bankName;
    private Date mem_joindate;
    private String mem_status;
    private String mem_post;
    private String mem_addr;
    private String mem_detail;
    private int mem_cash;
    private int mem_mileage;
    private int ref_idx_cnt;
    private int stop_mem_idx;
    private Date create_date;
    
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_number() {
		return mem_number;
	}
	public void setMem_number(String mem_number) {
		this.mem_number = mem_number;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_bankName() {
		return mem_bankName;
	}
	public void setMem_bankName(String mem_bankName) {
		this.mem_bankName = mem_bankName;
	}
	public String getMem_bank() {
		return mem_bank;
	}
	public void setMem_bank(String mem_bank) {
		this.mem_bank = mem_bank;
	}
	public String getMem_cor() {
		return mem_cor;
	}
	public void setMem_cor(String mem_cor) {
		this.mem_cor = mem_cor;
	}
	public String getMem_uni() {
		return mem_uni;
	}
	public void setMem_uni(String mem_uni) {
		this.mem_uni = mem_uni;
	}
	public Date getMem_joindate() {
		return mem_joindate;
	}
	public void setMem_joindate(Date mem_joindate) {
		this.mem_joindate = mem_joindate;
	}
	public String getMem_status() {
		return mem_status;
	}
	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}
	public String getMem_post() {
		return mem_post;
	}
	public void setMem_post(String mem_post) {
		this.mem_post = mem_post;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_detail() {
		return mem_detail;
	}
	public void setMem_detail(String mem_detail) {
		this.mem_detail = mem_detail;
	}
	public int getMem_cash() {
		return mem_cash;
	}
	public void setMem_cash(int mem_cash) {
		this.mem_cash = mem_cash;
	}
	public int getMem_mileage() {
		return mem_mileage;
	}
	public void setMem_mileage(int mem_mileage) {
		this.mem_mileage = mem_mileage;
	}
	public int getStop_mem_idx() {
		return stop_mem_idx;
	}
	public void setStop_mem_idx(int stop_mem_idx) {
		this.stop_mem_idx = stop_mem_idx;
	}
	public int getRef_idx_cnt() {
		return ref_idx_cnt;
	}
	public void setRef_idx_cnt(int ref_idx_cnt) {
		this.ref_idx_cnt = ref_idx_cnt;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
}
