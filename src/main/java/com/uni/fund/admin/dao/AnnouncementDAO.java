package com.uni.fund.admin.dao;

import java.util.List;

import com.uni.fund.admin.dto.AnnouncementDTO;

public interface AnnouncementDAO {

	List<AnnouncementDTO> annList(int start, int pagePerCnt);

	Object allCount(int pagePerCnt);



}
