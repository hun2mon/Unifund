package com.uni.fund.project.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.project.dto.ProjectDTO;

public interface ProjectDAO {

	ProjectDTO detail();

	int projectCreate(ProjectDTO projectDTO);

	void createMainPhoto(int pro_idx, String newProjectMainFileName, String projectMainPhotoDiv);

	void createPhoto(int pro_idx, String newProjectFileName, String projectPhotoDiv);

	ProjectDTO updateForm(String pro_idx);
	
	int projectUpdate(Map<String, String> param);

	int funding(Map<String, String> map);

	void moneyMng(Map<String, String> map);

	int fundingCancle(Map<String, String> map);

	void moneyRefund(Map<String, String> map);

	int projectTotalCnt(Map<String, Object> param);

	List<ProjectDTO> projectList(Map<String, Object> param);

	int checkProject(Integer mem_idx);

	int projectReadLike(int pro_idx, int mem_idx);

	int projectCheckLike(int pro_idx, int mem_idx);

	void projectAddLike(Integer pro_idx, Integer mem_idx);

	void projectDisLike(Integer pro_idx, Integer mem_idx);

}
