<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
        text-align: center;
   }
   
   hr{
      height: 5px;
       border: 0;
       box-shadow: 0 10px 10px -10px #8c8c8c inset;
   }
   
   #box{
      width: 1200px;
      height : auto;
      margin: auto;
      margin-bottom : 50px;
      border: solid 1px white;
      background-color: white;
      box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
      transition: all 0.3s cubic-bezier(.25,.8,.25,1);
      border-radius: 14%;  
      padding-bottom: 8%; 
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
   }
   
table {
   table-layout: fixed;
   border-collapse: collapse; /* 셀 사이의 간격을 없앱니다. */
   margin: auto;
   margin-top: 10px;
   width: 80%; /* 테이블의 가로 너비를 100%로 설정합니다. */
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
          margin-top: -30px;
   }
   
   textarea {
   resize: none;
   width: 500px;
   height: 150px;
   }
   .container {
    width: 100%;
    text-align: center;
   
}
   
   #mile{
      margin-left: 0;
   }
   
 	.clickable-text {
    cursor: pointer;
    color: green; /* 클릭 가능한 링크 색상 설정 */
    text-decoration: underline; /* 밑줄 추가 */
	}
	
	.clickable-text:hover {
	    color: darkblue; /* 마우스를 올렸을 때 색상 변경 */
	}
	
	.proRep{
		border-collapse: collapse;
		position: fixed;
		right:50;
		background-color: white;
		display: none;
	}
	
</style>
</head>
<body>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
   
   <br>
   <div id="box">
      <div id="profile">
            <c:if test="${not empty proPhoto}">
             <img class="img" src="/photo/${proPhoto}">
         </c:if>
         <c:if test="${empty proPhoto}">
             <img class="img" src="/photo/no_image.jpg">
         </c:if>
      </div>
      
      <c:if test="${mem_idx eq info.mem_idx}">
      <div class ="mincmb"><b>캐시</b></div>
      <div class ="mincmb2">${info.mem_cash}</div>
      <button onclick="cashList()">내역보기</button>
      <button onclick="cashCharge()">충전</button>
   	  
   	  	
      <div class ="mincmb1"><b>마일리지</b></div>
      <div class ="mincmb3">${info.mem_mileage}</div>
      <button id="mile" onclick="mileageList()">내역보기</button>
      </c:if>
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
      <c:if test="${mem_idx eq info.mem_idx && info.crew_state eq '크루장'}">
      	<button onclick="judgeList()">신청자목록</button>
      </c:if>
      <c:if test="${mem_idx eq info.mem_idx}">
    	  <button onclick="proUp()">프로필수정</button>
      </c:if>
      <br><br>
      <div id="minibox">
         <h1>자기소개서</h1>
         <div class="intro">주분야</div>
         <div id="selfExp">${introDto.self_exp}</div>
         <div class="intro">자기소개</div>
         <div id="selfInt">${introDto.self_introduce}</div>
         <input id="phoMem_idx" value="${info.mem_idx}" hidden>
        <h2>활동사진</h2>
        <hr class="hr-13">
        <table>    
          <tbody id="photoList"></tbody>   
            <tr>
               <td colspan="1">
                  <div class="container">
                   <nav aria-label="Page navigation">
                       <ul class="pagination" id="pagination_pho"></ul>
                   </nav>
               </div>
               </td>
            </tr>
        </table> 
        <c:if test="${mem_idx eq info.mem_idx}">
         	<button onclick="introBtn()" id="proBtn">자소서 수정</button>
      	</c:if>
      </div>
       <c:if test="${(mem_idx eq info.mem_idx) or (mem_status eq 'M')}">
         <h2>신청한 펀딩 목록</h2>
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
                   <nav aria-label="Page navigation">
                          <ul class="pagination" id="pagination_app"></ul>
                       </nav>               
               </div>
            </td>
         </tr>
        </table> 
        <h2>등록한 펀딩 목록</h2>
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
                   <nav aria-label="Page navigation">
                          <ul class="pagination" id="pagination_cre"></ul>
                       </nav>               
               </div>
            </td>
         </tr>
        </table> 
        <h2>신고한 목록</h2>
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
      <tbody id="repList">
      		<table align="center" class="proRep">
				<tr>
					<th scope="col">신고 사유 <input type="text" class="category"
						value="${project.pro_idx}" name="pro_idx" hidden>
					</td>
				</tr>
				<tr>
					<td>사유<br> <input type="text" name="repContent"></td>
				</tr>
				<tr>
					<td class="button"><input type="button" value="신고"
						onclick="report()">
						<input type="button" onclick="repCancle()" value="취소"></td>
				</tr>
			</table>
      </tbody>   
         <tr>
            <td colspan="4">
               <div class="container">
                   <nav aria-label="Page navigation">
                          <ul class="pagination" id="pagination_rep"></ul>
                       </nav>               
               </div>
            </td>
         </tr>
        </table> 
       </c:if> 
   </div>
</body>
<script>
	var msg = '${msg}';
	if (msg !='') {
		alert(msg);	
	}
	
	
   var showPage = 1;
   
   $(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
      
      listCall(showPage);
      createList(showPage);
      repList(showPage); 
      photoList(showPage);
   });
   
   function proUp() {
      location.href = 'profileUpdate.go?userIdx='+ ${info.mem_idx};
   }

   
   function introBtn() {
      location.href = 'introUpdate.go?userIdx='+ ${info.mem_idx};
   }
   
   function cashCharge() {
	   var url = "../money/charge.go"
       var name = "charge";
       var option = "width = 1000, height = 500, top = 100, left = 200, location = no"
       window.open(url, name, option);
   }
   
   function cashList() {
      location.href = '/main/money/cashList.go?mem_idx=${mem_idx}';
   }
   
   function mileageList() {
      location.href = '/main/money/mileageList.go?mem_idx=${mem_idx}';
   }
   
   function judgeList(){
	   var url =  '/main/crew/judgeList.go?crew_idx='+${info.crew_idx};
	   var name = "judge";
	   var option = "width = 1000, height = 550, top = 100, left = 200, location = no"
	   window.open(url, name, option);
   }
   
   function listCall(page) {
   $.ajax({
      type:'get',
      url:'./appList.ajax',
      data:{
         'page':page,
         'cnt':5,
         'mem_idx':${info.mem_idx}
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
      if (list.length === 0) {
          content += '<tr>';
          content += '<td colspan="4">신청한 펀딩이 없습니다.</td>';
          content += '</tr>';  
      } else {
         for(item of list){
            content += '<tr>';
            
            
            var startdate = new Date(item.pro_startdate);
            var startdateStr = startdate.toLocaleDateString("ko-KR");
            var pro_deadline = new Date(item.pro_deadline);
            var pro_deadlineStr = pro_deadline.toLocaleDateString("ko-KR");
            
            
             if (item.fund_state == 'A') {
           		 content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '"><span style="color:green; font-size: 16px; font-weight: bold;">' + item.pro_title + '</span></a></td>';
            	 content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '">' + '<span style="color:green; font-size: 16px; font-weight: bold;">신청중</span>' + '</a></td>';
            	 
                 
             } else if (item.fund_state == 'C') {
            	 content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '"><span style="color:#6C757D; font-size: 16px; font-weight: bold;">' + item.pro_title + '</span></a></td>';
            	 content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '">' + '<span style="color: #6C757D; font-size: 16px; font-weight: bold;">펀딩완료</span>' + '</a></td>';
            	 
             }
             content += '<td>' + startdateStr + '</td>';
             content += '<td>' + pro_deadlineStr + '</td>';
             content += '</tr>';
            
         }
      }
      $('#appList').html(content);
   }
   
   
   function createList(page) {
      $.ajax({
         type:'get',
         url:'./createList.ajax',
         data:{
            'page':page,
            'cnt':5,
            'mem_idx':${info.mem_idx}
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
      if (list.length === 0) {
          content += '<tr>';
          content += '<td colspan="4">등록한 펀딩이 없습니다.</td>';
          content += '</tr>';  
      } else {
         for(item of list){
            content += '<tr>';

            var startdate = new Date(item.pro_startdate);
            var startdateStr = startdate.toLocaleDateString("ko-KR");
            var pro_deadline = new Date(item.pro_deadline);
            var pro_deadlineStr = pro_deadline.toLocaleDateString("ko-KR");
            
            if (item.pro_state == 'A') {
                content += '<td><span style="color:#6ab04c; font-size: 16px; font-weight: bold;">' + item.pro_title + '</span></td>';
                content += '<td><span style="color:#6ab04c; font-size: 16px; font-weight: bold;">' + '심사중' + '</span></td>';
               
            } else if (item.pro_state == 'B') {
            	content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '"><span style="color:#6C757D; font-size: 16px; font-weight: bold;">' + item.pro_title + '</span></a></td>';
            	content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '"><span style="color:#6C757D; font-size: 16px; font-weight: bold;">' + '펀딩완료' + '</span></a></td>';
    
            } else if (item.pro_state == 'C') {
            	content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '"><span style="color:green; font-size: 16px; font-weight: bold;">' + item.pro_title + '</span></a></td>';
            	content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '"><span style="color:green; font-size: 16px; font-weight: bold;">' + '펀딩중' + '</span></a></td>';
            	 
            } else if (item.pro_state == 'E') {
            	content += '<td><span style="color:orange; font-size: 16px; font-weight: bold;">' + item.pro_title + '</span></td>';
                content += '<td style="color: orange;"><b>펀딩실패</b></td>';
                      	
            } else if (item.pro_state == 'F') {
            	content += '<td><span style="color:red; font-size: 16px; font-weight: bold;">' + item.pro_title + '</span></td>';
            	content += '<td style="cursor: pointer; color: red; text-decoration: underline;" onclick="refuseCon(' + item.pro_idx + ')"><b>거절</b></td>';


                
            }

            content += '<td>' + startdateStr + '</td>';
            content += '<td>' + pro_deadlineStr + '</td>';
            content += '</tr>'; 

         } 
      }
      $('#createList').html(content);
   }
   
   function refuseCon(pro_idx) {
 	  var url = "refuseCon.go?pro_idx=" + pro_idx;
       var name = "refuseCon";
       var option = "width = 600, height = 300, top = 100, left = 300, location = no"
       window.open(url, name, option);
	 }
   
   function repList(page) {
      $.ajax({
         type:'get',
         url:'./repList.ajax',
         data:{
            'page':page,
            'cnt':5,
            'mem_idx':${info.mem_idx}
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
      if (list.length === 0) {
          content += '<tr>';
          content += '<td colspan="4">신고내역이 없습니다.</td>';
          content += '</tr>';  
      } else {
         for(item of list){
            content += '<tr>';
              console.log(item.ref_idx);
              if (item.rns_state === '처리') {
            	  if (item.rep_division == '프로젝트') {					
            	  	content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '"><span style="color:green; font-size: 16px; font-weight: bold;">[' + item.rep_division + ']'+ item.pro_title +'</td>';
				  }else{
					 content += '<td><a href="/main/crew/detail.go?crew_idx=' + item.ref_idx + '"><span style="color:green; font-size: 16px; font-weight: bold;">[' + item.rep_division + ']'+ item.crew_name +'</td>';
				  }
            	  content += '<td style="color: green;"><span class="clickable-text" onclick="repComCall(' + item.rep_idx + ')"><b>' + '처리완료' + '</b></span></td>';
              } else {
            	  if (item.rep_division == '프로젝트') {					
              	  	content += '<td><a href="/main/project/detail.go?pro_idx=' + item.pro_idx + '"><span style="color:green; font-size: 16px; font-weight: bold;">[' + item.rep_division + ']'+ item.pro_title +'</td>';
  				  }else{
  					 content += '<td><a href="/main/crew/detail.go?crew_idx=' + item.ref_idx + '"><span style="color:green; font-size: 16px; font-weight: bold;">[' + item.rep_division + ']'+ item.crew_name +'</td>';
  				  }
                  content += '<td style="color: red;"><b>' + '처리중' + '</b></td>';
				  
              }
              content += '<td>' + item.rep_content + '</td>';
   
             
             var repDate = new Date(item.rep_date);
             var repDateStr = repDate.toLocaleDateString("ko-KR");
             
             content += '<td>' + repDateStr + '</td>';
             content += '</tr>';
   
            	     	 
         } 
      }
      $('#repList').html(content);
   }
   var $mem_idx = $('#phoMem_idx').val()
   function photoList(page) {
         $.ajax({
            type:'get',
            url:'./photoList.ajax',
            data:{
               'page':page,
               'cnt':1,
               'mem_idx':$mem_idx
            },
            dataType:'json',
            success:function(data){
                    console.log(data);
                    drawPhoList(data.list);
                    
                    var startPage = data.currPage  > data.totalPages ? data.totalPages : data.currPage;
                    
                    $('#pagination_pho').twbsPagination({
                        startPage:startPage, // 시작페이지
                        totalPages:data.totalPages, // 총 페이지 갯수
                        visiblePages:5, // 보여줄 페이지 수[1][2][3][4][5]
                        onPageClick:function(evt, pg){
                           console.log(evt);//이벤트 객체
                           console.log(pg);//클릭한 페이지 번호
                           showPage = pg;
                           photoList(pg);
                        }               
                     });           
               },
               error:function(error){
                   console.log(error);
                } 
         });
      }
      
      function drawPhoList(list) {
         var content = '';
         if (list.length === 0) {
             content += '<tr>';
             content += '<td><img src="../resources/profile_img/no_image.jpg" style="width: 300px; height: 300px;"></td>';
             content += '</tr>';  
         } else {
             for (item of list) {
                 content += '<tr>';
                 content += '<td><img src="/photo/' + item.pho_name + '" style="width: 300px; height: 300px;"></td>';
                 //content += '<td><button>삭제</button></td>'
                 content += '</tr>';     
             }   
         } 
         $('#photoList').html(content);
    	
      }
      
      function refuseReason(rsn_reason){
    	  alert(rsn_reason);
      }
      
      function repComCall(rep_idx) {
    	  var url = "repComCall.go?rep_idx=" + rep_idx;
          var name = "repComCall";
          var option = "width = 600, height = 700, top = 100, left = 200, location = no"
          window.open(url, name, option);
	 }
</script>
</html>