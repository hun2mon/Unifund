<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="../resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
table {
	border-collapse: collapse;
	margin-top: 20;
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.15);
	font-size: 20;
}

th, td {
	width: 500;
	height: 50px;
	text-align: center;
	border: 1px solid rgba(0, 0, 0, 0.3);
	vertical-align: top;
	vertical-align: bottom;
	vertical-align: middle;
}

.mainDiv {
	width: 1300;
	margin: 0 auto;
	margin-top: 20;
}

.middle {
	width: 1300;
}

.topTitle {
	font-size: 40;
}

thead {
	background-color: lightgray;
}

.cashBtn {
	width: 325;
	margin: 0 auto;
	margin-top: 20;
}

.chargeBtn, .cancleBtn {
	width: 150;
	height: 35;
	font-size: 15;
	border: 0px;
	box-shadow: 0px 8px 32px rgba(60, 59, 59, 0.3);
	background-color: rgba(255, 255, 255, 0.15);
	border-radius: 170px;
}

.cancleBtn {
	margin-left: 20;
}

.writeNum {
	height: 30;
	font-size: 15;
	text-align: right;
}

.middleBottom, .middleTop, .dateSelect {
	display: flex;
	font-size: 20;
}

.middleTop {
	margin-left: 1220;
	width: 80;
}

.middleBottom {
	width: 1300;
}

.nowCash {
	margin-left: 858;
	width: 239;
	font-size: 40;
	text-align: right;
}

.selectYear, .selectMonth {
	width: 104;
	height: 30;
	font-size: 20;
}

.dateSelect {
	height: 30;
	margin-top: 65;
	width: 200;
}

.selectMonth {
	margin-left: 10px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="mainDiv">
		<div class="topTitle">캐시내역</div>
		<hr>
		<div class="middle">
			<div class="middleTop">보유 캐시</div>
			<div class="middleBottom">
				<div class="dateSelect">
					<select name="year" class="selectYear" id="year">
					</select> <select name="month" class="selectMonth">
						<option value="전체">전체</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
				<div class="nowCash">${mem_cash}원</div>
			</div>
		</div>
		<form action="./charge.do">
			<table align="center">
				<thead>
					<tr>
						<th scope="col">구매</th>
						<th scope="col">입출금 내역</th>
						<th scope="col">입출금 날짜</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
				<tr>
					<td colspan="3">
						<div class="container">
							<nav aria-label="Page navigation" style="text-align: center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	var isRun = false;

	$(document).ready(function(){
		var year = '전체';
		var month = '전체';
		listCall(year,month,showPage);
	});
	
	var showPage = 1;
	
 	$('.selectMonth').on('change',function(){
		var month = $('.selectMonth').val();
		var year = $('.selectYear').val();
		isRun = false;
		$('#pagination').twbsPagination('destroy');
		listCall(year,month,showPage);
	})
	
	$('.selectYear').on('change',function(){
		var month = $('.selectMonth').val();
		var year = $('.selectYear').val();
		isRun = false;
		$('#pagination').twbsPagination('destroy');
		listCall(year,month,showPage);
	}) 

	function listCall(year,month,showPage) {
 		console.log(year);
 		console.log(month);
 		if(isRun == true) {
 	        return;
 	    }
 	    
		$.ajax({
			type : 'post',
			url : './cashList.ajax',
			data : {
				mem_idx:${mem_idx},
				year:year,
				month:month,
				page:showPage,
				cnt:20
			},
			dataType : 'json',
			success : function(data) {
		 	    isRun = true;
				console.log(data.list);
				console.log(data.year);
				drawList(data.list);
				if (data.year != null) {
					$('#year').html('');				
					drawYear(data.year);					
				}
				$('#pagination').twbsPagination({
	            	startPage:1, 
	            	totalPages:data.totalPages,
	            	visiblePages:5,
	            	onPageClick:function(evt,pg){
	            		isRun = false;
	            		console.log(pg);
	            		listCall(year,month,pg);
	            	}
	            })
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	function drawList(list){
		var content = '';
		for (item of list) {
			/* console.log(item); */
			content += '<tr>';
			content += '<td>' + item.cash_content +item.cash_amount + '</td>';
			content += '<td>' + item.cash_division + '</td>';
			var date = new Date(item.cash_date);
			var dateStr = date.toLocaleDateString("ko-KR");//en_US
			content += '<td>' + dateStr + '</td>';
			content += '</tr>';
		}
		$('#list').html(content);
	};
	
	function drawYear(list){
		var content = '';
		content+='<option value="전체">전체</option>';
		for (item of list) {
			console.log(item.year)
			content += '<option value="' + item.year + '">' + item.year + '</option>'
		}
		$('#year').append(content);
	};
</script>
</html>