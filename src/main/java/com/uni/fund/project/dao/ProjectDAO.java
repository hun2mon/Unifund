package com.uni.fund.project.dao;

import java.util.Map;

import com.uni.fund.project.dto.ProjectDTO;

public interface ProjectDAO {

	ProjectDTO detail();

	int projectCreate(ProjectDTO projectDTO);

	void createMainPhoto(int pro_idx, String newProjectMainFileName, String projectMainPhotoDiv);

	void createPhoto(int pro_idx, String newProjectFileName, String projectPhotoDiv);

	ProjectDTO updateForm(String pro_idx);

	int funding(Map<String, String> map);

	void moneyMng(Map<String, String> map);

	int fundingCancle(Map<String, String> map);

	void moneyRefund(Map<String, String> map);

}
