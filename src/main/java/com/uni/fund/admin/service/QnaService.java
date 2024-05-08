package com.uni.fund.admin.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	public void allChangeStatusDO(List<String> qnaIdxList, String status) {
		for (String qnaIdx : qnaIdxList) {
			int qna_idx = Integer.parseInt(qnaIdx);
			qnaDAO.allChangeStatusDO(qna_idx,status);
		}
		
		
	}
	public Map<String, Object> passCheck(int qna_idx) {
		Map<String, Object> result = new HashMap<String, Object>();
		String pass = qnaDAO.passCheck(qna_idx);
		result.put("pass", pass);
		
		return result;
	}

	public int qnaForm(Map<String, String> param, String mem_idx) {
		int row =-1;
		logger.info("[service]param : {}",param);
		param.put("mem_idx", mem_idx);
		if (param.get("qna_pass").equals("")) {
			row = qnaDAO.qnaForm(param);
		}else {
			row = qnaDAO.qnaForm1(param);
		}
		
		logger.info("insert count: "+row);
		return row;
	}
	public QnaDTO qnaDetail(Integer qna_idx) {
		logger.info("qna_idx : " + qna_idx);
		return qnaDAO.qnaDetail(qna_idx);
	}


	
	
	public int qnaUpdate(Map<String, String> param, HttpSession session) {
		logger.info("::: qnaUpdate Service IN :::");
		int row = -1;
		
		QnaDTO qnaDTO = new QnaDTO();
		
		qnaDTO.setQna_idx(Integer.parseInt(param.get("qna_idx")));
		qnaDTO.setQna_title(param.get("qna_title"));
		qnaDTO.setQna_content(param.get("qna_content"));
		qnaDTO.setQna_show(param.get("qna_show"));
		qnaDTO.setQna_pass(Integer.parseInt(param.get("qna_pass")));
		 if (qnaDTO.getQna_show() == null) {
	            qnaDTO.setQna_show("공개");
	        }
		row = qnaDAO.qnaUpdate(qnaDTO);
		logger.info("qnaUpdate service end");
		
		return row;
	}


	public void qnaDel(Integer qnaDel) {
		qnaDAO.qnaDel(qnaDel, 'B');
		
	}

	public Map<String, Object> userSearch(String keyWord, int currPage, int pagePerCnt) {
		int start = (currPage-1) * pagePerCnt;
		List<QnaDTO> list = qnaDAO.userSearch(keyWord, start, pagePerCnt);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("userTotalPages", qnaDAO.userSearchAllCount(keyWord, pagePerCnt));
		logger.info(qnaDAO.userSearchAllCount(keyWord, pagePerCnt) + "asdfasd");
		return result;
	}
	public List<QnaDTO> rplList(String qna_idx) {
		return qnaDAO.rplList(qna_idx);
	}

	public int replyDo(Map<String, String> param) {

		return qnaDAO.replyDo(param);
	}
	public void rplDel(Integer comm_idx) {
		int row = qnaDAO.rplDel(comm_idx);
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
