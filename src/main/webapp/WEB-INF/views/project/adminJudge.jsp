<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

div.div_main {
	display: flex;
}

.div_right {
	width: 510px;
	height: 550px;
	margin-top: 10;
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
    background-color: rgba(255, 255, 255, 0.15);
}

div.div_left {
	width: 1000px;
}

.top {
	font-size: 12;
	display: flex;
	margin-top: 10;
	margin-left: 5;
}

.top_middle, .bottom_top, .bottom {
	margin-left: 5;
}

.top_middle>div, .bottom_top>div, .bottom>div {
	padding-top: 10;
}

.top>div {
	margin-right: 10;
}

.userID {
	margin-left: 5;
	width: 115;
}

.project_bookmark {
	margin-left: 60;
	right: 0;
}

.project_good {
	margin-left: 5;
}

.project_title {
	font-size: 20px;
	font-weight: 600;
	width: 220;
}

.middle_top, .middle_middle, .middle_bottom, .money, .buy_reword,
	.total_price, .mileage {
	display: flex;
}

.date {
	font-size: 15px;
}

.pro_button, .buy_but, .delete, .like, .favorites {
	width: 100;
	font-size: 14;
	margin-left: 5;
	border: 1px solid white;
	background-color: whitesmoke;
}

.report:hover {
	background-color: red;
}

hr {
	margin: 0;
	margin-top: 5;
}

.quantity {
	margin-left: 300;
}

input[type=number] {
	width: 50;
	height: 30;
}

.reword_price {
	width: 130;
	font-size: 20;
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	-webkit-appearance: inner-spin-button;
	opacity: 1;
}

.path {
	width: 500;
	margin-bottom: 0;
}

.mileage_form {
	background-color: beige;
	padding: 0;
}

.mileage_form>div {
	padding: 7;
}

.mileage_value, .use_mileage_value {
	margin-left: 330;
}

.use_mileage_value {
	width: 95;
	text-align: right;
	height: 25;
	font-size: 15;
}

.funding_button {
	margin-left: 0;
}

#fund_apply {
	border: 3px solid yellow;
	color: gray;
	background-color: yellow;
	width: 500;
	height: 30;
}

#fund_apply:hover {
	background-color: fce205;
	color: gray;
}

#fund_update {
	background-color: C2C3CB;
	color: gray;
	border: 0;
	width: 500;
	height: 30;
}

#fund_update:hover {
	background-color: gray;
	color: gray;
}

.final_price {
	margin-left: 240;
	text-align: right;
	width: 140;
	font-size: 20;
}

.detail_img {
	width: 900;
	margin-left: 30;
	margin-top: 10;
}

.pro_content {
	display: block;
	text-align: center;
	margin-top: 20;
	width: 900;
	margin-left: 60;
}

.more_review {
	text-align: center;
}

.div_review {
	width: 1060;
	margin-left: 300;
	margin-top: 30;
	z-index: 1;
}

.div_review, .div_review * {
	padding-bottom: 5;
	padding-top: 5;
}

.div_flex {
	display: flex;
}

.reviewFrom, .review_content {
	width: 1000;
	height: 100;
}

.sub_review {
	margin-left: 670;
}

.file_select {
	width: 260;
}

.review_content {
	border-radius: 5px 5px;
	background-color: FFFFCC;
}

.profile_img {
	width: 50;
	height: auto;
}

.spanMargin {
	margin-left: 10;
	border-radius: 5px 5px;
	background-color: FFFFCC;
}

.rev_img {
	width: 100;
	height: auto;
	margin-left: 10;
}

.more {
	width: 100;
	margin-left: 450;
	border: 0px;
	border-radius: 5px 5px;
	background-color: FFFFCC;
}

.selectNum {
	margin-left: 10;
	margin-top: 20;
	width: 100;
}

.proDel {
	border-collapse: collapse;
	position: fixed;
	right:50;
	background-color: white;
	display: none;
}

th, td {
	width: 600px;
	height: 50px;
	text-align: left;
	border: 1px solid #000;
	vertical-align: top;
	vertical-align: bottom;
	vertical-align: middle;
}

.button {
	text-align: center;
}

input[name=reportTitle] {
	width: 550;
}

input[name=refuseContent] {
	width: 600;
	height: 200;
}

.category {
	width: 70;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="div_main">
		<div class="div_left">
			<div class="pro_content">​ ${project.pro_content }</div>
			<div class="detail_img">
				<img src="/photo/${project.pro_img_name}" class="detail_img">
			</div>
		</div>
		<div class="div_right">
			<div>
				<div class="top">
					<div class="category" style="width: 210;">카테고리 >
						${project.category}</div>
					<div class="userID">${project.userId}</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="top_middle">
					<div class="middle_top">
						<div class="project_title">${project.pro_title}</div>
					</div>
					<div class="date" id="end_date">마감기한 :
						${project.pro_deadline}</div>
					<div class="date">공연 시작일 : ${project.pro_startdate}</div>
					<div class="date">문의 : ${project.pro_phone}</div>
					<div class="money">
						<div class="now_money">${project.now_price}</div>
						<div class="target_money" style="font-size: 12;">/
							${project.target_price}</div>
					</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="bottom_top">
					<div class="reword_name">${project.rew_name}</div>
					<div class="ori_price" style="text-decoration: line-through">${project.ori_price}</div>
					<div class="buy_reword">
						<div class="reword_price">>> ${project.rew_price}</div>
					</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="bottom">
					<div>
						<input type="button" value="승인" class="funding_button"
							id="fund_apply" onclick="agree()">
					</div>
					<div>
						<input type="button" value="거절" class="funding_button"
							id="fund_update"
							onclick="delFrom()">
					</div>
					<div class="project_delete">
							<form action="refuse.do" method="post">
								<table align="center" class="proDel">
									<tr>
										<th scope="col">거절사유 
										<input type="text" name="pro_idx" value="${project.pro_idx}" hidden>
										</td>
									</tr>
									<tr>
										<td>사유<br> <input type="text" name="refuseContent" onkeyup="lengthCheck(this)" maxlength="200"></td>
									</tr>
									<tr>
										<td class="button"><input type="button" value="확인"
											onclick="proRefuse()">
											<input type="button" onclick="delCancle()" value="취소"></td>
									</tr>
								</table>
							</form>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function agree(){
		location.href='./agree.do?pro_idx=' + ${project.pro_idx};
	}
	
	function delCancle() {
		$('.proDel').css('display','none');
	}
	function delFrom() {
		$('.proDel').css('display','block');
		$('.proDel').css('position','relative');
	}
	function proRefuse(){
		alert('거절되었습니다');
		$('.proDel').css('display','none');
		$('form').submit();
	}
	
	function lengthCheck(text){
		var content = $(text).val();
		if (content.length >= 200) {
			alert('입력 가능 글자수를 초과하였습니다.');
			$(text).focus();
		}	
	}
	
	
</script>
</html>