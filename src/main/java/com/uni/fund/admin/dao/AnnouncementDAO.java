package com.uni.fund.admin.dao;

import java.util.List;

import com.uni.fund.admin.dto.AnnouncementDTO;

public interface AnnouncementDAO {

	List<AnnouncementDTO> annList(int start, int pagePerCnt);

	Object allCount(int pagePerCnt);

	int adminAnnForm(AnnouncementDTO announcementDTO);

	void createNotiPhoto(int noti_idx, String newAnnFileName, String noti_photoDiv);

	List<AnnouncementDTO> annListSearch(String keyWord, int pagePerCnt, int pagePerCnt2);

	int searchAllCount(String keyWord, int pagePerCnt);



}
