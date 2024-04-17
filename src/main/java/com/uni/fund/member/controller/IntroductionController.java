package com.uni.fund.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.uni.fund.member.service.IntroductionService;

@Controller
public class IntroductionController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired IntroductionService introService;
	
	
}
