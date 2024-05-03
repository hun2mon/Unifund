package com.uni.fund.main.dao;

import java.util.List;

import com.uni.fund.main.dto.NotiDTO;

public interface NotiDAO {

	List<NotiDTO> notiList(int mem_idx);

	int blindNoti(String noti_idx);

}
