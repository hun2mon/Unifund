<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
}

th, td {
	width: 100px;
	height: 50px;
	text-align: center;
	border: 1px solid #000;
	vertical-align: top;
	vertical-align: bottom;
	vertical-align: middle;
}

.adress {
	width: 500px;
	height : 20px;
}

.phone {
	width: 150px;
}
</style>
</head>
<body>
	<table align="center">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">배송지</th>
				<th scope="col">연락처</th>
			</tr>
		</thead>
		<tbody id = "list">
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
	var proIdx = ${proIdx};
	
	function listCall(showPage){
		$.ajax({
			type:'get'
			,url:'./appList.ajax'
			,data:{
				page:showPage,
				cnt:10,
				pro_idx:proIdx
			}
			,dataType:'json'
			,success:function(data){
				console.log(data.list);
				drawList(data.list);
				$('#pagination').twbsPagination({
	            	startPage:1, // 시작페이지
	            	totalPages:data.totalPages,
	            	visiblePages:5,
	            	onPageClick:function(evt,pg){
	            		console.log(pg);
	            		num = pg;
	            		listCall(pg);
	            	}
	            })
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	function drawList(list){
		var content = '';
		for (item of list) {
			/* console.log(item); */
			content += '<tr>';
			content += '<td class="mem_id">' + item.mem_id + '</td>';
			content += '<td class="adress">' + item.mem_addr + '</td>';
			content += '<td class="phone">' + item.mem_number + '</td>';
			content += '</tr>'; 
		}
		$('#list').html(content);
	};
	
</script>
</html>