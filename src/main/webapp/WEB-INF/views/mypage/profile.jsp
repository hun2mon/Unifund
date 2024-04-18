<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<style>
   body {
     background: #e2e1e0;
     text-align: center;
   }
   #title{
      height: 150px;
        width: 100%;
        line-height : 150px;
        text-align: center;
        background-color: white;
   }
   h1{
      text-align: center;
   }
   
   hr{
      height: 10px;
       border: 0;
       box-shadow: 0 10px 10px -10px #8c8c8c inset;
   }
   
   #box{
      width: 800px;
      height : 1500px;
      margin: auto;
      margin-bottom : 150px;
      border: solid 1px white;
      background-color: white;
      box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        border-radius: 18%;   
   }
   #box:hover{
      box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
   }
   
   #minibox{
      
      width: 700px;
       height: 880px;
       margin: auto;
       margin-top: 20px;
       border: solid 1px white;
       background-color: #f8fbfc;
       box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
       transition: all 0.3s cubic-bezier(.25,.8,.25,1);
       border-top-right-radius: 20%;
       border-top-left-radius: 20%;
       border-bottom-right-radius: 20%;
       border-bottom-left-radius: 20%
   }
   
   #minibox:hover{
      box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
   }
   
   .cmb{
      width: 300px;
       height: 30px;
       border: solid 1px black;
       margin-left: 55%
   }
   
   .mincmb{
      display: inline-block;
      width: 100px;
      height: 10px;
      
      margin-left: 40%
   }
   
   .mincmb1{
   display: inline-block;
      width: 100px;
      height: 10px;
      margin-left: 32%;
       text-align: right;
       margin-right: 6;
   }
   
   .mincmb2{
      display: inline-block;
      width: 100px;
      height: 10px;
      
   }
   .mincmb3{
      display: inline-block;
      width: 100px;
      height: 10px;
      
   }
   
   
   
   #profile{
      
      width: 150px;
       height: 150px; 
       border-radius: 70%;
       overflow: hidden;
       margin: auto;
       margin-top: 50px;
       box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
   }
   
   #profile:hover{
      box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
   }
   
   .img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    margin: auto;
   }
   
   table,td,th {
      border: white;
       margin: auto;
       margin-top: 10px;
       height: 50px;
       
   }
   
   .intro{
      display: inline-block;
       width: 70px;
       height: 30px;
       border: black;
       margin: auto;
       text-align: left;
       font-weight: bold;
       font-size: 17px;
   }
   
   #selfExp{
      
      width: 400px;
      height: 30px;
      border: black;
      margin: auto;
      padding: 10px 0;
      background-color :white;
   }
   
   #selfInt{
      width: 400px;
       height: 200px;
       background-color :white;
       margin: auto;
       padding: 10px 0;
       
   }
   
   #play{
      width: 400px;
      height: 300px;
      
      margin: auto;
      margin-top: 10px;
   }
   
   #proBtn{
      margin-left: 37.8%;
       margin-top: 10px;
   }
</style>
</head>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>
   <div id="title">
      <h1>UNIFUND</h1>
   </div>
   <hr class="hr-13">
   <br>
   <div id="box">
      <div id="profile">
         <img class="img" src="resources/img/카리나.jpg">
      </div>
      
      <div class ="mincmb">캐시</div>
      <div class ="mincmb2">${info.mem_cash}</div>
      <button>내역보기</button>
      <button>충전</button>
   
      <div class ="mincmb1">마일리지</div>
      <div class ="mincmb3">${info.mem_mileage}</div>
      <button>내역보기</button>
      <div>
         <table>
                <tr>
                  <th>아이디</th>
                  <td>${info.mem_id}</td>
              </tr>
              <tr>
                  <th>생년월일</th>
                  <td>${info.mem_birth}</td>
              </tr>
              <tr>
                  <th>성별</th>
                  <td>${info.mem_gender}</td>
              </tr>
              <tr>
                  <th>대학교</th>
                  <td>${info.mem_uni}</td>
              </tr>
              <tr>
                  <th>크루</th>
                  <td>${info.crew_name}</td>
              </tr>
          </table>
      </div>
      <button>신청자목록</button>
      <button onclick="proUp()">프로필수정</button>
      <div id="minibox">
         <h1>자기소개서</h1>
         <div class="intro">주분야</div>
         <div id="selfExp">주분야를 입력해주세요</div>
         <div class="intro">자기소개</div>
         <div id="selfInt">자기소개내용을 입력해주세요</div>
         <div id="play">
            <img class="img" src="resources/img/no_image.png">
         </div>
         <button id="proBtn">프로필 수정</button>
      </div>
   </div>
</body>
<script>
   function proUp() {
      location.href = 'profileUpdate.go';
   }
   console.log( ${info.crew_name});
</script>
</html>