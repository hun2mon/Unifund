package com.uni.fund.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.uni.fund.admin.service.AnnouncementService;

@Controller
public class AnnouncementController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AnnouncementService annService;
	
}
