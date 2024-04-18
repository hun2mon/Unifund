package com.uni.fund.mypage.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

   public int proUpDo(MultipartFile photo, Map<String, String> param) {
      
      String idx = mypageDAO.getIdx(param);
      
      String fileName = photo.getOriginalFilename();
      if (!fileName.equals("")) {
         String ext = fileName.substring(fileName.lastIndexOf("."));
      
         String newFileName = System.currentTimeMillis()+ext;
         logger.info(fileName+" -> "+newFileName);
      
         try {
            byte[] bytes = photo.getBytes();
            Path path = Paths.get(file_root+newFileName);
            Files.write(path, bytes);
            mypageDAO.fileUpdate(newFileName,idx);
            Thread.sleep(1);
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
}