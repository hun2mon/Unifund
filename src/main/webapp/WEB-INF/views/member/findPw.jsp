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
	/* 새로운 스타일 추가 */ input [type="password"] { width : 80%;
	/* 입력칸의 너비를 100%로 설정하여 부모 요소에 맞게 늘립니다. */
	padding: 10px; /* 입력칸의 내부 여백을 추가하여 가로세로 길이를 늘립니다. */
	box-sizing: border-box; /* 내부 여백을 포함하여 요소의 크기를 계산하도록 설정합니다. */
	margin-bottom: 10px; /* 아래쪽 여백을 추가하여 입력칸 사이의 간격을 조절합니다. */
	border-color: #000;
	border-radius: 10px;
}
}
</style>
</head>
<body>
	<h2>▶UNIFUND PW변경 페이지</h2>
	<hr />
	<form action="findPw.go" method="post"></form>

	<table>
		<tr>
			<th colspan="2">회원정보에 등록한 휴대전화로 인증</th>
		</tr>
		<tr>
			<td colspan="2"><br></td>
			<!-- 빈 줄 -->
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="mem_id"  id = "mem_id"  placeholder="내용을 입력해주세요"></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td><input type="text" id="mem_number" name="mem_number"
				placeholder="전화번호를 입력하세요"><br></td>
			<td><input type="button" value="인증번호 받기"
				onclick="showFirstAlert()"></td>
		</tr>
		<tr>
			<th>인증번호</th>
			<td><input type="text" name="mem_auth" placeholder="인증번호 숫자 입력 "><br></td>
			<td><input type="button" value="인증" onclick="showSecondAlert()"></td>
		</tr>
		<tr>
			<td colspan="2"><br></td>
		</tr>

		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="button" value="취소" onclick="cancelVerification()"> 
				
				<input	type="button" id="nextButton" class="agreement" value="다음" onclick="openModal()">
				</td>
		</tr>


	</table>

	<div class="modal">
		<div class="modal-content">
			<span class="close-button" onclick="closeModal()"><h2>X</h2></span>
			<h3 class="title">아이디 찾기창</h3>
			<div class="box">
				<p>아이디 user1111</p>
				<br>
				<p>새로운 비밀번호</p>
				<input type="password" name="new_password"
					placeholder="새로운 비밀번호를 입력하세요" id="mem_pw"> <br>
				<p>비밀번호 확인</p>
				<input type="password" name="confirm_password"
					placeholder="비밀번호를 한번 더 입력하세요" id="mem_pw1">
			</div>
			<input type="button" id="submit" class="submit" value="확인" onclick="openModalIfAuthCorrect()">

		</div>
	</div>
	<br>
	<br> ${msg}


</body>
<script>
	function showFirstAlert() {
		console.log("인증번호 받기 버튼이 클릭되었습니다.");
		alert("인증번호가 발송되었습니다!");
	}

	function showSecondAlert() {
		var inputAuthNumber = document.getElementsByName("mem_auth")[0].value;
		if (inputAuthNumber === "0000") {
			alert("인증이 완료되었습니다.");
			
		} else {
			alert("인증번호가 일치하지 않습니다.");
		}
	}

	    function cancelVerification() {
	 window.location.href = "login.go"; // 로그인 페이지로 이동
	 }
	 

	var modal = document.querySelector(".modal");
	var agreement = document.querySelector(".agreement");
	var close = document.querySelector(".close-button");
	var submit = document.querySelector(".submit");

	function onClick(event) {
		if (event.target == modal) {
			console.log("da");
			openModal();
		}
	}
	
	function openModalIfAuthCorrect() {
		var inputAuthNumber = $('input[name="mem_auth"]').eq(0).val();
		var inputAuthNumber = '0000';
		if (inputAuthNumber === "0000") {
			
			var mem_id = $('#mem_id').val();
			console.log(mem_id);
			var mem_number = $('#mem_number').val();
			console.log(mem_number);
			
			// AJAX 요청 보내기
			$.ajax({
				url : 'findPw.ajax', // 실제 요청을 처리할 서버의 URL
				type : 'POST', // 요청 방식 (POST)
				data : {
					mem_pw : $('#mem_pw').val(),
					mem_id : mem_id,
					mem_number : mem_number
				},
				success : function(response) {
					// 서버로부터의 응답을 처리
					console.log("서버 응답:", response.use); // 응답 값 콘솔에 출력
					if (response.use !== 0) {
						// 비밀번호를 변경을 성공한 경우 메세지 표시 
						alert("비밀번호가 변경되었습니다.");
					} else {
						// 비밀번호 변경을 못한 경우 메시지 표시
						alert("가입한 ID가 없습니다.");
					}
				},
				error : function() {
					// 요청이 실패한 경우 에러 처리
					alert("서버와의 통신에 문제가 발생했습니다.");
				}
			});
		} else {
			alert("인증번호가 틀립니다.");
		}
	}

	function openModal() {
		modal.classList.toggle("show-modal");

	}

	close.addEventListener("click", openModal);
	submit.addEventListener("click", openModal);
	window.addEventListener("click", onClick);

	// 모달창 "확인" 버튼 클릭 시 login.do로 페이지 이동
	/*$('#submit').on('click' , function(){
	    window.location.href = "login.go";
	 });
	 $('#submit').on('click',function(){
	    console.log("sdadsadasd");
	    onClick();
	    
	 });*/
</script>
</html>