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

	int isApplying(int mem_idx);

	int isMember(int mem_idx);

	void applyCrew(Map<String, Object> param);
	

	int crewCoolCheck(Integer mem_idx, Integer crew_idx);
	
	void crewMakeCool(Integer mem_idx, Integer crew_idx);

	void crewUncool(Integer mem_idx, Integer crew_idx);
	
	
	List<CrewDTO> crewList(int pagePerCnt, int start);	
	
	int allCountPage(int pagePerCnt);
	
	List<CrewDTO> searchCrew(int pagePerCnt, int start, String searchKeyword);
	
	int searchCountPage(int pagePerCnt, String searchKeyword);

	//List<CrewDTO> crewListByPopularity(int pagePerCnt, int start);

	//List<CrewDTO> crewListBySearch(int pagePerCnt, int start, String searchKeyword);

	//int allCountPageBySearch(int pagePerCnt, String searchKeyword);
	
	





}
