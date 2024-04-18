package com.uni.fund.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.uni.fund.mypage.dto.MypageDTO;
import com.uni.fund.mypage.service.MypageService;
@Controller
public class MypageController {
   Logger logger = LoggerFactory.getLogger(getClass());
   @Autowired MypageService mypageService;
   
   @RequestMapping(value = "profile.go")
   public String profile(Model model) {
      logger.info("profile요청");
      int userId = 1;
      
      MypageDTO dto = mypageService.profile(userId);
      logger.info("UserInfo :{}",dto.toString());
      model.addAttribute("info",dto);
      
      return "mypage/profile";
   }
   
   @RequestMapping(value = "profileUpdate.go")
   public String profileUpdate(Model model) {
      logger.info("profileUpdate 요청");
      int userId = 1;
      
      MypageDTO dto = mypageService.profileUp(userId);
      logger.info("UserInfo :{}",dto.toString());
      model.addAttribute("info",dto);
      
      return "mypage/profileUpdate";
   }
}