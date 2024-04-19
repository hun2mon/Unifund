package com.uni.fund.mypage.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.mypage.dto.MypageDTO;
import com.uni.fund.mypage.service.MypageService;
@Controller
public class MypageController {
   Logger logger = LoggerFactory.getLogger(getClass());
   @Autowired MypageService mypageService;
   int userId = 1;
   
   @RequestMapping(value = "profile.go")
   public String profile(Model model) {
      logger.info("profile요청");
      int userId = 1; // 세션에서 받아왔다고 치자.
      
      MypageDTO dto = mypageService.profile(userId);
      logger.info("UserInfo :{}",dto.toString());
     
      String proPhoto = mypageService.proPhoto(userId);
      logger.info("proPhoName :" +proPhoto);
      
      MypageDTO introDto = mypageService.introduction(userId);
      logger.info("introductionInfo : {}", introDto);
      
      
   
      model.addAttribute("info",dto);
      model.addAttribute("proPhoto",proPhoto);
      model.addAttribute("introDto",introDto);
      return "mypage/profile";
   }
   
   @RequestMapping(value = "profileUpdate.go")
   public String profileUpdate(Model model) {
      logger.info("profileUpdate.go 요청");
      int userId = 1;
      
      MypageDTO dto = mypageService.profileUp(userId);
      logger.info("UserInfo :{}",dto.toString());
      
      String proPhoto = mypageService.proPhotoUp(userId);
      logger.info("proPhoName :" +proPhoto);
      
      model.addAttribute("info",dto);
      model.addAttribute("proPhoto", proPhoto);
      return "mypage/profileUpdate";
   }
   
   @RequestMapping(value = "profileUpdate.do", method = RequestMethod.POST)
   public String profileUpdateDo(MultipartFile photo, @RequestParam Map<String,String> param, Model model){
      logger.info("profileUpdate.do 요청");
      logger.info("photo : {}",photo.toString());
      logger.info("param : {}",param);
      

      int row = mypageService.proUpDo(photo,param,userId);
      if (row >0) {
         model.addAttribute("msg","수정이 완료되었습니다.");
      }else {
         model.addAttribute("msg","수정이 실패되었습니다.");
      }
      return "redirect:/profile.go";
   }
   
   @RequestMapping(value = "introUpdate.go")
   public String introUpdate(Model model) {
      logger.info("introUpdate.go 요청");
      
      MypageDTO introDto = mypageService.introduction(userId);
      model.addAttribute("introDto",introDto);
      
 
      return "mypage/introUpdate";
   }
   
   @RequestMapping(value = "introUpdate.do")
   public String introUpdateDo(MultipartFile[] photos, @RequestParam Map<String, String> param) {
      
      return "redirect:/profile.go";
   }
   
}