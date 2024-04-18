package com.uni.fund.mypage.dao;

import com.uni.fund.mypage.dto.MypageDTO;

public interface MypageDAO {

   MypageDTO profile(int userId);

   MypageDTO profileUp(int userId);

}
