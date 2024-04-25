package com.uni.fund.project.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.project.dto.ProjectDTO;
import com.uni.fund.project.dto.ReviewDTO;

public interface ProjectDAO {

	ProjectDTO detail(int memIdx, String pro_idx);

	int projectCreate(ProjectDTO projectDTO);

	void createMainPhoto(int pro_idx, String newProjectMainFileName, String projectMainPhotoDiv);

	void createPhoto(int pro_idx, String newProjectFileName, String projectPhotoDiv);

	ProjectDTO updateForm(String pro_idx);
	
	int projectUpdate(Map<String, String> param);

	int funding(Map<String, String> map);

	void moneyMng(Map<String, String> map);

	int reviewDo(ProjectDTO proDTO);

	void fileWrite(int idx, String newFileName);

	void revFileWrite(int idx, String newFileName);

	List<ReviewDTO> revList(String pro_idx, int limit);
	
	int revDel(String rev_idx);

	void mileageSaveUp(int mem_idx);

	List<ProjectDTO> appListCall(int start, int pagePerCnt, String pro_idx);

	Object allCount(int pagePerCnt, String pro_idx);

	void likeDo(String pro_idx, int mem_idx);

	void likeCancle(String pro_idx, int mem_idx);

	void favorite(String pro_idx, int mem_idx);

	void favoriteCancle(String pro_idx, int mem_idx);

	List<ProjectDTO> adminList(String category, int start, int pagePerCnt);
	
	int projectTotalCnt(Map<String, Object> param);

	List<ProjectDTO> projectList(Map<String, Object> param);

	int checkProject(Integer mem_idx);

	int projectReadLike(int pro_idx, int mem_idx);

	int projectCheckLike(int pro_idx, int mem_idx);

	void projectAddLike(Integer pro_idx, Integer mem_idx);

	void projectDisLike(Integer pro_idx, Integer mem_idx);

	int checkFundPeople(Integer pro_idx);

	List<ProjectDTO> search(String keyWord, int start, int pagePerCnt);

	Object adminAllCount(String category, int pagePerCnt);

	Object searchAllCount(String keyWord, int pagePerCnt);

	String stateCheck(String pro_idx);

	void agree(String pro_idx);

	void agreeHis(String pro_idx);

	void refuse(String pro_idx);

	void refuseHis(String pro_idx, String refuseContent);

	void proDel(String pro_idx);

	void proDelHis(String pro_idx, String reportContent);

	String[] appList(String pro_idx);

	void moneyRefund(int mem_idx, String pro_idx);

	int fundingCancle(int mem_idx, String pro_idx);

	void cashHis(Map<String, String> map);

	void delCashHis(int parseInt, String pro_idx);

	void mileageHis(Map<String, String> map);

	void delMileHis(int parseInt, String pro_idx);

	void stateChange(String pro_idx, String state);

	int mileageSelect(Map<String, String> map);


}
