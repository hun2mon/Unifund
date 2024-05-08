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
	width: 400;
	height: 50px;
	text-align: center;
	border: 1px solid rgba(0, 0, 0, 0.3);
	vertical-align: top;
	vertical-align: bottom;
	vertical-align: middle;
}

.mainDiv {
	width: 800;
	margin: 0 auto;
	margin-top: 20;
}

.topTitle {
	font-size: 25;
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
</style>
</head>
<body>
	<div class="mainDiv">
		<div class="topTitle">충전금액선택</div>
		<hr>
		<form action="./charge.do">
			<table align="center">
				<thead>
					<tr>
						<th scope="col">구매금액</th>
						<th scope="col">세부충전내역</th>
					</tr>
				</thead>
				<tr>
					<td><input type="radio" class="rad" value="5000"
						name="cashCharge" onclick="disable()">5,000원</td>
					<td>5,000캐시</td>
				</tr>
				<tr>
					<td><input type="radio" class="rad" value="10000"
						name="cashCharge" onclick="disable()">10,000원</td>
					<td>10,000캐시</td>
				</tr>
				<tr>
					<td><input type="radio" class="rad" value="20000"
						name="cashCharge" onclick="disable()">20,000원</td>
					<td>20,000캐시</td>
				</tr>
				<tr>
					<td><input type="radio" class="rad" value="30000"
						name="cashCharge" onclick="disable()">30,000원</td>
					<td>30,000캐시</td>
				</tr>
				<tr>
					<td><input type="radio" id="sel" class="rad" name="select"
						onclick="cashWrite(this)">직접입력</td>
					<td><input type="number" class="writeNum" name="cashCharge"
						disabled>캐시</td>
				</tr>
			</table>
			<div class="cashBtn">
				<button class="chargeBtn" onclick="charge()">충전하기</button>
				<input type="button" value="취소하기" class="cancleBtn" onclick="closePopUp()">
			</div>
		</form>
	</div>
</body>
<script>
	function cashWrite(th) {
		if ($(th).attr('checked', true)) {
			$('.writeNum').attr('disabled', false)
		}
	}
	function disable() {
		console.log($('.rad'))
		$('.writeNum').attr('disabled', true);
		$('#sel').prop('checked', false);
		$('.writeNum').val('');
	}
	
	function closePopUp() {
	    window.close();
	  }
	function charge() {
		$.ajax({
			type:'get'
			,url:'./close.ajax'
			,data:{
			}
			,dataType:'json'
			,success:function(data){
				alert('충전이 완료 되었습니다.');
				opener.parent.location.reload();
				window.close();
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
</script>
</html>