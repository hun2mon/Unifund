<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>:: 프로젝트 수정 ::</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
 }
 
input[type="text"], textarea, input[type="date"], select, option{
width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  margin-bottom: 10px;
  font-size: 16px;
}

 .container {
    max-width: 900px;
    margin: 50px auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 10px;
    /*box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
 }

 .form-container {
    background: #fefefe;
    box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.1), -10px -10px 20px rgba(255, 255, 255, 0.8);
    border-radius: 20px;
    padding: 40px;
 }
table {
	text-align: left;
	padding: 50px;
}

th, td {
	padding: 10px;
}

.file_input {
	width: 100%;
	position: relative;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  margin-bottom: 10px;
  font-size: 16px;
}

.pro_photo, .pro_main_photo {
	width: 85px;
	position: absolute;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  margin-bottom: 10px;
  font-size: 16px;
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

.btn_td{
	text-align:center;
}

.btn_submit, .btn_cancel{
	margin-top: 30px;
 	background-color: #fdfdfd; 
    border: none; 
    width:200px;
    margin-right:30px;
    padding: 15px 30px; 
    font-size: 16px; 
    border-radius: 20px; 
    box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff; 
    transition: all 0.3s ease; 
}

.btn_submit:hover, .btn_cancel:hover{
 box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff; 
}


#submit, #cancel {
	background-color: #f0f0f0; 
    border: none; 
    padding: 15px 30px; 
    font-size: 16px; 
    width:100px;
    margin-top:20px;
    width:210px;
    margin-right:10px;
    border-radius: 20px; 
    box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff; 
    transition: all 0.3s ease; 
}

#submit:hover, #cancel:hover{
 box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff; 
}

.modal {
	text-align:center;
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

.box {
  width:450px;
  height:280px;
  overflow:auto;  
  border:1px solid gray;
  padding: 0 0.5em;
  background-color: #fcfcfc;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #e6e6e6;
	padding: 1rem 1.5rem;
	width: 500px;
	height: 450px;
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
	 box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
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
<%@ include file = "/WEB-INF/views/common/header.jsp" %>
<div class="container">
<div class="form-container">
<form action="projectUpdate.do" method="post" enctype="multipart/form-data">
<input name="pro_idx" type="hidden" value="${project.pro_idx }"/>
	<table>
		<tr>
			<th>프로젝트 제목(최대 20자)</th>
			<th>대표사진</th>
		</tr>
		
		<tr>
			<td><input type="text" name="pro_title" class="pro_title" value="${project.pro_title }" /></td>
			<td>
			<input class="file_input file1" value="${project.pro_main_name }" readonly="readonly"><label for="pro_main_photo" class="pro_main_photo">파일찾기</label> 
    		<input type="file" id="pro_main_photo" name="pro_main_photo">
			</td>
		</tr>
		<tr>
			<th colspan="2">프로젝트 내용(최대 1500자)</th>
		</tr>
		<tr>
			<td colspan="2"><textarea name="pro_content" class="pro_content" rows="30" cols="50" >${project.pro_content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
			<input class="file_input file2" value="${project.pro_img_name }" readonly="readonly"/><label for="pro_photo" class="pro_photo">파일찾기</label> 
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
				<option value="1" <c:if test="${project.cate_idx == 1 }">selected</c:if>>전시회</option>
				<option value="2" <c:if test="${project.cate_idx == 2 }">selected</c:if>>공연</option>
				<option value="3" <c:if test="${project.cate_idx == 3 }">selected</c:if>>축제</option>
				<option value="4" <c:if test="${project.cate_idx == 4 }">selected</c:if>>창작물</option>
				<option value="5" <c:if test="${project.cate_idx == 5 }">selected</c:if>>기타</option>
			</select>
			</td>
			<td><input type="text" name="pro_phone" class="pro_phone" value="${project.pro_phone }"/></td>
		</tr>
		<tr>
			<th>리워드 이름</th>
			<th>리워드 수량</th>
		</tr>
		<tr>
			<td><input type="text" name="rew_name" class="rew_name" value="${project.rew_name }"/></td>
			<td><input type="text" name="rew_max" class="rew_max" value="${project.rew_max }"/></td>
		</tr>
		<tr>
			<th>정가</th>
			<th>리워드 가격(할인된 가격)</th>
		</tr>
		<tr>
			<td><input type="text" name="ori_price" class="ori_price" value="${project.ori_price }"/></td>
			<td><input type="text" name="rew_price" class="rew_price" value="${project.rew_price }"/></td>
		</tr>
		<tr>
			<th>마감기한</th>
			<th>전시/공연/출품 날짜</th>
		</tr>
		<tr>
			<td><input type="date" name="pro_deadline" class="pro_deadline" value="${proDeadline}"/></td>
			<td><input type="date" name="pro_startdate" class="pro_startdate" value="${proStartDate}"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="checkbox" name="pro_tos" class="pro_tos" checked="true" disabled><a class="agreement">&nbsp(필수)개인정보 처리 관련 이용약관 동의</a></td>
			<input name="pro_tos" type="hidden" value="Y"/>
		</tr>
		<tr>
			<td class="btn_td" colspan="2">
			<input type="button" onclick="location.href='./'" value="취소" class="btn_cancel">
			<button class="btn_submit">수정</button>
			</td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
<script>
$('input[id="pro_main_photo"]').on('change',function(){
	var fileName = $('input[id="pro_main_photo"]').val();
	$('.file1').val(fileName);
});

$('input[id="pro_photo"]').on('change',function(){
	var fileName = $('input[id="pro_photo"]').val();
	$('.file2').val(fileName);
});
</script>
</html>