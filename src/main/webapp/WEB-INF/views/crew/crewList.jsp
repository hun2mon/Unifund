<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	input[name="id"]{
	width: 70%;
	}
	table,th,td{
	border:1px solid black;
	border-collapse: collapse;
}

th,td{
	padding: 5px 10px;
}

button{
	margin: 5px;
}
textarea{
	resize: none;
	width:500px;
	height: 150px;
}

input[type="text"]{
	width:100%;
}
img.icon{
	width: 15px;
	height: 15px;
}	
</style>

</head>
<body>
   <hr/>
   <table>
   <thead>
      <tr>
         
         <th>크루번호</th>
         <th>이미지</th>
         <th>크루명</th>
         <th>주분야</th>
         <th>크루인원</th>
      </tr>
      </thead>
      <tbody id="list"></tbody>
      <tr>
      	<td colspan="5">
      		<div class="container">                           
            	<nav aria-label="Page navigation" style="text-align:center">
                	<ul class="pagination" id="pagination"></ul>
            	</nav>               
        	</div>
      	</td>
      </tr>
   </table>
</body>
<script>
var showPage = 1;

$(document).ready(function(){ 
	listCall(showPage);
});
var cnt = 10;

function listCall(page){
    $.ajax({
       type:'get',
       url:'./crewList.ajax',
       data:{
    	   'page':page,
    	   'cnt':10
       },
       dataType:'json',
       success:function(data){
          drawList(data.crewList);
          console.log(data);          
          // 플러그인 추가
          
          var startPage = data.currentPage >data.totalPages ? data.totalPages : data.currentPage;
          
          $('#pagination').twbsPagination({
        	  startPage:startPage,		// 시작페이지
        	  totalPages:data.totalPages, 	// 총 페이지 갯수
        	  visiblePages:5,	// 보여줄 페이지 수 [1][2][3][4][5]
        	  onPageClick:function(evt, pg){ // 페이지 클릭시 실행 함수
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

function drawList(list){
 var content = '';
 for(item of list){
    //console.log(item);
    content += '<tr>';
    content += '<td>' + item.crew_idx + '</td>';
    content += '<td>';
    
    var img = item.img_cnt > 0 ?'image.png' : 'no_image.png';
    content += '<img class="icon" src="resources/img/' + img + '"/>'; 

    content += '</td>';
    content += '<td>' + item.crew_name + '</td>';
    content += '<td>' + item.crew_exp + '</td>';
    content += '<td>' + item.crew_num + '</td>';
      
    
    content += '</tr>';
 }
 
 $('#list').html(content);
}

      
</script>
</html>