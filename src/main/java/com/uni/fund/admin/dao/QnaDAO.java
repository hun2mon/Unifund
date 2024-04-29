package com.uni.fund.admin.dao;

import java.util.List;

import com.uni.fund.admin.dto.QnaDTO;

public interface QnaDAO {

	List<QnaDTO> adminQnaList(String category, int start, int pagePerCnt);

	Object adminQnaAllCount(String category, int pagePerCnt);

	List<QnaDTO> search(String keyWord, int start, int pagePerCnt);

	Object searchAllCount(String keyWord, int pagePerCnt);

	void statusUpdate(int qna_idx, String status);

	List<QnaDTO> userQnaList(String category, int start, int pagePerCnt);

	Object userQnaAllCount(String category, int pagePerCnt);

	void allChangeStatusDO(int qna_idx, String status);

	String passCheck(int qna_idx);

	

}
