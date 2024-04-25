<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>이것이 제목이다</title>
<link rel="stylesheet" href="./resources/css/common.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
#submit, #cancel {
	background-color: #f0f0f0;
	border: none;
	padding: 15px 30px;
	font-size: 16px;
	width: 100px;
	margin-top: 20px;
	width: 210px;
	margin-right: 10px;
	border-radius: 20px;
	box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff;
	transition: all 0.3s ease;
}

#submit:hover, #cancel:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.modal {
	text-align: center;
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
	width: 450px;
	height: 280px;
	overflow: auto;
	border: 1px solid gray;
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
	height: 35px;
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
	<h2>▶UNIFUND PW변경 페이지</h2>
	<hr />
	<form action="findId.go" method="post"></form>

	<table>
		<tr>
			<th colspan="2">회원정보에 등록한 휴대전화로 인증</th>
		</tr>
		<tr>
			<td colspan="2"><br></td>
			<!-- 빈 줄 -->
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="id" placeholder="내용을 입력해주세요"></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td><select name="countryCode">
					<option value="+82">+82 (한국)</option>
					<option value="+81">+81 (일본)</option>
					<option value="+1">+1 (미국)</option>
			</select>
			<td><input type="number" name="mem_phone"
				placeholder="전화번호를 입력하세요"><br></td>
			<td><input type="button" value="인증번호 받기"
				onclick="showFirstAlert()"></td>
		</tr>
		<tr>
			<th>인증번호</th>
			<td><input type="number" name="mem_auth"
				placeholder="인증번호 숫자 입력 "><br></td>
		</tr>
		<tr>
			<td colspan="2"><br></td>
		</tr>

		<tr>
			<td colspan="2" style="text-align: center;"><input type="button"
				value="취소" onclick="cancelVerification()"> <input
				type="button" id="nextButton" class="agreement" value="다음"
				onclick="openModal()"></td>
		</tr>


	</table>

	<div class="modal">
		<div class="modal-content">
			<span class="close-button" onclick="closeModal()"><h2>X</h2></span>
			<h3 class="title">아이디 찾기창</h3>
			<div class="box">
				<p>비밀번호 재설정</p>
				<br>
				<p>아이디 user001</p>
				<br>
				<p>새로운 비밀번호</p>
				<br>
				<p>비밀번호 확인</p>
			</div>
			<input type="button" id="submit" class="submit" value="확인">

		</div>
	</div>
	<br>
	<br> ${msg}


</body>
<script>

   function showFirstAlert() {
      alert("인증번호가 발송되었습니다!");
   }
   
   function cancelVerification() {
        window.location.href = "login.do"; // 로그인 페이지로 이동
    }

   
   var modal = document.querySelector(".modal"); 
   var agreement = document.querySelector(".agreement"); 
   var close = document.querySelector(".close-button"); 
   var submit = document.querySelector(".submit");

<!--
   function onClick(event) { 
       if (event.target == modal) { 
          console.log("da");
          openModal(); 
       } 
   }
-->
   function openModal() { 
      modal.classList.toggle("show-modal"); 
      
   }
   
   close.addEventListener("click", openModal); 
   submit.addEventListener("click", openModal); 
   window.addEventListener("click", onClick); 

   // "로그인하러가기" 버튼 클릭 시 login.do로 페이지 이동
   $('#submit').on('click' , function(){
      window.location.href = "login.do";
   });
   $('#submit').on('click',function(){
      console.log("sdadsadasd");
      onClick();
      
   });

 
</script>
</html>