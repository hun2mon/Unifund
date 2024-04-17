package com.uni.fund.money.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.money.dao.MoneyDAO;

@Service
public class MoneyService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MoneyDAO moneyDAO;
	
	
}
