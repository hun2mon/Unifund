package com.uni.fund.money.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.uni.fund.money.service.MoneyService;

@Controller
public class MoneyController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MoneyService moneyService;
	
}
