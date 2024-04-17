package com.uni.fund.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.admin.dao.AnnouncementDAO;

@Service
public class AnnouncementService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AnnouncementDAO annDAO;
	
}
