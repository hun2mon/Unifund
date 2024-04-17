package com.uni.fund.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.member.dao.IntroductionDAO;

@Service
public class IntroductionService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired IntroductionDAO introDAO;
	
}
