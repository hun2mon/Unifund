package com.uni.fund.main.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.crew.dto.CrewDTO;
import com.uni.fund.main.dao.MainDAO;
import com.uni.fund.project.dto.ProjectDTO;

@Service
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MainDAO mainDAO;
	public List<ProjectDTO> mainProList() {
		return mainDAO.mainProList();
	}
	public List<CrewDTO> mainCrewList() {
		return mainDAO.mainCrewList();
	}
	
	
}
