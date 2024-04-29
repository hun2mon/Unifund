package com.uni.fund.admin.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.admin.dto.QnaDTO;

public interface QnaDAO {

	List<QnaDTO> adminQnaList(String category, int start, int pagePerCnt);

	Object adminQnaAllCount(String category, int pagePerCnt);

	List<QnaDTO> search(String keyWord, int start, int pagePerCnt);

	Object searchAllCount(String keyWord, int pagePerCnt);

	void statusUpdate(int qna_idx, String status);

	List<QnaDTO> userQnaList(String category, int start, int pagePerCnt);

	Object userQnaAllCount(String category, int pagePerCnt);

	int qnaForm(Map<String, String> param);

	int qnaForm1(Map<String, String> param);

	QnaDTO qnaDetail(int qna_idx);

	int qnaUpdate(QnaDTO qnaDTO);

	

}
