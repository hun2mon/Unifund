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
table {
	border-collapse: collapse;
	margin-top: 20;
    width: 600px;
}

th, td {
	width: 200px;
	height: 50px;
	text-align: center;
	border: 1px solid #000;
	vertical-align: top;
	vertical-align: bottom;
	vertical-align: middle;
}
.btn{
    width: 70px;
    height: 30px;
    border: 0px;
    border-radius: 100px;
}

.btn:hover{
    box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
    cursor: pointer;
}

#appBtn{
    background-color: cornflowerblue;
}
</style>
</head>
<body>
	 <table align="center" class="appMain">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">신청 날짜</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody class="appBody">
			</tbody>
	        <tr>
		      	<td colspan="3">
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
	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
		listCall(showPage);
	});
	
	var showPage = 1;
	
	function listCall(showPage){
		$.ajax({
			type : 'post',
			url : './appList.ajax',
			data : {
				page:showPage,
				cnt:10,
				crew_idx:${crew_idx}
			},
			dataType : 'json',
			success : function(data) {
				drawAppList(data.list);
				$('#pagination').twbsPagination({
	            	startPage:1, // 시작페이지
	            	totalPages:data.totalPages,
	            	visiblePages:5,
	            	onPageClick:function(evt,pg){
	            		console.log(pg);
	            		listCall(pg);
	            	}
	            })
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	function drawAppList(list) {
		var content = '';
		for(crew of list){
			content += '<tr>';
			content += '<th scope="col" class="memId">' + crew.mem_id + '</th>';
			var date = new Date(crew.crew_mem_date);
			var dateStr = date.toLocaleDateString("ko-KR");
			content += '<th scope="col" class="appDate">' + dateStr + '</th>';
			content += '<th scope="col">';
			content += '<input type="button" value="승인" class="btn" id="appBtn" onclick="approve(' + crew.mem_idx +')">';
			content += '<input type="button" value="거절" class="btn" id="refuseBtn">';
			content += '</th>';
			content += '</tr>';
		}
		$('.appBody').html(content);
	}
	
	function approve(idx){
		if (confirm("승인 하시겠습니까?")) {
			$.ajax({
				type : 'post',
				url : './approve.ajax',
				data : {
					mem_idx:idx,
					crew_idx:${crew_idx}
				},
				success : function(data) {
					listCall(showPage);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	}

</script>
</html>