package com.uni.fund.crew.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.crew.dto.CrewDTO;

public interface CrewDAO {

	

	int crewOverlay(String crew_name);

	int crewCreateDo(CrewDTO crewDTO);

	void createCrewLogoPhoto(int crew_idx, String newCrewLogoPhoto, String crewLogo);

	void createCrewRecruPhoto(int crew_idx, String newCrewRecruPhoto, String crewRecru);
	

	CrewDTO crewUpdateForm(int crew_idx);

	List<CrewDTO> crewPhoto(int crew_idx);

	int crewUpdate(Map<String, String> param);

	List<CrewDTO> crewList(int pagePerCnt, int start);

	int allCountPage(int pagePerCnt);
	

	int isApplying(int mem_idx);

	int isMember(int mem_idx);

	void applyCrew(Map<String, Object> param);
	

	int crewCoolCheck(Integer mem_idx, Integer crew_idx);
	
	void crewMakeCool(Integer mem_idx, Integer crew_idx);

	void crewUncool(Integer mem_idx, Integer crew_idx);

	List<CrewDTO> appList(String crew_idx, int start, int pagePerCnt);

	int allCount(int pagePerCnt, String crew_idx);

	void approve(String mem_idx, String crew_idx);

	void insertCrewMem(String mem_idx, String crew_idx);





}
