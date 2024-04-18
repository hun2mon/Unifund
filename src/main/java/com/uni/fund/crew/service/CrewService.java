package com.uni.fund.crew.service;

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

	
	public int crewCreateDo(MultipartFile[] photos, Map<String, String> param) {
		int row = 1;
		
		return row;		
	}
	
	
	
	
	public Object crewOverlay(String crew_name) {
		
		return crewDAO.crewOverlay(crew_name);
	}












	
	
	
	
}
