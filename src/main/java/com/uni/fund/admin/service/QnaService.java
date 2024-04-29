package com.uni.fund.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.admin.dao.QnaDAO;
import com.uni.fund.admin.dto.QnaDTO;
import com.uni.fund.admin.dto.ReportDTO;

@Service
public class QnaService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired QnaDAO qnaDAO;
	public Map<String, Object> adminQnaList(String category, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		List<QnaDTO> list = qnaDAO.adminQnaList(category,start,pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", qnaDAO.adminQnaAllCount(category,pagePerCnt));
		return result;
	}
	public Map<String, Object> search(String keyWord, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		List<QnaDTO> list = qnaDAO.search(keyWord, start, pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", qnaDAO.searchAllCount(keyWord, pagePerCnt));
		logger.info(qnaDAO.searchAllCount(keyWord, pagePerCnt) + "asdfasd");
		return result;
	}
	public void statusUpdate(int qna_idx, String status) {
		qnaDAO.statusUpdate(qna_idx,status);
		
	}
	public Map<String, Object> userQnaList(String category, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		List<QnaDTO> list = qnaDAO.userQnaList(category,start,pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", qnaDAO.userQnaAllCount(category,pagePerCnt));
		return result;
	}
	
}
