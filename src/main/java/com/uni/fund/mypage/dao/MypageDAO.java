package com.uni.fund.mypage.dao;

import java.util.List;
import java.util.Map;

import com.uni.fund.mypage.dto.MypageDTO;

public interface MypageDAO {

   MypageDTO profile(int userId);

   MypageDTO profileUp(int userId);

   void fileCreate(String newFileName, String idx);
   
   int proUpdo(Map<String, String> param);
   
   String getIdx(Map<String, String> param);
   
   String proPhoto(int userId);
   
   String proPhotoUp(int userId);
   
   String isEmpty(int userId);

   void fileUpdate(String newFileName, String idx);

   MypageDTO introduction(int userId);

   int introCreDo(String selfExp, String selfInt, int userId);

   int introUpDo(String selfExp, String selfInt, int userId);

   String isSelfEmpty(int userId);
   
   void introFileCreate(String newFileName, int userId);
   
   List<MypageDTO> list(int pagePerCnt, int start, int userId);
   
   int allCount(int pagePerCnt, int userId);

   List<MypageDTO> createList(int pagePerCnt, int start, int userId);

   int allCountCre(int pagePerCnt, int userId);

   List<MypageDTO> repList(int pagePerCnt, int start, int userId);

   int allCountRep(int pagePerCnt, int userId);

   List<MypageDTO> photoList(int pagePerCnt, int start, int userId);

   int allCountPho(int pagePerCnt, int userId);

}