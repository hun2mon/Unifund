package com.uni.fund.crew.dao;

import java.util.Map;

import com.uni.fund.crew.dto.CrewDTO;

public interface CrewDAO {

	

	int crewOverlay(String crew_name);

	int crewCreateDo(CrewDTO crewDTO);

	void createCrewLogoPhoto(int crew_idx, String newCrewLogoPhoto, String crewLogo);

	void createCrewRecruPhoto(int crew_idx, String newCrewRecruPhoto, String crewRecru);

}
