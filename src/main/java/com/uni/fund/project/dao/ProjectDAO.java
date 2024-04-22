package com.uni.fund.project.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.project.dto.ProjectDTO;
import com.uni.fund.project.dto.ReviewDTO;

public interface ProjectDAO {

	ProjectDTO detail(String memIdx);

	int projectCreate(ProjectDTO projectDTO);

	void createMainPhoto(int pro_idx, String newProjectMainFileName, int projectMainPhotoDiv);

	void createPhoto(int pro_idx, String newProjectFileName, int projectPhotoDiv);

	int funding(Map<String, String> map);

	void moneyMng(Map<String, String> map);

	int fundingCancle(Map<String, String> map);

	void moneyRefund(Map<String, String> map);

	int reviewDo(ProjectDTO proDTO);

	void fileWrite(int idx, String newFileName);

	void revFileWrite(int idx, String newFileName);

	List<ReviewDTO> revList(String pro_idx, int limit);
	
	int revDel(String rev_idx);

	void mileageSaveUp(int mem_idx);

	List<ProjectDTO> appListCall(int start, int pagePerCnt);

	Object allCount(int pagePerCnt);

	void likeDo(String pro_idx, String mem_idx);

	void likeCancle(String pro_idx, String mem_idx);

	void favorite(String pro_idx, String mem_idx);

	void favoriteCancle(String pro_idx, String mem_idx);

	List<ProjectDTO> adminList();
}
