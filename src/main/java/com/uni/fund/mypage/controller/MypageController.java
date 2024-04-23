package com.uni.fund.mypage.controller;

import java.util.Arrays;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.mypage.dto.MypageDTO;
import com.uni.fund.mypage.service.MypageService;
@Controller
public class MypageController {
   Logger logger = LoggerFactory.getLogger(getClass());
   @Autowired MypageService mypageService;
   int userId =1;
   
   @RequestMapping(value = "/mypage/profile.go")
   public String profile(Model model) {
      logger.info("profile요청");
      
      
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
   
   @RequestMapping(value = "/mypage/profileUpdate.go")
   public String profileUpdate(Model model) {
      logger.info("profileUpdate.go 요청");
      
      
      MypageDTO dto = mypageService.profileUp(userId);
      logger.info("UserInfo :{}",dto.toString());
      
      String proPhoto = mypageService.proPhotoUp(userId);
      logger.info("proPhoName :" +proPhoto);
      
      model.addAttribute("info",dto);
      model.addAttribute("proPhoto", proPhoto);
      return "mypage/profileUpdate";
   }
   
   @RequestMapping(value = "/mypage/profileUpdate.do", method = RequestMethod.POST)
   public String profileUpdateDo(MultipartFile photo, @RequestParam Map<String,String> param, Model model){
      logger.info("profileUpdate.do 요청");
      logger.info("photo : {}",photo.toString());
      logger.info("param : {}",param);
      

      int row = mypageService.proUpDo(photo,param,userId);
      
      return "redirect:/mypage/profile.go";
   }
   
   @RequestMapping(value = "/mypage/introUpdate.go")
   public String introUpdate(Model model) {
      logger.info("introUpdate.go 요청");
      
      MypageDTO introDto = mypageService.introduction(userId);
      model.addAttribute("introDto",introDto);
      
 
      return "mypage/introUpdate";
   }
   
   @RequestMapping(value = "/mypage/introUpdate.do", method = RequestMethod.POST)
   public String introUpdateDo(MultipartFile[] photos, String selfExp, String selfInt ) {
      logger.info("photos : {}",Arrays.toString(photos));
      logger.info("selfExp : "+selfExp+" / selfInt : " + selfInt);
     
      int row = mypageService.introCreDo(photos,selfExp,selfInt,userId);
      
      
      return "redirect:/mypage/profile.go";
   }
   
   @RequestMapping(value = "/mypage/appList.ajax")
   @ResponseBody
   public Map<String, Object> listCall(String page, String cnt){
      logger.info("listCall 요청");
      logger.info("페이지당 보여줄 개수 : " +cnt);
      logger.info("요청 페이지" + page);
      
      int currPage = Integer.parseInt(page);
      int pagePerCnt = Integer.parseInt(cnt);
      
      Map<String, Object> map = mypageService.list(currPage,pagePerCnt,userId);
      logger.info("map: " + map);
      
      return map;
   }
   
   @RequestMapping(value = "/mypage/createList.ajax")
   @ResponseBody
   public Map<String, Object> createList(String page, String cnt){
      logger.info("createList 요청");
      logger.info("페이지당 보여줄 개수 : " +cnt);
      logger.info("요청 페이지" + page);
      
      int currPage = Integer.parseInt(page);
      int pagePerCnt = Integer.parseInt(cnt);
      
      Map<String, Object> map = mypageService.createList(currPage,pagePerCnt,userId);
      logger.info("map: " + map);
  
      return map;
   }
   
   @RequestMapping(value = "/mypage/repList.ajax")
   @ResponseBody
   public Map<String, Object> repList(String page, String cnt){
      logger.info("repList 요청");
      logger.info("[rep]페이지당 보여줄 개수 : " +cnt);
      logger.info("[rep]요청 페이지" + page);
      
      int currPage = Integer.parseInt(page);
      int pagePerCnt = Integer.parseInt(cnt);
      
      Map<String, Object> map = mypageService.repList(currPage,pagePerCnt,userId);
      logger.info("[rep]map: " + map);
  
      return map;
   }
   
   @RequestMapping(value= "/mypage/photoList.ajax")
   @ResponseBody
   public Map<String, Object> photoList(String page, String cnt){
      logger.info("photoList 요청");
      logger.info("[photo]페이지당 보여줄 개수 : " +cnt);
      logger.info("[photo]요청 페이지" + page);
      
      int currPage = Integer.parseInt(page);
      int pagePerCnt = Integer.parseInt(cnt);
      
      Map<String, Object> map = mypageService.photoList(currPage,pagePerCnt,userId);
      logger.info("[photo]map: " + map);
      
      return map;
   }
   
  @RequestMapping(value = "/mypage/introPhoDel.ajax")
  @ResponseBody
  public Map<String, Object> introPhoDel(String phoName){
	  logger.info("introPhoDel 요청");
	  logger.info("[del]phoName : "+ phoName);
	  mypageService.introPhoDel(phoName,userId);
	  return null;
  }
  
  @RequestMapping(value="/mypage/repComCall.go")
  public String repComCall(String rep_idx,Model model) {
	  logger.info("repComCall.go 요청");
	  logger.info("rep_idx 값 : " +rep_idx);
	  MypageDTO repCon = mypageService.repComCall(rep_idx,userId);
	  
	  model.addAttribute("repCon",repCon);
	  
	  
	  return "mypage/repComCall";
  }
}