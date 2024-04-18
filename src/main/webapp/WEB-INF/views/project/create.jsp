<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>:: 프로젝트 등록 ::</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
table {
	border: 1px solid black;
	text-align: left;
	width: 600px;
	padding: 50px;
}

th, td {
	padding: 10px;
}

.file_input {
	display: inline-block;
	height: 30px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid black;
	width: 50%;
	color: #999999;
}

.pro_photo, .pro_main_photo {
	display: inline-block;
	padding: 5px 10px 5px 10px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 20px;
}

input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	border: 0;
}

.table_margin {
	margin-left: 50px;
}

textarea {
	resize: none;
}

#submit, #cancel {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#submit:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

.modal {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 500px;
	height: 350px;
	border-radius: 0.5rem;
}

.close-button {
	float: right;
	width: 35px;
	line-height: 0.5rem;
	height:35px;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
}

.close-button:hover {
	background-color: darkgray;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}

</style>
</head>
<body>
<form action="create" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>프로젝트 제목(최대 20자)</th>
			<th>대표사진</th>
		</tr>
		
		<tr>
			<td><input type="text" name="pro_title" class="pro_title" placeholder="제목을 입력해주세요. (최대 20자)"/></td>
			<td>
			<input class="file_input file1" placeholder="대표사진을 추가해주세요." readonly="readonly"><label for="pro_main_photo" class="pro_main_photo">파일찾기</label> 
    		<input type="file" id="pro_main_photo" name="pro_main_photo">
			</td>
		</tr>
		<tr>
			<th colspan="2">프로젝트 내용(최대 1500자)</th>
		</tr>
		<tr>
			<td colspan="2"><textarea name="pro_content" class="pro_content" rows="30" cols="50" placeholder="프로젝트 내용을 입력해 주세요."></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
			<input class="file_input file2" placeholder="프로젝트 사진 추가해주세요." readonly="readonly"/><label for="pro_photo" class="pro_photo">파일찾기</label> 
    		<input type="file" id="pro_photo" name="pro_photo">
			</td>
		</tr>
		<tr>
			<th>펀딩 카테고리</th>
			<th>연락처 또는 소통링크(ex.카카오톡, 오픈채팅)</th>
		</tr>
		<tr>
			<td>
			<select id="cate_idx" name="cate_idx">
				<option value="1">전시회</option>
				<option value="2">공연</option>
				<option value="3">축제</option>
				<option value="4">창작물</option>
				<option value="5">기타</option>
			</select>
			</td>
			<td><input type="text" name="pro_phone" class="pro_phone" placeholder="연락처 또는 링크를 입력해주세요."/></td>
		</tr>
		<tr>
			<th>리워드 이름</th>
			<th>리워드 수량</th>
		</tr>
		<tr>
			<td><input type="text" name="rew_name" class="rew_name" placeholder="리워드이름을 입력해주세요."/></td>
			<td><input type="text" name="rew_max" class="rew_max" placeholder="판매수량을 입력해주세요."/></td>
		</tr>
		<tr>
			<th>정가</th>
			<th>리워드 가격(할인된 가격)</th>
		</tr>
		<tr>
			<td><input type="text" name="ori_price" class="ori_price" placeholder="정가를 입력해주세요."/></td>
			<td><input type="text" name="rew_price" class="rew_price" placeholder="대표사진을 추가해주세요."/></td>
		</tr>
		<tr>
			<th>마감기한</th>
			<th>전시/공연/출품 날짜</th>
		</tr>
		<tr>
			<td><input type="date" name="pro_deadline" class="pro_deadline"/></td>
			<td><input type="date" name="pro_startdate" class="pro_startdate"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="checkbox" name="pro_tos" class="pro_tos" disabled><a class="agreement">(필수)개인정보 처리 관련 이용약관 동의</a></td>
			<input name="pro_tos" type="hidden" value="Y"/>
		</tr>
		<tr>
			<td><input type="button" onclick="location.href='./'" value="취소"><input type="button" onclick="create()" value="등록"></td>
		</tr>
	</table>
</form>

<div class="modal"> 
	<div class="modal-content"> 
	<span class="close-button"><h2>X</h2></span> 
		<h1 class="title">개인정보처리 동의</h1> 
		<p>귀하의 개인정보를 수집 및 처리하기 위해 동의가 필요합니다.</p>
		<input type="button" id="cancel" value="취소"> 
		<input type="button" id="submit" value="동의"> 
	</div> 
</div>

</body>
<script>

function create(){
	var $pro_title = $('.pro_title');
	var $pro_main_photo = $('#pro_main_photo');
	var $pro_content = $('.pro_content');
	var $pro_photo = $('#pro_photo');
	var $pro_phone = $('.pro_phone');
	var $rew_name = $('.rew_name');
	var $rew_max = $('.rew_max');
	var $ori_price = $('.ori_price');
	var $rew_price = $('.rew_price');
	var $pro_deadline = $('.pro_deadline');
	var $pro_startdate = $('.pro_startdate');
	var $pro_tos = $('input[name="pro_tos"]:checked');
	var regExp = new RegExp('[a-zA-Zㄱ-ㅎ가-힣]');
	var rew_max_match = regExp.test($rew_max.val());
	var ori_price_match = regExp.test($ori_price.val()); 
	var rew_price_match = regExp.test($rew_price.val());
	
	if($pro_title.val() == ''){
		alert('프로젝트 제목을 입력해주세요.');
     	$pro_title.focus();
	}else if($pro_title.val().length > 20){
		alert('프로젝트 제목은 20자 이하로 입력해주세요.');
		$pro_title.focus();
	}else if($pro_main_photo.get(0).files.length < 1){
		alert('프로젝트 대표사진을 추가해주세요.');
	}else if($pro_main_photo.get(0).files.length > 1){
		alert('프로젝트 대표사진은 1장만 추가해주세요.');
	}else if($pro_content.val() == ''){
		alert('프로젝트 내용을 입력해주세요.');
     	$pro_content.focus();
	}else if($pro_content.val().length > 1500){
		alert('프로젝트 내용은 1500자까지 허용됩니다.');
     	$pro_content.focus();
	}else if($pro_photo.get(0).files.length < 1){
		alert('프로젝트 사진을 추가해주세요.');
	}else if($pro_photo.get(0).files.length > 1){
		alert('프로젝트 제출사진은 1장만 추가해주세요.');
		$pro_photo.focus();
	}else if($rew_name.val() == ''){
		alert('리워드의 이름을 입력 해주세요.');
     	$rew_name.focus();
	}else if($rew_max.val() == ''){
		alert('리워드 수량을 입력 해주세요.');
     	$rew_max.focus();
	}else if($ori_price.val() == ''){
		alert('정가를 입력 해주세요.');
     	$ori_price.focus();
	}else if($rew_price.val() == ''){
		alert('리워드 가격을 입력 해주세요.');
     	$rew_price.focus();
	}else if($pro_deadline.val() == ''){
		alert('마감기한을 선택해주세요.');
     	$pro_deadline.focus();
	}else if($pro_startdate.val() == ''){
		alert('전시/공연/출품 날짜를 선택해주세요.');
     	$pro_startdate.focus();
	}else if($pro_tos.val() == null){
		alert('개인정보 처리방침 및 프로젝트 약관에 동의해주세요.');
	}else if(rew_max_match){
		alert('숫자만 입력해주세요.');
		$rew_max.val('');
		$rew_max.focus();
	}else if(ori_price_match) {
		alert('숫자만 입력해주세요.');
		$ori_price.val('');
		$ori_price.focus();
	}else if(rew_price_match) {
		alert('숫자만 입력해주세요.');
		$rew_price.val('');
		$rew_price.focus();
	}else if($pro_deadline.val() > $pro_startdate.val()){
		alert('마감기한은 전시/공연/출품날짜보다 빨라야합니다. 확인후 다시 설정해주세요.');
		$pro_deadline.focus();
	}else{
		$('form').submit();
	}
}

$('input[id="pro_main_photo"]').on('change',function(){
	var fileName = $('input[id="pro_main_photo"]').val();
	$('.file1').val(fileName);
});

$('input[id="pro_photo"]').on('change',function(){
	var fileName = $('input[id="pro_photo"]').val();
	$('.file2').val(fileName);
});
	
var modal = document.querySelector(".modal"); 
var agreement = document.querySelector(".agreement"); 
var close = document.querySelector(".close-button"); 
var cancel = document.querySelector("#cancel");

function openModal() { 
    modal.classList.toggle("show-modal"); 
}

function onClick(event) { 
    if (event.target == modal) { 
    	openModal(); 
    } 
}

agreement.addEventListener("click", openModal); 
close.addEventListener("click", openModal); 
cancel.addEventListener("click", openModal); 
window.addEventListener("click", onClick); 

$('#submit').on('click',function(){
	$('input[name="pro_tos"]').attr('checked',true);
	openModal();
});

$('#cancel').on('click',function(){
	$('input[name="pro_tos"]').attr('checked',false);
	onClick();
});

</script>
</html>