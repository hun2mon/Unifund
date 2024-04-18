package com.uni.fund.mypage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.fund.member.dto.MemberDTO;
import com.uni.fund.mypage.dao.MypageDAO;
import com.uni.fund.mypage.dto.MypageDTO;

@Service
public class MypageService {
   Logger logger = LoggerFactory.getLogger(getClass());
   @Autowired MypageDAO mypageDAO;
   
   public MypageDTO profile(int userId) {
      logger.info("userId : "+userId);
      return mypageDAO.profile(userId);
   }

   public MypageDTO profileUp(int userId) {
      logger.info("userId : "+userId);
      return mypageDAO.profileUp(userId);
   }
}