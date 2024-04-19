<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
	height: 900px;
	background-color: FFFFCC;
	margin-top: 10;
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

.pro_button, .buy_but, .delete {
	width: 73;
	font-size: 9;
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
.more{
	width: 100;
	margin-left:450;
	border:0px;
	border-radius: 5px 5px;
	background-color: FFFFCC;
}
.selectNum{
	margin-left:10;
	margin-top: 20; 
	width: 100;
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
					<div class="project_report" style="width: 100;">
						<input type="button" class="pro_button" value="프로젝트 신고"
							onclick="location.href='pro_report.go?pro_idx=${project.pro_idx }'">
					</div>
					<div class="userID">${project.userId}</div>
					<div class="lisk_cnt" style="width: 30px;">
						${project.like_cnt}</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="top_middle">
					<div class="middle_top">
						<div class="project_title">${project.pro_title}</div>
						<div class="project_delete">
							<input type="button" class="pro_button" value="프로젝트 삭제"
								onclick="location.href='pro_delete.do?pro_idx=${project.pro_idx }'">
						</div>
						<div class="buy_list">
							<button class="buy_but">구매자 리스트</button>
						</div>
						<div class="project_bookmark">⭐</div>
						<div class="project_good">❤</div>
					</div>
					<div class="middle_middle">
						<div class="project_progress">
							<c:if test="${project.now_price == ''}">0%진행중</c:if>
							<c:if test="${project.now_price != ''}">${project.progress}%진행중</c:if>
							<c:if test="${loginId == 'sdsd'}">

							</c:if>
						</div>
					</div>
					<div class="progress_bar">
						<progress value="${project.progress}" max="100"></progress>
					</div>
					<div class="date" id="end_date">마감기한 :
						${project.pro_deadline}</div>
					<div class="date">공연 시작일 : ${project.pro_startdate}</div>
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
					<div class="ori_price" style="text-decoration:line-through">${project.ori_price}</div>
					<div class="buy_reword">
						<div class="reword_price">>> ${project.rew_price}</div>
						<div class="quantity">
							<input type="number" value="1" class="quan"
								onclick="click_price()" onkeyup="click_price()" min="1">
						</div>
					</div>
				</div>
				<div>
					<hr>
				</div>
				<div class="bottom">
					<div class="total_price">
						<div>총 리워드 금액</div>
						<div class="final_price">${project.rew_price}</div>
					</div>
					<div>
						마일리지 사용 <input type="checkbox" class="mileageCheck"
							onclick="readMng()">
					</div>
					<div class="mileage_form">
						<div class="mileage">
							<div>보유</div>
							<div class="mileage_value">${project.mileage}마일리지</div>
						</div>
						<div class="mileage">
							<div>사용</div>
							<div class="use_mileage">
								<input type="number" name="mileage" class="use_mileage_value"
									value="0" min="0" readonly="readonly">
							</div>
						</div>
					</div>
					<div>우편번호</div>
					<div>
						<input type="text" class="path" value=" ${project.mem_post}">
					</div>
					<div>주소</div>
					<div>
						<input type="text" class="path" value="${project.mem_addr}">
					</div>
					<div>상세주소</div>
					<div>
						<input type="text" class="path" value="${project.mem_detail}">
					</div>
					<div>
						<input type="button" value="펀딩 신청하기" class="funding_button"
							id="fund_apply" onclick="apply()">
					</div>
					<div>
						<input type="button" value="펀딩 수정하기" class="funding_button"
							id="fund_update"
							onclick="location.href='pro_update.go?pro_idx=${project.pro_idx }'">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="div_review">
		<div class="div_review_top">
			<form action="review/write.do" method="post"
				enctype="multipart/form-data">
				<div class="div_flex">
					<div>
						<img src="/photo/${project.profile}" class="profile_img">
					</div>
					<div>
						<select name="revNum" class="selectNum">
							<option value="5">5점</option>
							<option value="4">4점</option>
							<option value="3">3점</option>
							<option value="2">2점</option>
							<option value="1">1점</option>
						</select>
					</div>
				</div>
				<div>
					<div>
						<input type="hidden" class="reviewFrom" name="pro_idx"
							value="${project.pro_idx }"> <input type="text"
							class="reviewFrom" name="revContent">
					</div>
					<div>
						<input type="file" class="file_select" name="photo"> <input
							type="button" class="sub_review" value="등록하기" onclick="revWrite()">
					</div>
				</div>
			</form>
			<hr>
			<div id="list"></div>
		</div>
		<div>
			<button onclick="moreRev()" class="more">더보기</button>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
		listCall();
	});
	
	function revWrite(){
		
		var $revContent = $('input[name="revContent"]');
		var $revPhoto = $('input[name="photo"]');
		
		if ($revContent.val()=='') {
			alert('리뷰 내용을 입력 해주세요');
			$revContent.focus();
		} else if ($revPhoto.val() == '') {
			alert('사진을 첨부 해주세요');
			$revPhoto.focus();
		} else {
			$('form').submit();
		}
		
	}

	var limit = 5;
	
	function moreRev(){
		limit += 5;
		$.ajax({
			type:'get'
			,url:'./review/list.ajax'
			,data:{
				pro_idx:${project.pro_idx},
				limit:limit
			}
			,dataType:'json'
			,success:function(data){
				drawList(data.list);
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
		
	function listCall(){
		$.ajax({
			type:'get'
			,url:'./review/list.ajax'
			,data:{
				pro_idx:${project.pro_idx},
				limit:limit
			}
			,dataType:'json'
			,success:function(data){
				drawList(data.list);
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	var rev_idx = 0;
	
	function drawList(list){
		var content = '';
		for (item of list) {
			content += '<div id = "rev_css">';
			content += '<span><img src="/photo/' +item.profile + '" class="profile_img"></span>';
			content += '<span class="spanMargin">평점 ' + item.rev_grade + '/5점</span>';
			content += '<span class="spanMargin">작성자 : ' + item.mem_id + '</span>';
			content += '<span class="spanMargin">' + item.rev_date + '</span>';
			content += '<span><img src="/photo/' +item.pho_name+ '"class = "rev_img" onclick="clickImg(this)"></span>';
			content += '<div class="review_content">' + item.rev_content + '</div>';
			content += '<div>';
			if (item.mem_id == '${loginId}') {
				content += '<a href="review/delete.do?rev_idx=' +item.rev_idx + '">리뷰 삭제</a>';	
				$('input[name="revContent"]').val('이미 작성한 리뷰가 있습니다.');
				$('input[name="revContent"]').attr('readonly',true);
				$('.sub_review').attr('type','hidden');
			}
			content += '</div>';
			content += '<hr>';
		}
		$('#list').html(content);
	};
	
	if ('${project.fund_state}' == 'A') {
		$('#fund_apply').val('펀딩 취소하기');
	}
	
	function click_price(){
		var quantitys = $('.quan').val();
		var price = ${project.rew_price} * quantitys;
		$('.final_price').html(price);
	}
	
	var cnt = 0;
	function clickImg(img){
		cnt += 1;
		if (cnt%2 != 0) {
			$(img).css("width","500");
			$(img).css("height","auto");
		}else {
			$(img).css("width","100");
			$(img).css("height","auto");
		}
	}
	
	function apply() {
		if ($('.funding_button').val() == '펀딩 신청하기') {
			var quantitys = $('.quan').val();
			var cash = '${project.cash}' + $('.use_mileage_value').val();
			var price = ${project.rew_price} *quantitys;
			if (price > ${project.target_price}-${project.now_price}) {
				alert('최대 구매 가능 개수를 초과했습니다.');
				$('.quan').val(0);
				$('.quan').focus();
			} else if ($('.mileageCheck').prop('checked') == true) {
				if ($('.use_mileage_value').val() < 500) {
					alert('마일리지는 500이상부터 사용 가능합니다.');
					$('.use_mileage_value').focus();
				} else if ($('.use_mileage_value').val() > ${project.mileage}){
					alert('보유한 마일리지보다 많습니다. 다시 입력해 주세요');
					$('.use_mileage_value').val(0);
					$('.use_mileage_value').focus();
				} else if(price < $('.use_mileage_value').val()){
					alert('마일리지 사용금액이 초과되었습니다. 다시 입력해 주세요');
					$('.use_mileage_value').val(0);
					$('.use_mileage_value').focus();
				} else{
					$.ajax({
						type:'post'
						,url:'./fund.do'
						,data:{
							pro_idx:'${project.pro_idx}',
							mem_idx:'1',
							rew_quantity:quantitys,
							mileage:$('.use_mileage_value').val(),
							total_price:price
						}
						,dataType:'json'
						,success:function(data){
							alert('펀딩이 정상적으로 완료되었습니다.');
							createForm();
						}
						,error:function(error){
							console.log(error);
						}
					});
				}
			} else if (cash < price) {
				alert('캐시+마일리지가 구매가격보다 낮습니다.');
			} else {
				$.ajax({
					type:'post'
					,url:'./fund.do'
					,data:{
						pro_idx:'${project.pro_idx}',
						mem_idx:'1',
						rew_quantity:quantitys,
						mileage:$('.use_mileage_value').val(),
						total_price:price
					}
					,dataType:'json'
					,success:function(data){
						alert('펀딩이 정상적으로 완료되었습니다.');
						createForm();
					}
					,error:function(error){
						console.log(error);
					}
				});
			}
		} else {
			$.ajax({
				type:'post'
				,url:'./fund_cancle.do'
				,data:{
					pro_idx:'${project.pro_idx}',
					mem_idx:'1',
					rew_quantity:quantitys,
					mileage:$('.use_mileage_value').val(),
					total_price:price
				}
				,dataType:'json'
				,success:function(data){
					alert('펀딩이 정상적으로 최소되었습니다.');
					createForm();
				}
				,error:function(error){
					console.log(error);
				}
			});
		}
	}
	
	function readMng(){
		if ($('.mileageCheck').prop('checked') == true) {
			$('.use_mileage_value').attr('readonly',false);
		} else {
			$('.use_mileage_value').attr('readonly',true);
			$('.use_mileage_value').val(0);
		}
	}
	
	function createForm() {
		location.href='./';
	}
	
	var msg = '${msg}';
	if (msg != '') {
		alert(msg);
	}

</script>
</html>