package com.uni.fund.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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

	int qnaForm(Map<String, String> param);

	int qnaForm1(Map<String, String> param);

	QnaDTO qnaDetail(Integer qna_idx);

	int qnaUpdate(QnaDTO qnaDTO);

	List<QnaDTO> userSearch(String keyWord, int start, int pagePerCnt);

	Object userSearchAllCount(String keyWord, int pagePerCnt);

	void qnaDel(@Param("qnaDel")Integer qnaDel, @Param("status") char status);

	List<QnaDTO> rplList(String qna_idx);



	int replyDo(Map<String, String> param);

	int rplDel(Integer comm_idx);


	

}
