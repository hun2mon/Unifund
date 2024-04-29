package com.uni.fund.crew.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.crew.dao.CrewDAO;
import com.uni.fund.crew.dto.CrewDTO;

@Service
public class CrewService {
	
	private static final String file_root="/Users/ku-ilseung/Desktop/C/upload/";
	
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CrewDAO crewDAO;	

	public Object crewOverlay(String crew_name) {
		
		return crewDAO.crewOverlay(crew_name);
	}

	public int crewCreateDo(MultipartFile crew_logo_photo, MultipartFile crew_recru_photo, Integer mem_idx, Map<String, String> param) {
		int row=-1;
		logger.info("service crew create do 들어왔다");
		CrewDTO crewDTO = new CrewDTO();
		crewDTO.setMem_idx(mem_idx);
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
		
		if(row>0) {
			crewLogoPhotoFileSave(crew_idx,crew_logo_photo,crewLogo);
			crewRecruPhotoFileSave(crew_idx,crew_recru_photo,crewRecru);
		}		
		return row;
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
	

	public CrewDTO detail(String crew_idx, String memId) {
		logger.info("crew_idx : {}",crew_idx);
		logger.info("memIdx : {}",memId);
		
		return crewDAO.detail(memId,crew_idx);
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
	}

	public void deleteReason(int crew_idx, String delContent, int memIdx) {
		crewDAO.deleteReason(crew_idx,delContent,memIdx);
	}

	public void crewOut(int crew_idx, int memIdx) {
		crewDAO.crewMemberListDelete(crew_idx,memIdx);
		crewDAO.crewOutMemberHistoryUpdate(crew_idx,memIdx);
		logger.info("service부분 crewOut 완료");
	}

	public Map<String, Object> detailCrewMemberPhoto(int currentPage, int pagePerCnt, String crew_idx) {
		int start = (currentPage - 1) * pagePerCnt;
        Map<String, Object> map = new HashMap<String,Object>();
        List<CrewDTO> list= crewDAO.detailCrewMember(start,pagePerCnt,crew_idx);
        logger.info("list : "+list);
        
        map.put("list", list);        
        map.put("currentPage", currentPage);
        map.put("totalPages", crewDAO.detailCrewMemberCountPage(pagePerCnt,crew_idx));
        logger.info("totalPage = "+crewDAO.detailCrewMemberCountPage(pagePerCnt,crew_idx));
		return map;
	}

	public void memberDeport(String crew_idx, String crewMem_idx) {
		logger.info("Service memberDeport");
		crewDAO.crewMemberDeport(crew_idx, crewMem_idx);
		crewDAO.crewMemberDeportHistoryInsert(crew_idx,crewMem_idx);
	}


	public void crewChiefDelegate(String crew_idx, String crewMem_idx, int memIdx, String delgateContent) {
		logger.info("Service crewChiefDelegate");
		// 크루장-> 일반 크루원 : crewMember_list update
		crewDAO.crewChiefTomemberCrewMemberListUpdate(crew_idx,memIdx,crewMem_idx);
		// 크루장 -> 일반크루원 : crewMember_history insert
		crewDAO.crewChiefTomemberCrewMemberHistoryInsert(crew_idx,memIdx,crewMem_idx);
		
		//일반 크루원-> 크루장 : crewMember_list update
		crewDAO.crewMemberToChiefCrewMemberListUpdate(crew_idx,crewMem_idx);	
		// 일반 크루원-> 크루장 : crewMember_history insert / 위임사유도들어가야함
		crewDAO.crewMemberToChiefCrewMemberHistoryInsert(crew_idx,crewMem_idx,delgateContent,memIdx);
	}




	





	


	


	












	
	
	
	
}
