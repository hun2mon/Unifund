package com.uni.fund.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uni.fund.admin.dto.AnnouncementDTO;

public interface AnnouncementDAO {

	List<AnnouncementDTO> annList(int start, int pagePerCnt);

	Object allCount(int pagePerCnt);


	void createNotiPhoto(int noti_idx, String newAnnFileName, String noti_photoDiv);

	List<AnnouncementDTO> annListSearch(String keyWord, int pagePerCnt, int pagePerCnt2);

	int searchAllCount(String keyWord, int pagePerCnt);

	List<AnnouncementDTO> adminList(int start, int pagePerCnt);

	List<AnnouncementDTO> adminListSearch(String keyWord, int pagePerCnt, int pagePerCnt2);

	void updateAnnouncementStatus(@Param("notiIdxList")List<Integer> notiIdxList, @Param("status") char status);

	int adminAnnForm(AnnouncementDTO announcementDTO);

	AnnouncementDTO annDetail(int  noti_idx);

	String notiPhoto(int noti_idx);





}
