package com.uni.fund.crew.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.crew.dao.CrewDAO;

@Service
public class CrewService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CrewDAO crewDAO;
}
