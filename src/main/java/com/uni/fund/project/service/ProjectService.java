package com.uni.fund.project.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.project.dao.ProjectDAO;
import com.uni.fund.project.dto.ProjectDTO;

@Service
public class ProjectService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ProjectDAO projectDAO;
	public ProjectDTO detail() {
		return projectDAO.detail();
	}
	
}
