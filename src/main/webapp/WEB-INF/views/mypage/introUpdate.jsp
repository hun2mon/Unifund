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
    margin-top: 15px;
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
    margin-right: 105px;
   }
    .intro{
     
       width: 70px;
       height: 30px;
       border: black;
       margin: auto;
       text-align: center;
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
         margin-left: 71.8%;
          margin-top: 30px;
   }
   
   input[name="selfExp"]{
         width: 50%;
         text-align: center;
         
   }
   
   textarea {
   overflow: auto;
    width: 80%;
    height: 30%;
    resize: none;
   }
   
   input[name="photos"] {
          margin-left: -20.65%;
          margin-top: 24px;
   }
   

</style>
</head>
<body>
   <%@ include file = "/WEB-INF/views/common/header.jsp" %>
   <hr class="hr-13">
   <br>
   <div id="box">
      <div id="minibox">
         <form action="introUpdate.do" method="post" enctype="multipart/form-data">
         <h1>자기소개서</h1>
               <div class="intro">주분야</div>
                  <input type="text" name="selfExp" placeholder="주분야를 입력해주세요."  value="${introDto.self_exp}">
               <div class="intro">자기소개</div>
                  <textarea name="selfInt" placeholder="자기소개를 입력해주세요." >${introDto.self_introduce}</textarea>
               <div id="play">
                  <img class="img" src="resources/img/no_image.png">
               </div>
            <input type="file" name="photos" multiple="multiple">
         <button onclick="introBtn()" id="proBtn">자소서 수정</button>
         </form>
      </div>
   </div>   
</body>
<script>

</script>
</html>