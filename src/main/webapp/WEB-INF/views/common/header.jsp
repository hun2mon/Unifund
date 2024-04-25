<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/layout.css"/>" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

<div class="w3-top">

  <div class="w3-bar w3-white w3-card">
  	
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
  	<a class="w3-bar-item w3-button w3-padding-large w3-hover-black" href="../"><b>UNIFUND</b></a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button w3-hover-purple" title="More" onclick="javascript:location.href='./list.go'">프로젝트<i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="./list.go?category=1" class="w3-bar-item w3-button w3-hover-purple">전시회</a>
        <a href="./list.go?category=2" class="w3-bar-item w3-button w3-hover-purple">공연</a>
        <a href="./list.go?category=3" class="w3-bar-item w3-button w3-hover-purple">축제</a>
        <a href="./list.go?category=4" class="w3-bar-item w3-button w3-hover-purple">창작물</a>
        <a href="./list.go?category=5" class="w3-bar-item w3-button w3-hover-purple">기타</a>
      </div>
      
    
   </div>
     <a href="../crew/list.go" class="w3-bar-item w3-button w3-padding-large w3-hover-purple">크루 </a>
     <a href="../announcement/list.go" class="w3-bar-item w3-button w3-padding-large w3-hover-purple">공지사항 </a>
     <a href="../qna/list.go" class="w3-bar-item w3-button w3-padding-large w3-hover-purple">Q&A </a>
    
   
     <a href="/main/mypage/profile.go?userIdx=${mem_idx}" class="w3-padding-large w3-hover-purple w3-hide-small w3-right"><i class="fa fa-user"></i></a>
   	 <a href="javascript:void(0)" class="w3-padding-large w3-hover-purple w3-hide-small w3-right"><i class="fa fa-bell"></i></a>
   	 <a href="javascript:void(0)" class="w3-padding-large w3-hover-purple w3-hide-small w3-right"><i class="fa fa-user"></i></a>
  </div>
</div>