package com.uni.fund.crew.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.crew.dto.ActivityDTO;
import com.uni.fund.crew.dto.CrewDTO;

public interface CrewDAO {
		
	int crewOverlay(String crew_name);

	int crewCreateDo(CrewDTO crewDTO);

	void createCrewLogoPhoto(int crew_idx, String newCrewLogoPhoto, String crewLogo);

	void createCrewRecruPhoto(int crew_idx, String newCrewRecruPhoto, String crewRecru);
	
	
	int crewActivityWrite(CrewDTO crewDTO);
	
	void crewActivityPhoto(int crew_activity_details_idx, String newCrewActivityPhoto, String crewActivity);

	void crewActicityDescribe(String crew_idx, String activity_content);
	

	CrewDTO crewUpdateForm(int crew_idx);

	List<CrewDTO> crewPhoto(int crew_idx);

	int crewUpdate(Map<String, String> param);	

	int isApplying(int memIdx);

	int isMember(int memIdx);

	void applyCrew(Map<String, Object> param);
	

	int crewCoolCheck(Integer mem_idx, Integer crew_idx);
	
	void crewMakeCool(Integer mem_idx, Integer crew_idx);

	void crewUncool(Integer mem_idx, Integer crew_idx);
	
	
	List<CrewDTO> crewList(String filterType,int start, int pagePerCnt, Integer crew_idx);	
	
	Object allCountPage(String filterType, int pagePerCnt, Integer crew_idx);
	
	Object detailCrewMemberCountPage(int pagePerCnt, String crew_idx);
	
	List<CrewDTO> searchCrew(String keyword, int start, int pagePerCnt);
	
	Object searchCountPage(String keyword, int pagePerCnt);

	String stateCheck(String crew_idx);

	CrewDTO detail(String memId, String crew_idx, int memIdx);

	void report(String crew_idx, String repContent, int memIdx);

	void crewDelete(int crew_idx, int memIdx);

	void deleteReason(int crew_idx, String delContent, int memIdx);

	void crewMemberListDelete(int crew_idx, int memIdx);

	void crewOutMemberHistoryInsert(int crew_idx, int memIdx);

	List<CrewDTO> detailCrewMember(int start, int pagePerCnt, String crew_idx);	

	void crewMemberDeport(String crew_idx, String crewMem_idx);

	void crewMemberDeportHistoryInsert(String crew_idx, String crewMem_idx);
	

	void crewChiefTomemberCrewMemberListUpdate(String crew_idx, int memIdx, String crewMem_idx);

	void crewChiefTomemberCrewMemberHistoryInsert(String crew_idx, int memIdx, String crewMem_idx);

	void crewMemberToChiefCrewMemberListUpdate(String crew_idx, String crewMem_idx);

	void crewMemberToChiefCrewMemberHistoryInsert(String crew_idx, String crewMem_idx, String delgateContent, int memIdx);


	List<CrewDTO> appList(String crew_idx, int start, int pagePerCnt);

	int allCount(int pagePerCnt, String crew_idx);

	void approve(String mem_idx, String crew_idx);

	void insertCrewMem(String mem_idx, String crew_idx);

	void memberListInsert(int crew_idx, Integer memIdx);

	void memberHistoryInsert(int crew_idx, Integer memIdx);

	List<CrewDTO> activityList(String crew_idx, int start, int pagePerCnt);

	Object activityListCount(int pagePerCnt, String crew_idx);

	void activityDel(int crew_activity_details_idx);

	void activityPhotoDel(int crew_activity_details_idx);
	

	List<CrewDTO> adminList(int start, int pagePerCnt);

	Object adminAllCount(int pagePerCnt);
	

	List<CrewDTO> adminSearch(String keyWord, int start, int pagePerCnt);

	Object adminSearchAllCount(String keyWord, int pagePerCnt);


	



	

	






}
