<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
	margin-left: 881;
	width: 208;
	font-size: 40;
	text-align: right;
}

.selectYear,.selectMonth {
	width: 104;
	height: 30;
	font-size: 20;
}

.dateSelect {
	height: 30;
	margin-top: 20;
}
</style>
</head>
<body>
	<div class="mainDiv">
		<div class="topTitle">캐시내역</div>
		<hr>
		<div class="middle">
			<div class="middleTop">보유 캐시</div>
			<div class="middleBottom">
				<div class="dateSelect">
					<select name="year" class="selectYear" id="year">
					</select>
					<select name="month" class="selectMonth">
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
				<tbody id = "list">
				</tbody>
			</table>
		</form>
	</div>
</body>
<script>
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	$(document).ready(function(){
		console.log('asdf'+year);
		console.log('asdf'+month);
		listCall(year,month);
	});
	
 	$('.selectMonth').on('change',function(){
		var month = $('.selectMonth').val();
		var year = $('.selectYear').val();
		listCall(year,month);
	})
	
	$('.selectYear').on('change',function(){
		var month = $('.selectMonth').val();
		var year = $('.selectYear').val();
		listCall(year,month);
	}) 

	function listCall(year,month) {
 		console.log(year);
 		console.log(month);
		$.ajax({
			type : 'post',
			url : './cashList.ajax',
			data : {
				mem_idx:${mem_idx},
				year:year,
				month:month
			},
			dataType : 'json',
			success : function(data) {
				console.log(data.list);
				console.log(data.year);
				drawList(data.list);
				drawYear(data.year);
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
		for (item of list) {
			console.log(item.year)
			content += '<option value="' + item.year + '">' + item.year + '</option>'
		}
		$('#year').append(content);
	};
</script>
</html>