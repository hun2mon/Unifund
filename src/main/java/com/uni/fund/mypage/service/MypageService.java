package com.uni.fund.mypage.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.uni.fund.mypage.dao.MypageDAO;
import com.uni.fund.mypage.dto.MypageDTO;

   

@Service
public class MypageService {
   Logger logger = LoggerFactory.getLogger(getClass());
   @Autowired MypageDAO mypageDAO;
   
   public String file_root = "C:/upload/";
   
   public MypageDTO profile(int userId) {
      logger.info("userId : "+userId);
      return mypageDAO.profile(userId);
   }

   public MypageDTO profileUp(int userId) {
      logger.info("userId : "+userId);
      return mypageDAO.profileUp(userId);
   }

   public int proUpDo(MultipartFile photo, Map<String, String> param, int userId) {
      
      String idx = mypageDAO.getIdx(param);
      String isEmpty = mypageDAO.isEmpty(userId);
      logger.info("isEmpty : " + isEmpty);
      
      String fileName = photo.getOriginalFilename();
      if (!fileName.equals("")) {
         String ext = fileName.substring(fileName.lastIndexOf("."));
      
         String newFileName = System.currentTimeMillis()+ext;
         logger.info(fileName+" -> "+newFileName);
      
         try {
            byte[] bytes = photo.getBytes();
            Path path = Paths.get(file_root+newFileName);
            Files.write(path, bytes);
            if (isEmpty!=null) {
            mypageDAO.fileUpdate(newFileName,idx);
            Thread.sleep(1);   
            }else {
               mypageDAO.fileCreate(newFileName,idx);
               Thread.sleep(1);
               
            }
         } catch (Exception e) {
            
            e.printStackTrace();
         }
      
      
      }
      
      
      return mypageDAO.proUpdo(param);
   }

   public String proPhoto(int userId) {
      logger.info("userId : " + userId);
      return mypageDAO.proPhoto(userId);
   }

   public String proPhotoUp(int userId) {
      logger.info("userId : " + userId);
      return mypageDAO.proPhotoUp(userId);
   }
   
   public String isEmpty(int userId) {
      
      return mypageDAO.isEmpty(userId);
   }
   
   public MypageDTO introduction(int userId) {
      
      return mypageDAO.introduction(userId);
   }
   
   public int introCreDo(MultipartFile[] photos, String selfExp, String selfInt, int userId) {
      logger.info("photos : {}",photos);
       logger.info("selfExp : "+selfExp+" / selfInt : " + selfInt);
       int row = 0;  
       
       String isSelfEmpty = mypageDAO.isSelfEmpty(userId);
       logger.info("isSelfEmpty"+isSelfEmpty);
       if (isSelfEmpty != null) {
          row = mypageDAO.introUpDo(selfExp,selfInt,userId);
      }else {
         row = mypageDAO.introCreDo(selfExp,selfInt,userId);
      }
       
       for (MultipartFile photo : photos) {
         String fileName = photo.getOriginalFilename();
         logger.info("업로드 파일 이름 : " + fileName);
         if (!fileName.equals("")) {
            String ext = fileName.substring(fileName.lastIndexOf("."));
            
            String newFileName = System.currentTimeMillis() +ext;
            logger.info(fileName +" -> "+newFileName);
            
            try {
               byte[] bytes = photo.getBytes();
               Path path = Paths.get(file_root+newFileName);
               Files.write(path, bytes);
               mypageDAO.introFileCreate(newFileName,userId);
               Thread.sleep(1);
            } catch (Exception e) {
               
               e.printStackTrace();
            }
   
         }
      }
       
       
       
       
      return row;
   }

   

   public Map<String, Object> list(int currPage, int pagePerCnt, int userId) {
      int start = (currPage-1) * pagePerCnt;   
      logger.info("내가 펀딩한 목록 list(service)");
      logger.info("pagePerCnt: "+pagePerCnt);
      logger.info("시작 위치 : " + start);
      
      Map<String, Object> result = new HashMap<String, Object>();
      
      List<MypageDTO> list = mypageDAO.list(pagePerCnt,start,userId);
      logger.info( "list size : "+ list.size());
      result.put("list", list);
      result.put("currPage", currPage);
      result.put("totalPages", mypageDAO.allCount(pagePerCnt,userId));
      
      
      return result;
   }

   public Map<String, Object> createList(int currPage, int pagePerCnt, int userId) {
      int start = (currPage-1) * pagePerCnt;
      logger.info("내가 등록한 펀딩 list(service)");
      logger.info("pagePerCnt: "+pagePerCnt);
      logger.info("시작 위치 : " + start);
      
      Map<String, Object> result = new HashMap<String, Object>();
      
      List<MypageDTO> list = mypageDAO.createList(pagePerCnt,start,userId);
      logger.info( "list size : "+ list.size());
      result.put("list", list);
      result.put("currPage", currPage);
      result.put("totalPages", mypageDAO.allCountCre(pagePerCnt,userId));
      return result;
   }

   public Map<String, Object> repList(int currPage, int pagePerCnt, int userId) {
      int start = (currPage-1) * pagePerCnt;
      logger.info("내가 신고한 목록 list(service)");
      logger.info("[rep]pagePerCnt: "+pagePerCnt);
      logger.info("[rep]시작 위치 : " + start);
      
      Map<String, Object> result = new HashMap<String, Object>();
      
      List<MypageDTO> list = mypageDAO.repList(pagePerCnt,start,userId);
      logger.info( "[rep]list size : "+ list.size());
      result.put("list", list);
      result.put("currPage", currPage);
      result.put("totalPages", mypageDAO.allCountRep(pagePerCnt,userId));
      return result;
   }

   public Map<String, Object> photoList(int currPage, int pagePerCnt, int userId) {
      int start = (currPage-1) * pagePerCnt;
      logger.info("[photo]내가 등록한 사진(자소서) list(service)");
      logger.info("[photo]pagePerCnt: "+pagePerCnt);
      logger.info("[photo]시작 위치 : " + start);
      
      Map<String, Object> result = new HashMap<String, Object>();
      
      List<MypageDTO> list = mypageDAO.photoList(pagePerCnt,start,userId);
      logger.info( "[photo]list size : "+ list.size());
      result.put("list", list);
      result.put("currPage", currPage);
      result.put("totalPages", mypageDAO.allCountPho(pagePerCnt,userId));
      return result;
   }
	
	public Map<String, Object> introPhoList(int currPage, int pagePerCnt, int userId) {
		int start = (currPage-1) * pagePerCnt;
	    logger.info("[photo]내가 등록한 사진(자소서) list(service)");
	    logger.info("[photo]pagePerCnt: "+pagePerCnt);
	    logger.info("[photo]시작 위치 : " + start);
	    
	    Map<String, Object> result = new HashMap<String, Object>();
	    
	    List<MypageDTO> list = mypageDAO.photoList(pagePerCnt,start,userId);
	    logger.info( "[photo]list size : "+ list.size());
	    result.put("list", list);
	    result.put("currPage", currPage);
	    result.put("totalPages", mypageDAO.allCountPho(pagePerCnt,userId));
	    return result;
	}
	
	public void introPhoDel(String phoName, int userId) {
		mypageDAO.introPhoDel(phoName,userId);
		
	}
	
	public MypageDTO repComCall(String rep_idx, int userId) {
		
		return mypageDAO.repComCall(rep_idx,userId);
	}
	
	public void outUnifundDO(String mem_id) {
		 mypageDAO.outUnifundDO(mem_id);
		
	}
}