package com.uni.fund.admin.dao;

import java.util.List;

import com.uni.fund.admin.dto.ReportDTO;

public interface ReportDAO {

	List<ReportDTO> adminList(String category, int start, int pagePerCnt);

	Object adminAllCount(String category, int pagePerCnt);

}
