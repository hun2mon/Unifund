package com.uni.fund.mypage.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
  
   // mem_idx -> userId로 바꿔서 처리 함(문의 : 김진호)
   @RequestMapping(value = "/mypage/profile.go")
   public String profile(Model model, String userIdx,HttpSession session) {
      logger.info("profile요청");
      logger.info("userIdx : ",userIdx);
      String page = "redirect:/member/login.go";
      String memId = (String) session.getAttribute("mem_id");
      int mem_idx = Integer.parseInt(userIdx);
      	if (memId != null) {
      		page = "mypage/profile";
      		MypageDTO dto = mypageService.profile(mem_idx);
      		logger.info("UserInfo :{}",dto.toString());
      		
      		String proPhoto = mypageService.proPhoto(mem_idx);
      		logger.info("proPhoName :" +proPhoto);
      		
      		MypageDTO introDto = mypageService.introduction(mem_idx);
      		logger.info("introductionInfo : {}", introDto);
      		
      		
      		model.addAttribute("info",dto);
      		model.addAttribute("proPhoto",proPhoto);
      		model.addAttribute("introDto",introDto);
			
		}		
      return page;
   }
   
   @RequestMapping(value = "/mypage/profileUpdate.go")
   public String profileUpdate(Model model, String userIdx,HttpSession session) {
      logger.info("profileUpdate.go 요청");
      String page = "redirect:/member/login.go";
      String memId = (String) session.getAttribute("mem_id");
      int mem_idx = Integer.parseInt(userIdx);
  	  if (memId != null) {
  		  page = "mypage/profileUpdate";  		  
  		  MypageDTO dto = mypageService.profileUp(mem_idx);
  		  logger.info("UserInfo :{}",dto.toString());
  		  
  		  String proPhoto = mypageService.proPhotoUp(mem_idx);
  		  logger.info("proPhoName :" +proPhoto);
  		  
  		  model.addAttribute("info",dto);
  		  model.addAttribute("proPhoto", proPhoto);
  	  }
      return page;
   }
   
   @RequestMapping(value = "/mypage/profileUpdate.do", method = RequestMethod.POST)
   public String profileUpdateDo(MultipartFile photo,HttpSession session , @RequestParam Map<String,String> param, Model model){
      logger.info("profileUpdate.do 요청");
      logger.info("photo : {}",photo.toString());
      logger.info("param : {}",param);
      
      int mem_idx =  (int) session.getAttribute("mem_idx");

      int row = mypageService.proUpDo(photo,param,mem_idx);
      
      return "redirect:/mypage/profile.go?userIdx="+mem_idx;
   }
   
   @RequestMapping(value = "/mypage/introUpdate.go")
   public String introUpdate(Model model, String userIdx,HttpSession session) {
      logger.info("introUpdate.go 요청");
      String page = "redirect:/member/login.go";
      String memId = (String) session.getAttribute("mem_id");
      int mem_idx = Integer.parseInt(userIdx);
      if (memId != null) {
    	  page = "mypage/introUpdate";
    	  MypageDTO introDto = mypageService.introduction(mem_idx);
    	 
    	logger.info("[introUp]userIdx : "+mem_idx);  
    	model.addAttribute("introDto",introDto);
    	model.addAttribute("memIdx", mem_idx); 
      }
      
      return page;
   }
   
   @RequestMapping(value = "/mypage/introUpdate.do", method = RequestMethod.POST)
   public String introUpdateDo(MultipartFile[] photos, HttpSession session, String selfExp, String selfInt, String mem_idx) {
      logger.info("photos : {}",Arrays.toString(photos));
      logger.info("selfExp : "+selfExp+" / selfInt : " + selfInt);
      logger.info("[introUpDo]mem_idx : "+mem_idx);
      int memIdx = Integer.parseInt(mem_idx);
      String page = "redirect:/mypage/profile.go?userIdx="+memIdx;
      int row = mypageService.introCreDo(photos,selfExp,selfInt,memIdx);
 
      return page;
   }
   
   @RequestMapping(value = "/mypage/appList.ajax")
   @ResponseBody
   public Map<String, Object> listCall(String page,HttpSession session, String cnt, String mem_idx){
      logger.info("listCall 요청");
      logger.info("페이지당 보여줄 개수 : " +cnt);
      logger.info("요청 페이지" + page);
      int memIdx = Integer.parseInt(mem_idx);
      int currPage = Integer.parseInt(page);
      int pagePerCnt = Integer.parseInt(cnt);
      
      Map<String, Object> map = mypageService.list(currPage,pagePerCnt,memIdx);
      logger.info("map: " + map);
      
      return map;
   }
   
   @RequestMapping(value = "/mypage/createList.ajax")
   @ResponseBody
   public Map<String, Object> createList(String page,HttpSession session, String cnt, String mem_idx){
      logger.info("createList 요청");
      logger.info("페이지당 보여줄 개수 : " +cnt);
      logger.info("요청 페이지" + page);
      
      int memIdx = Integer.parseInt(mem_idx);
      int currPage = Integer.parseInt(page);
      int pagePerCnt = Integer.parseInt(cnt);
      
      Map<String, Object> map = mypageService.createList(currPage,pagePerCnt,memIdx);
      logger.info("map: " + map);
  
      return map;
   }
   
   @RequestMapping(value = "/mypage/repList.ajax")
   @ResponseBody
   public Map<String, Object> repList(String page,HttpSession session, String cnt, String mem_idx){
      logger.info("repList 요청");
      logger.info("[rep]페이지당 보여줄 개수 : " +cnt);
      logger.info("[rep]요청 페이지" + page);
      
      int memIdx = Integer.parseInt(mem_idx);
      int currPage = Integer.parseInt(page);
      int pagePerCnt = Integer.parseInt(cnt);
      
      Map<String, Object> map = mypageService.repList(currPage,pagePerCnt,memIdx);
      logger.info("[rep]map: " + map);
  
      return map;
   }
   
   @RequestMapping(value= "/mypage/photoList.ajax")
   @ResponseBody
   public Map<String, Object> photoList(String page,String mem_idx, String cnt){
      logger.info("photoList 요청");
      logger.info("[photo]페이지당 보여줄 개수 : " +cnt);
      logger.info("[photo]요청 페이지" + page);
      logger.info("mem_idx : " + mem_idx);
     
      int currPage = Integer.parseInt(page);
      int pagePerCnt = Integer.parseInt(cnt);
      int memIdx = Integer.parseInt(mem_idx);
      Map<String, Object> map = mypageService.photoList(currPage,pagePerCnt,memIdx);
      logger.info("[photo]map: " + map);
      
      return map;
   }
   
  @RequestMapping(value = "/mypage/introPhoDel.ajax")
  @ResponseBody
  public Map<String, Object> introPhoDel(HttpSession session,String phoName){
	  logger.info("introPhoDel 요청");
	  logger.info("[del]phoName : "+ phoName);
	 
	  int mem_idx =  (int) session.getAttribute("mem_idx");
	  mypageService.introPhoDel(phoName,mem_idx);
	  return null;
  }
  
  @RequestMapping(value="/mypage/repComCall.go")
  public String repComCall(String rep_idx,HttpSession session,Model model) {
	  logger.info("repComCall.go 요청");
	  logger.info("rep_idx 값 : " +rep_idx);
	  int mem_idx =  (int) session.getAttribute("mem_idx");
	  MypageDTO repCon = mypageService.repComCall(rep_idx,mem_idx);
	  
	  model.addAttribute("repCon",repCon);
	  
	  
	  return "mypage/repComCall";
  }
  
  @RequestMapping(value="/mypage/outUnifund.do")
  public String outUnifundDO(HttpSession session,Model model){
	  logger.info("outUnifundDo 요청");
	  String mem_id = (String) session.getAttribute("mem_id");
	  mypageService.outUnifundDO(mem_id);
	  model.addAttribute("msg","회원 탈퇴가 완료되었습니다.");
	  
	  return "redirect:/member/login.go";
  }
  
}