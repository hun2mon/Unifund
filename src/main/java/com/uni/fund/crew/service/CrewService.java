package com.uni.fund.crew.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.crew.dao.CrewDAO;
import com.uni.fund.crew.dto.ActivityDTO;
import com.uni.fund.crew.dto.CrewDTO;

@Service
public class CrewService {
	
	private static final String file_root="/Users/ku-ilseung/Desktop/C/upload/";
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CrewDAO crewDAO;	

	public Object crewOverlay(String crew_name) {
		
		return crewDAO.crewOverlay(crew_name);
	}

	public int crewCreateDo(MultipartFile crew_logo_photo, MultipartFile crew_recru_photo, int memIdx, Map<String, String> param) {
		int row=-1;
		logger.info("service crew create do 들어왔다");
		CrewDTO crewDTO = new CrewDTO();
		crewDTO.setMem_idx(memIdx);
		crewDTO.setCrew_name(param.get("crew_name"));
		crewDTO.setCrew_exp(param.get("crew_exp"));
		crewDTO.setCrew_con(param.get("crew_con"));
		crewDTO.setCrew_num(Integer.parseInt(param.get("crew_num")));
		//crewDTO.setCrew_logo(param.get("crew_logo"));
		crewDTO.setCrew_link(param.get("crew_link"));
		crewDTO.setCrew_local(param.get("crew_local"));
		//crewDTO.setCrew_status(param.get("crew_status"));
		row= crewDAO.crewCreateDo(crewDTO);
		int crew_idx= crewDTO.getCrew_idx();
		String crewLogo="크루로고";
		String crewRecru="모집설명";
		
		//crew를 memberList에 
		crewDAO.memberListInsert(crew_idx,memIdx);
		logger.info("Service에서 crew_idx : "+crew_idx);
		logger.info("Service에서 memIdx : "+memIdx);
		crewDAO.memberHistoryInsert(crew_idx,memIdx);
		
		if(row>0) {
			crewLogoPhotoFileSave(crew_idx,crew_logo_photo,crewLogo);
			crewRecruPhotoFileSave(crew_idx,crew_recru_photo,crewRecru);
		}		
		return row;
	}		

	public int crewActivityWrite(MultipartFile crew_activity_photo, int memIdx, Map<String, Object> param, int crew_idx) {
		CrewDTO crewDTO = new CrewDTO();
		crewDTO.setCrew_idx(crew_idx);
		crewDTO.setMem_idx(memIdx);
		crewDTO.setActivity_details((String) param.get("activity_details"));
		int row=crewDAO.crewActivityWrite(crewDTO);
		int crew_activity_details_idx=crewDTO.getCrew_activity_details_idx();
		String crewActivity="활동내역";
		logger.info("crew_activity_details_idx : "+crew_activity_details_idx);
		
		if (row>0) {
			crewActivityFileSave(crew_activity_details_idx,crew_activity_photo,crewActivity);
		}
		
		return 0;
	}
	
	private void crewActivityFileSave(int crew_activity_details_idx, MultipartFile crew_activity_photo, String crewActivity) {
		String fileName=crew_activity_photo.getOriginalFilename();
		if(!fileName.equals("")) {
			String crewActivityPhoto = fileName.substring(fileName.lastIndexOf("."));
			String newCrewActivityPhoto = System.currentTimeMillis()+crewActivityPhoto;
			
			try {
				byte[] crewActivityPhotoBytes = crew_activity_photo.getBytes();
				Path crewActivityPath = Paths.get(file_root+newCrewActivityPhoto);
				Files.write(crewActivityPath, crewActivityPhotoBytes);				
				crewDAO.crewActivityPhoto(crew_activity_details_idx, newCrewActivityPhoto, crewActivity);
			} catch (IOException e) {
				logger.info("file exception");
				e.printStackTrace();
			}
			
		}
		
	}

	private void crewLogoPhotoFileSave(int crew_idx, MultipartFile crew_logo_photo, String crewLogo) {
		String fileName = crew_logo_photo.getOriginalFilename();
		if(!fileName.equals("")) {
			String crewLogoPhoto = fileName.substring(fileName.lastIndexOf("."));
			String newCrewLogoPhoto = System.currentTimeMillis()+crewLogoPhoto;
			
			try {
				byte[] crewLogoPhotoBytes = crew_logo_photo.getBytes();
				Path crewLogoPath = Paths.get(file_root+newCrewLogoPhoto);
				Files.write(crewLogoPath, crewLogoPhotoBytes);
				crewDAO.createCrewLogoPhoto(crew_idx,newCrewLogoPhoto,crewLogo);
			} catch (Exception e) {
				logger.info("file exception");
				e.printStackTrace();
			}	
		}		
	}	

	private void crewRecruPhotoFileSave(int crew_idx, MultipartFile crew_recru_photo, String crewRecru) {
		String fileName=crew_recru_photo.getOriginalFilename();
		if(!fileName.equals("")) {
			String crewRecruPhoto = fileName.substring(fileName.lastIndexOf("."));
			String newCrewRecruPhoto = System.currentTimeMillis()+crewRecruPhoto;
			
			try {
				byte[] crewRecruPhotoBytes= crew_recru_photo.getBytes();
				crewRecruPhotoBytes = crew_recru_photo.getBytes();
				Path crewRecruPath = Paths.get(file_root +newCrewRecruPhoto);
				Files.write(crewRecruPath, crewRecruPhotoBytes);
				crewDAO.createCrewRecruPhoto(crew_idx,newCrewRecruPhoto,crewRecru);
			} catch (Exception e) {
				logger.info("file exception");
				e.printStackTrace();
			}			
		}	
	}
	
	public void crewUpdateForm(int crew_idx, Model model) {
		logger.info("crewUpdateForm 들어왔다");
		CrewDTO crewDTO = crewDAO.crewUpdateForm(crew_idx);
		model.addAttribute("crew",crewDTO);
		
		List<CrewDTO> list= crewDAO.crewPhoto(crew_idx); // 첫번째가 로고사진, 두번째가 모집정보사진
		//list.get(0).getPho_name();
		model.addAttribute("crewPhoto1",list.get(1).getPho_name());
		model.addAttribute("crewPhoto",list.get(0).getPho_name());
		logger.info("list : {} ",list);		
	}

	public void crewUpdate(Map<String, String> param, MultipartFile crew_logo_photo, MultipartFile crew_recru_photo) {
		int row=crewDAO.crewUpdate(param);
		logger.info("update count : "+ row);
		String crewLogo="크루로고";
		String crewRecru="모집설명";
		
		if(row>0) {
			crewLogoPhotoFileSave(Integer.parseInt(param.get("crew_idx")),crew_logo_photo,crewLogo);
			crewRecruPhotoFileSave(Integer.parseInt(param.get("crew_idx")),crew_recru_photo,crewRecru);
		}
		
	}	

	public Map<String, Object> crewList(String filterType, int currentPage, int pagePerCnt, Integer crew_idx) {
		
		int start = (currentPage - 1) * pagePerCnt;
        Map<String, Object> map = new HashMap<String,Object>();
        List<CrewDTO> crewList= crewDAO.crewList(filterType,start,pagePerCnt,crew_idx);
        
        map.put("crewList", crewList);
        map.put("currentPage", currentPage);
        map.put("totalPages", crewDAO.allCountPage(filterType,pagePerCnt,crew_idx));
        logger.info("totalPage = "+crewDAO.allCountPage(filterType,pagePerCnt,crew_idx));
        
        return map;
    }

	public Map<String, Object> detailCrewMember(int currentPage, int pagePerCnt, String crew_idx) {
		logger.info("service detail CrewMember");
		int start = (currentPage - 1) * pagePerCnt;
        Map<String, Object> map = new HashMap<String,Object>();
        List<CrewDTO> list= crewDAO.detailCrewMember(start,pagePerCnt,crew_idx);
        logger.info("list : "+list);
        
        map.put("list", list);        
        map.put("currentPage", currentPage);
        map.put("totalPages", crewDAO.detailCrewMemberCountPage(pagePerCnt,crew_idx));
        logger.info("totalPags = "+crewDAO.detailCrewMemberCountPage(pagePerCnt,crew_idx));
		return map;
	}	

	public Map<String, Object> activityList(int currentPage, int pagePerCnt, String crew_idx) {
		int start = (currentPage-1) * pagePerCnt;
		Map<String, Object> result = new HashMap<String, Object>();
	    List<CrewDTO>activity_list= crewDAO.activityList(crew_idx,start,pagePerCnt);
	    logger.info("activity_list"+activity_list);
	    
	    result.put("activity_list", activity_list);
	    result.put("currentPage", currentPage);
	    result.put("totalPages", crewDAO.activityListCount(pagePerCnt,crew_idx));

		return result;
	}
	
	
	public Map<String, Object> searchCrew(String keyword,int currentPage, int pagePerCnt) {
	    	    
	    int start = (currentPage - 1) * pagePerCnt;
	    
	    List<CrewDTO> searchResult = crewDAO.searchCrew(keyword,start,pagePerCnt);
	    Map<String, Object> map = new HashMap<String, Object>();
	    
	    map.put("searchResult", searchResult);
	    logger.info("searchResult : "+searchResult);
	    map.put("currentPage : ",currentPage);
	    map.put("totalPages", crewDAO.searchCountPage(keyword,pagePerCnt));
	    logger.info("searchKeyword,pagePerCnt"+crewDAO.searchCountPage(keyword,pagePerCnt)+"asdf");
	    
	    return map;
	}	

	public String applyCrew(int memIdx, int crew_idx) {
		
		// 신청 중인크루 확인
		int applyingCount = crewDAO.isApplying(memIdx);
		if(applyingCount>0) {
			return "isApplying"; // 이미 크루 신청중이라면
		}
		
		// 탈퇴했거나 추방당했는지 확인
		int outOrKick = crewDAO.isOutOrKick(memIdx,crew_idx);
		if(outOrKick>0) {
			return "outOrKick";
		}
		
		// 가입된 크루가 있는지 확인
		int memberCount = crewDAO.isMember(memIdx);
		if(memberCount >0) {
			return "memberCount";
		}
		
				
		// 크루 신청 등록
		Map<String, Object> param= new HashMap<String, Object>();
		param.put("mem_idx",memIdx);
		param.put("crew_idx", crew_idx);
		param.put("crew_mem_status","A");
		crewDAO.applyCrew(param);
		
		return "success";
	}

	public int crewCoolCheck(Integer memIdx, Integer crew_idx) {
		
		int crewCool = crewDAO.crewCoolCheck(memIdx,crew_idx);		
		logger.info("crewPopularityCheck : {}"+crewCool);		
		if(crewCool==1) {
			crewDAO.crewUncool(memIdx,crew_idx);
			crewCool = 0;
		}else {
			crewDAO.crewMakeCool(memIdx, crew_idx);
			crewCool = 1;
		}		
		return crewCool;
	}
	

	public CrewDTO detail(String crew_idx, String memId, int memIdx) {
		logger.info("crew_idx : {}",crew_idx);
		logger.info("memIdx : {}",memId);
		
		return crewDAO.detail(memId,crew_idx,memIdx);
	}


	public String stateCheck(String crew_idx) {
		logger.info("stateCheck : {}",crewDAO.stateCheck(crew_idx));
		return crewDAO.stateCheck(crew_idx);
	}

	public void report(String crew_idx, String repContent, int memIdx) {
		crewDAO.report(crew_idx,repContent,memIdx);		
	}

	public void crewDelete(int crew_idx,int memIdx) {		
		crewDAO.crewDelete(crew_idx,memIdx);		
		List<Integer> list= crewDAO.crewMemberList(crew_idx);
		for (Integer idx : list) {
			crewDAO.crewMemberHistoryInsert(crew_idx,idx);
		}
		
		crewDAO.crewListMemberDelete(crew_idx);
	}

	public void deleteReason(int crew_idx, String delContent, int memIdx) {
		crewDAO.deleteReason(crew_idx,delContent,memIdx);
	}

	public void crewOut(int crew_idx, int memIdx) {
		crewDAO.crewMemberListDelete(crew_idx,memIdx);
		crewDAO.crewOutMemberHistoryInsert(crew_idx,memIdx);
		logger.info("service부분 crewOut 완료");
	}


	public void memberDeport(String crew_idx, String crewMem_idx) {
		logger.info("Service memberDeport");
		crewDAO.crewMemberDeport(crew_idx, crewMem_idx);
		crewDAO.crewMemberDeportHistoryInsert(crew_idx,crewMem_idx);
	}


	public void crewChiefDelegate(String crew_idx, String crewMem_idx, int memIdx, String delgateContent, String mem_status, String crew_leader_idx) {
		logger.info("Service crewChiefDelegate");
//		if(mem_status.equals("M")) {
//			// 관리자의 크루장위임 
//			//일반 크루원-> 크루장 : crewMember_list update
//			crewDAO.crewMemberToChiefCrewMemberListUpdate(crew_idx,crewMem_idx);	
//			// 일반 크루원-> 크루장 : crewMember_history insert / 위임사유도들어가야함
//			crewDAO.crewMemberToChiefCrewMemberHistoryInsert(crew_idx,crewMem_idx,delgateContent,memIdx);
//			
//			
//		}
		// 크루장-> 일반 크루원 : crewMember_list update
		crewDAO.crewChiefTomemberCrewMemberListUpdate(crew_idx,crew_leader_idx,crewMem_idx);
		// 크루장 -> 일반크루원 : crewMember_history insert
		crewDAO.crewChiefTomemberCrewMemberHistoryInsert(crew_idx,crew_leader_idx,crewMem_idx);
		
		//일반 크루원-> 크루장 : crewMember_list update
		crewDAO.crewMemberToChiefCrewMemberListUpdate(crew_idx,crewMem_idx);	
		// 일반 크루원-> 크루장 : crewMember_history insert / 위임사유도들어가야함
		crewDAO.crewMemberToChiefCrewMemberHistoryInsert(crew_idx,crewMem_idx,delgateContent,memIdx);
	}

	public Map<String, Object> appList(String crew_idx, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		
		List<CrewDTO> list = crewDAO.appList(crew_idx,start,pagePerCnt);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", crewDAO.allCount(pagePerCnt,crew_idx));
		return result;
	}

	public void approve(String mem_idx, String crew_idx) {
		crewDAO.approve(mem_idx,crew_idx);
		crewDAO.insertCrewMem(mem_idx,crew_idx);
	}

	public void activityDel(int crew_activity_details_idx) {
		crewDAO.activityDel(crew_activity_details_idx);
		crewDAO.activityPhotoDel(crew_activity_details_idx);
	}
	public void refuse(String mem_idx, String crew_idx) {
		crewDAO.refuse(mem_idx,crew_idx);
	}

	public Map<String, Object> adminList(int currPage, int pagePerCnt) {
		int start = (currPage-1)*pagePerCnt;
		List<CrewDTO>list = crewDAO.adminList(start,pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", crewDAO.adminAllCount(pagePerCnt));
		logger.info("totalPages : "+crewDAO.adminAllCount(pagePerCnt));
		
		return result;
	}

	public Map<String, Object> adminSearch(String keyWord, int currPage, int pagePerCnt) {
		
		int start = (currPage - 1)* pagePerCnt;
		List<CrewDTO>list = crewDAO.adminSearch(keyWord,start,pagePerCnt);
		Map<String, Object>result = new HashMap<String, Object>();
		
		result.put("list",list);
		result.put("currPage",currPage);
		result.put("totalPages",crewDAO.adminSearchAllCount(keyWord,pagePerCnt));
		logger.info("totalPages : "+crewDAO.adminSearchAllCount(keyWord,pagePerCnt));
		
		return result;
	}

	public int isCrewCheck(int memIdx) {		
		return crewDAO.isCrewCheck(memIdx);
	}

	




	
	
	
	
}
