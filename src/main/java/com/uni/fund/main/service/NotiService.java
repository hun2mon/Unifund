package com.uni.fund.main.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.main.dao.NotiDAO;
import com.uni.fund.main.dto.NotiDTO;

@Service
public class NotiService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiDAO notiDAO;
	public List<NotiDTO> notiList(int mem_idx) {
		return notiDAO.notiList(mem_idx);
	}
	public void blindNoti(String noti_idx) {
		notiDAO.blindNoti(noti_idx);
	}
	
}
