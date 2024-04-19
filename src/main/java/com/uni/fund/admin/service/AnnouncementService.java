package com.uni.fund.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.admin.dao.AnnouncementDAO;
import com.uni.fund.admin.dto.AnnouncementDTO;

@Service
public class AnnouncementService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AnnouncementDAO annDAO;

	public Map<String, Object> annList(int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<AnnouncementDTO> annList = annDAO.annList(start,pagePerCnt);
		result.put("annList", annList);
		result.put("currPage", currPage);
		result.put("totalPages", annDAO.allCount(pagePerCnt));
		logger.info("result:{}",result);
		
		return result;
	}

	
}
