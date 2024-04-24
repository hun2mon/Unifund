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

	

	public Map<String, Object> crewList(int currentPage, int pagePerCnt) {
		
		int start = (currentPage - 1) * pagePerCnt;
        Map<String, Object> map = new HashMap<String,Object>();
        List<CrewDTO> crewList= crewDAO.crewList(pagePerCnt, start);
        
        map.put("crewList", crewList);
        map.put("currentPage", currentPage);
        map.put("totalPages", crewDAO.allCountPage(pagePerCnt));
        logger.info("totalPage = "+crewDAO.allCountPage(pagePerCnt));
        
        return map;
    }
	
	public Map<String, Object> searchCrew(int currentPage, int pagePerCnt, String searchKeyword) {
	    Map<String, Object> map = new HashMap<>();
	    
	    int start = (currentPage - 1) * pagePerCnt;
	    
	    List<CrewDTO> searchResult = crewDAO.searchCrew(pagePerCnt, start, searchKeyword);
	    
	    map.put("searchResult", searchResult);
	    map.put("currentPage", currentPage);
	    map.put("totalPages", crewDAO.searchCountPage(pagePerCnt, searchKeyword));
	    
	    return map;
	}
	

	public String applyCrew(int mem_idx, int crew_idx) {
		
		// 신청 중인크루 확인
		int applyingCount = crewDAO.isApplying(mem_idx);
		if(applyingCount>0) {
			return "isApplying"; // 이미 크루 신청중이라면
		}
		
		// 가입된 크루가 있는지 확인
		int memberCount = crewDAO.isMember(mem_idx);
		if(memberCount >0) {
			return "memberCount";
		}
		
		// 크루 신청 등록
		Map<String, Object> param= new HashMap<String, Object>();
		param.put("mem_idx",mem_idx);
		param.put("crew_idx", crew_idx);
		param.put("crew_mem_status","A");
		crewDAO.applyCrew(param);
		
		return "success";
	}

	public Object crewCoolCheck(Integer mem_idx, Integer crew_idx) {
		
		int row = crewDAO.crewCoolCheck(mem_idx,crew_idx);
		
		logger.info("crewPopularityCheck : ");
		
		if(row==1) {
			crewDAO.crewUncool(mem_idx,crew_idx);
			row = 0;
		}else {
			crewDAO.crewMakeCool(mem_idx, crew_idx);
			row = 1;
		}
		
		
		return row;
	}




	





	


	


	












	
	
	
	
}
