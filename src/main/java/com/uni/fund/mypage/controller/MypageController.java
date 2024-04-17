package com.uni.fund.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.uni.fund.mypage.service.MypageService;

public class MypageController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MypageService mypageService;

}
