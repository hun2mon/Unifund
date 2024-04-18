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
      height : 1000px;
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
   th,td{
      padding: 5px 10px;
      text-align: center;
   }
   
   .out{
      margin-left: 2%;
    margin-right: 153px;
   }
   
   input[readonly] {
    background-color: #ccc;
</style>
</head>
<body>
<div id="title">
      <h1>UNIFUND</h1>
   </div>
   <hr class="hr-13">
   <br>
   <div id="box">
      <div id="profile">
         <img class="img" src="resources/img/카리나.jpg">
      </div>
      <div>
         <table>
            <tr>
                  <th>프로필사진</th>
                  <td>
                  <input type="file" name="photos" style="margin-right: -75">
                  </td>
              </tr>
                <tr>
                  <th>아이디</th>
                  <td>
                  <input type="text" readonly="readonly" value="${info.mem_id}">
                  </td>
              </tr>
              <tr>
                  <th>비밀번호</th>
                  <td>
                  <input type="text" readonly="readonly" value="${info.mem_pw}">
                  </td>
              </tr>
              <tr>
                  <th>이름</th>
                  <td>
                  <input type="text" readonly="readonly" value="${info.mem_name}">
                  </td>
              </tr>
              <tr>
                  <th>생년월일</th>
                  <td>
                  <input type="text" readonly="readonly" value="${info.mem_birth}">
                  </td>
              </tr>
              <tr>
                  <th>연락처</th>
                  <td>
                  <input type="text" value="${info.mem_number}">
                  </td>
              </tr>
              <tr>
                  <th>성별</th>
                  <td>
                  <input type="text" value="${info.mem_gender}">
                  </td>
              </tr>
              <tr>
                  <th>우편번호</th>
                  <td>
                  <input type="text" value="${info.mem_post}">
                  </td>
              </tr>
              <tr>
                  <th>주소</th>
                  <td>
                  <input type="text" value="${info.mem_addr}">
                  </td>
              </tr>
              <tr>
                  <th>상세주소</th>
                  <td>
                  <input type="text" value="${info.mem_detail}">
                  </td>
              </tr>
              <tr>
                  <th>대학교</th>
                  <td>
                  <input type="text" readonly="readonly" value="${info.mem_uni}">
                  </td>
              </tr>
              <tr>
                  <th>이메일</th>
                  <td>
                  <input type="text" value="${info.mem_email}">
                  </td>
              </tr>
              <tr>
                  <th>은행명</th>
                  <td>
                  <input type="text" value="${info.mem_bankName}">
                  </td>
              </tr>
              <tr>
                  <th>계좌번호</th>
                  <td>
                  <input type="text" value="${info.mem_bank}">
                  </td>
              </tr>
          </table>
      </div>
      <button class="out">회원탈퇴</button>
      <button class="proChn" onclick="proChn()">프로필수정</button>
   </div>   
</body>
<script>
function proChn() {
   location.href = 'profile.go';
}
</script>
</html>