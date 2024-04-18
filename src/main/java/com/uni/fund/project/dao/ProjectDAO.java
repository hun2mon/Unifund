package com.uni.fund.project.dao;

import com.uni.fund.project.dto.ProjectDTO;

public interface ProjectDAO {

	ProjectDTO detail();

	int projectCreate(ProjectDTO projectDTO);

	void createMainPhoto(int pro_idx, String newProjectMainFileName, int projectMainPhotoDiv);

	void createPhoto(int pro_idx, String newProjectFileName, int projectPhotoDiv);

}
