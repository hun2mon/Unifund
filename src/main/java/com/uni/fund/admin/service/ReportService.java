package com.uni.fund.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.admin.dao.ReportDAO;
import com.uni.fund.admin.dto.ReportDTO;
import com.uni.fund.project.dto.ProjectDTO;

@Service
public class ReportService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportDAO reportDAO;
	public Map<String, Object> adminList(String category, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		List<ReportDTO> list = reportDAO.adminList(category,start,pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", reportDAO.adminAllCount(category,pagePerCnt));
		return result;
	}
	
}
