package com.uni.fund.main.dao;

import java.util.List;

import com.uni.fund.crew.dto.CrewDTO;
import com.uni.fund.project.dto.ProjectDTO;

public interface MainDAO {

	List<ProjectDTO> mainProList();

	List<CrewDTO> mainCrewList();

	

}
