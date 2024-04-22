<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
   
   h2{
        text-align: left;
   }
   
   hr{
      height: 10px;
       border: 0;
       box-shadow: 0 10px 10px -10px #8c8c8c inset;
   }
   
   #box{
      width: 1200px;
      height : 3000px;
      margin: auto;
      margin-bottom : 50px;
      border: solid 1px white;
      background-color: white;
      box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        border-radius: 14%;   
   }
   #box:hover{
      box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
   }
   
   #minibox{
      
      width: 1100px;
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
      
      margin-left: 36.8%;
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
    margin-top: 15px;
   }
   
table {
   table-layout: fixed;
   border-collapse: collapse; /* 셀 사이의 간격을 없앱니다. */
   margin: auto;
   margin-top: 10px;
   width: 100%; /* 테이블의 가로 너비를 100%로 설정합니다. */
}

th, td {
   max-width: 25%; /* 각 셀의 최대 너비를 제한합니다. */
   overflow: hidden; /* 텍스트가 셀 영역을 벗어날 경우 숨김 처리합니다. */
   text-overflow: ellipsis; /* 텍스트가 셀 영역을 벗어날 경우 생략 부호로 표시됩니다. */
   white-space: nowrap; /* 텍스트가 셀 영역을 벗어날 경우 줄바꿈을 방지합니다. */
   border: 1px solid white; /* 셀 테두리 스타일을 지정합니다. */
   padding: 8px; /* 셀 안의 내용과 테두리 간의 간격을 설정합니다. */
   text-align: center; /* 셀 안의 텍스트를 가운데 정렬합니다. */
   vertical-align: middle; /* 셀 안의 내용을 수직 가운데로 정렬합니다. */
   
   color: black; /* 텍스트의 색상을 지정합니다. */
   background-color: #ffffff; /* 셀의 배경색을 지정합니다. */
}

.custom-table {
    width: 30%;
    border-color: white;
}

.custom-table th,
.custom-table td {
    padding: 15px;
    text-align: center;
    border-bottom: 1px solid white;
}

.custom-table th {
    background-color: #f2f2f2;
}

.custom-table td {
    background-color: #ffffff;
}

.custom-table th,
.custom-table td:first-child {
    min-width: 120px; /* 첫 번째 열의 최소 너비 설정 */
}

.custom-table th:first-child,
.custom-table td:first-child {
    border-left: 1px solid white;
}

.custom-table th:last-child,
.custom-table td:last-child {
    border-right: 1px solid white;
}

   
   .intro{
      display: inline-block;
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
         overflow: auto;
         resize: none;
       width: 80%;
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
      margin-left: 64.8%;
          margin-top: 87px;
   }
   
   textarea {
   resize: none;
   width: 500px;
   height: 150px;
}
</style>
</head>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>
   <hr class="hr-13">
   <br>
   <div id="box">
      <div id="profile">
            <c:if test="${not empty proPhoto}">
             <img class="img" src="/photo/${proPhoto}">
         </c:if>
         <c:if test="${empty proPhoto}">
             <img class="img" src="resources/profile_img/no_image.jpg">
         </c:if>
      </div>
      
      <div class ="mincmb">캐시</div>
      <div class ="mincmb2">${info.mem_cash}</div>
      <button>내역보기</button>
      <button>충전</button>
   
      <div class ="mincmb1">마일리지</div>
      <div class ="mincmb3">${info.mem_mileage}</div>
      <button>내역보기</button>
      <div>
       <table class="custom-table">
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
      <br>
      <button>신청자목록</button>
      <button onclick="proUp()">프로필수정</button>
      <br><br>
      <div id="minibox">
         <h1>자기소개서</h1>
         <div class="intro">주분야</div>
         <div id="selfExp">${introDto.self_exp}</div>
         <div class="intro">자기소개</div>
         <div id="selfInt">${introDto.self_introduce}</div>
         <div id="play">
            <img class="img" src="resources/img/no_image.png">
         </div>
         <button onclick="introBtn()" id="proBtn">자소서 수정</button>
      </div>
         <h2> 내가 펀딩한 목록</h2>
        <hr class="hr-13">
        <table>
           <thead>
              <tr>
                 <th>프로젝트명</th>
                 <th>상 태</th>
                 <th>전시(출품)날짜</th>
                 <th>마감기한</th>
              </tr>
         </thead>       
      <tbody id="appList"></tbody>   
         <tr>
            <td colspan="4">
               <div class="container">
                   <nav aria-label="Page navigation" style="text-align:center">
                          <ul class="pagination" id="pagination_app"></ul>
                       </nav>               
               </div>
            </td>
         </tr>
        </table> 
        <h2>내가 등록한 펀딩</h2>
        <hr class="hr-13">
        <table>
           <thead>
              <tr>
                 <th>프로젝트명</th>
                 <th>상 태</th>
                 <th>전시(출품)날짜</th>
                 <th>마감기한</th>
              </tr>
         </thead>       
      <tbody id="createList"></tbody>   
         <tr>
            <td colspan="4">
               <div class="container">
                   <nav aria-label="Page navigation" style="text-align:center">
                          <ul class="pagination" id="pagination_cre"></ul>
                       </nav>               
               </div>
            </td>
         </tr>
        </table> 
        <h2>내가 신고한 목록</h2>
        <hr class="hr-13">
        <table>
           <thead>
              <tr>
                 <th>구 분</th>
                 <th>상 태</th>
                 <th>신고내용</th>
                 <th>작성일</th>
              </tr>
         </thead>       
      <tbody id="repList"></tbody>   
         <tr>
            <td colspan="4">
               <div class="container">
                   <nav aria-label="Page navigation" style="text-align:center">
                          <ul class="pagination" id="pagination_rep"></ul>
                       </nav>               
               </div>
            </td>
         </tr>
        </table> 
   </div>
</body>
<script>
   var showPage = 1;
   
   $(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
      
      listCall(showPage);
      createList(showPage);
      repList(showPage); 
   });
   
   function proUp() {
      location.href = 'profileUpdate.go';
   }

   
   function introBtn() {
      location.href = 'introUpdate.go';
   }
   
   function listCall(page) {
   $.ajax({
      type:'get',
      url:'./appList.ajax',
      data:{
         'page':page,
         'cnt':5
      },
      dataType:'json',
      success:function(data){
              console.log(data);
              drawList(data.list);
              
              var startPage = data.currPage  > data.totalPages ? data.totalPages : data.currPage;
              
              $('#pagination_app').twbsPagination({
                  startPage:startPage, // 시작페이지
                  totalPages:data.totalPages, // 총 페이지 갯수
                  visiblePages:5, // 보여줄 페이지 수[1][2][3][4][5]
                  onPageClick:function(evt, pg){
                     console.log(evt);//이벤트 객체
                     console.log(pg);//클릭한 페이지 번호
                     showPage = pg;
                     listCall(pg);
                  }               
               });           
         },
         error:function(error){
             console.log(error);
          } 
   });
}   
   
   function drawList(list) {
      var content = '';
      for(item of list){
         content += '<tr>';
          content += '<td>' + item.pro_title + '</td>';
          if (item.fund_state == 'A') {
              content += '<td style="color: green;font-weight: bolder;"><b>'+'신청중'+'</b></td>';
          } else if (item.fund_state == 'C') {
              content += '<td style="color: gray;font-weight: bolder;" ><b>'+'펀딩완료'+'</b></td>';
          }
          var startdate = new Date(item.pro_startdate);
          var startdateStr = startdate.toLocaleDateString("ko-KR");
          var pro_deadline = new Date(item.pro_deadline);
          var pro_deadlineStr = pro_deadline.toLocaleDateString("ko-KR");
          
          content += '<td>' + startdateStr + '</td>';
          content += '<td>' + pro_deadlineStr + '</td>';
          content += '</tr>';
         
      }
      $('#appList').html(content);
   }
   
   
   function createList(page) {
      $.ajax({
         type:'get',
         url:'./createList.ajax',
         data:{
            'page':page,
            'cnt':5
         },
         dataType:'json',
         success:function(data){
                 console.log(data);
                 drawCreateList(data.list);
                 
                 var startPage = data.currPage  > data.totalPages ? data.totalPages : data.currPage;
                 
                 $('#pagination_cre').twbsPagination({
                     startPage:startPage, // 시작페이지
                     totalPages:data.totalPages, // 총 페이지 갯수
                     visiblePages:5, // 보여줄 페이지 수[1][2][3][4][5]
                     onPageClick:function(evt, pg){
                        console.log(evt);//이벤트 객체
                        console.log(pg);//클릭한 페이지 번호
                        showPage = pg;
                        createList(pg);
                     }               
                  });           
            },
            error:function(error){
                console.log(error);
             } 
      });
   }
   
   function drawCreateList(list) {
      var content = '';
      for(item of list){
         content += '<tr>';
          content += '<td>' + item.pro_title + '</td>';
          if (item.pro_state == 'A') {
              content += '<td><b>신청중</b></td>';
          } else if (item.pro_state == 'B') {
              content += '<td style="color: gray;"><b>펀딩완료</b></td>';
          } else if (item.pro_state == 'C') {
              content += '<td style="color: green;"><b>펀딩중</b></td>';
          } else if (item.pro_state == 'E') {
              content += '<td><b>펀딩실패</b></td>';
          } else if (item.pro_state == 'F') {
              content += '<td style="color: red;"><b>거절</b></td>';
          }
          var startdate = new Date(item.pro_startdate);
          var startdateStr = startdate.toLocaleDateString("ko-KR");
          var pro_deadline = new Date(item.pro_deadline);
          var pro_deadlineStr = pro_deadline.toLocaleDateString("ko-KR");
          
          content += '<td>' + startdateStr + '</td>';
          content += '<td>' + pro_deadlineStr + '</td>';
          content += '</tr>';
         
      }   
      $('#createList').html(content);
   }
   
   function repList(page) {
      $.ajax({
         type:'get',
         url:'./repList.ajax',
         data:{
            'page':page,
            'cnt':5
         },
         dataType:'json',
         success:function(data){
                 console.log(data);
                 drawRepList(data.list);
                 
                 var startPage = data.currPage  > data.totalPages ? data.totalPages : data.currPage;
                 
                 $('#pagination_rep').twbsPagination({
                     startPage:startPage, // 시작페이지
                     totalPages:data.totalPages, // 총 페이지 갯수
                     visiblePages:5, // 보여줄 페이지 수[1][2][3][4][5]
                     onPageClick:function(evt, pg){
                        console.log(evt);//이벤트 객체
                        console.log(pg);//클릭한 페이지 번호
                        showPage = pg;
                        repList(pg);
                     }               
                  });           
            },
            error:function(error){
                console.log(error);
             } 
      });
   }
   
   function drawRepList(list) {
      var content = '';
      for(item of list){
         content += '<tr>';
           content += '<td>' + item.rep_division + '</td>';
           if (item.rns_state === '처리') {
               content += '<td style="color: green;"><b>' + '처리완료' + '</b></td>';
           } else {
               content += '<td style="color: red;"><b>' + '처리중' + '</b></td>';
           }
           content += '<td>' + item.rep_content + '</td>';

          
          var repDate = new Date(item.rep_date);
          var repDateStr = repDate.toLocaleDateString("ko-KR");
          
          content += '<td>' + repDateStr + '</td>';
          content += '</tr>';
         
      }   
      $('#repList').html(content);
   }
</script>
</html>