<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
      <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>   
      <script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
table {
	width: 50%;
	border-collapse: collapse;
	margin: 20px auto;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

.red-text {
	color: red;
}

</style>
</head>
<body>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	<h2>공지사항 리스트</h2>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${annList}" var="announcement">
				<tr>
					<td>
						${announcement.noti_idx}
					</td>
					<td <c:if test="${announcement.noti_top eq 'B'}">class="red-text"</c:if>>
						${announcement.noti_title}
					</td>
					<td	>
						${announcement.noti_date}
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="6" id="paging">
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
var 
showPage = 1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

	
function listCall(page){
	$.ajax({
		type : 'get',
		url : './annList.ajax',
		data : {
			'page':page,
			'cnt':20
		},
		dataType:'json',
		success : function(data) {
			console.log(data);
			//플러그인 추가
			
			var startPage = data.currPage > data.totalPages ? data.totalPages : data.currPage;
			
			$('#pagination').twbsPagination({
				startPage:startPage,	//시작페이지
				totalPages:data.totalPages,	//전체페이지수
				visiblePages:5,	//보여줄페이지 	[1][2][3][4][5]
				onPageClick:function(evt,pg){	//페이지클릭시 실행함수
					console.log(evt);	//이벤트객체
					console.log(pg);	//클릭한 페이지 번호
					showPage = pg;
					listCall(pg);
				}
			});
		},
         error:function(error){
            console.log(error)
         }
      });
}
	

	
	
</script>
</html>