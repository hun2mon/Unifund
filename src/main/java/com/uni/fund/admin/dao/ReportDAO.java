package com.uni.fund.admin.dao;

import java.util.List;

import com.uni.fund.admin.dto.ReportDTO;

public interface ReportDAO {

	List<ReportDTO> adminList(String category, int start, int pagePerCnt);

	Object adminAllCount(String category, int pagePerCnt);

	List<ReportDTO> search(String keyWord, int start, int pagePerCnt);

	Object searchAllCount(String keyWord, int pagePerCnt);

	ReportDTO adminDetail(String rep_idx);

	void changeStatus(int repIdx);

	void transContent(int refIdx, int mem_idx ,String transContent , int cateRefIdx ,String cate);

	void transContentUpdate(String transContent, int refIdx);

	

}
