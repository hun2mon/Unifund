package com.uni.fund.mypage.dao;

import java.util.Map;

import com.uni.fund.mypage.dto.MypageDTO;

public interface MypageDAO {

   MypageDTO profile(int userId);

   MypageDTO profileUp(int userId);

void fileUpdate(String newFileName, String idx);

int proUpdo(Map<String, String> param);

String getIdx(Map<String, String> param);

String proPhoto(int userId);

}