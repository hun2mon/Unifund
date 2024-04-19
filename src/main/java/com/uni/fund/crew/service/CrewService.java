package com.uni.fund.crew.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.crew.dao.CrewDAO;
import com.uni.fund.crew.dto.CrewDTO;

@Service
public class CrewService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CrewDAO crewDAO;
	
	public String file_root="/Users/ku-ilseung/Desktop/C/upload/";

	public Object crewOverlay(String crew_name) {
		
		return crewDAO.crewOverlay(crew_name);
	}


	public int crewCreateDo(MultipartFile crew_logo_photo, MultipartFile crew_recru_photo, Integer mem_idx, Map<String, String> param) {
		int row=-1;
		
		CrewDTO crewDTO = new CrewDTO();
		crewDTO.setMem_idx(mem_idx);
		crewDTO.setCrew_name(param.get("crew_name"));
		crewDTO.setCrew_exp(param.get("crew_exp"));
		crewDTO.setCrew_con(param.get("crew_con"));
		crewDTO.setCrew_num(Integer.parseInt(param.get("crew_num")));
		//crewDTO.setCrew_logo(param.get("crew_logo"));
		crewDTO.setCrew_link(param.get("crew_link"));
		crewDTO.setCrew_local(param.get("crew_local"));
		crewDTO.setCrew_status(param.get("crew_status"));
		row= crewDAO.crewCreateDo(crewDTO);
		int crew_idx= crewDTO.getCrew_idx();
		String crewLogo="크루로고";
		String crewRecru="크루모집설명";
		
		if(row>0) {
			crewLogoPhotoFileSave(crew_idx,crew_logo_photo,crewLogo);
			crewRecruPhotoFileSave(crew_idx,crew_recru_photo,crewRecru);
		}
		
		
		return 0;
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
				Thread.sleep(1);				
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
			
			byte[] crewRecruPhotoBytes;
			try {
				crewRecruPhotoBytes = crew_recru_photo.getBytes();
				Path crewRecruPath = Paths.get(file_root +newCrewRecruPhoto);
				Files.write(crewRecruPath, crewRecruPhotoBytes);
				crewDAO.createCrewRecruPhoto(crew_idx,newCrewRecruPhoto,crewRecru);
				Thread.sleep(1);
			} catch (Exception e) {
				logger.info("file exception");
				e.printStackTrace();
			}
			
		}
		
	}


	


	












	
	
	
	
}
