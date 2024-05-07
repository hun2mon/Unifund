<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title> ::ID 찾기 페이지</title>
<link rel="stylesheet" href="/resources/css/common.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
*, *:before, *:after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Open Sans', Helvetica, Arial, sans-serif;
	background: #ededed;
}

input, button {
	border: none;
	outline: none;
	background: none;
	font-family: 'Open Sans', Helvetica, Arial, sans-serif;
}

h3 {
 
 margin-left: 5px;
 
  
}

h4 {

  margin-left:5px;
}
/* Remaining styles from your CSS file */
input[type="text"], input[type="button"] {
	border: 1px solid #ccc; /* 윤곽선을 회색으로 지정 */
	border-radius: 5px; /* 윤곽선의 모서리를 둥글게 만듦 */
	padding: 10px; /* 입력창 내부 여백 설정 */
	width: 100%; /* 입력창을 가득 채우도록 설정 */
	box-sizing: border-box; /* 입력창의 너비에 padding과 border를 포함하도록 설정 */
}

input[value="인증번호 받기"], input[value="인증"] {
	margin-left: 5px; /* 왼쪽 여백을 10px로 설정 */
}

input[value="다음"] {
	margin-left: 0px ; /* 왼쪽 여백을 10px로 설정 */
}

input[type="text"] {
	margin-left: -73px;
	width: 300px; /* 원하는 너비로 조절합니다. */
}

input[type="button"] {
	width: 120px; /* 원하는 너비로 조절합니다. */
}


/* 버튼 스타일 */
input[type="button"][value="인증번호 받기"] {
	background: rgb(0, 196, 196); /* 배경색 */
	color: white; /* 글자색 */
	border: none;
	padding: 10px 15px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과를 위한 전환 */
}




/* 인증 버튼 스타일 */
input[type="button"][value="인증"] {
	background-color: #ff9900; /* 배경색 */
	color: white; /* 글자색 */
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과를 위한 전환 */
}

/* 인증 버튼 호버 효과 */
input[type="button"][value="인증"]:hover {
	background-color: #e68a00; /* 호버 시 배경색 변경 */
}

/* 회원가입 버튼 스타일 */
input[type="button"][value="취소"] {
	background-color: #007bff; /* 배경색 */
	color: white; /* 글자색 */
	border: none;
	padding: 10px 20px;
	margin-left: 284px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과를 위한 전환 */
}


input[type="button"][value="다음"] {
	background-color: #007bff; /* 배경색 */
	color: white; /* 글자색 */
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과를 위한 전환 */
}

/* 취소 버튼 호버 효과 */
input[type="button"][value="취소"]:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
}

/* 다음 버튼 호버 효과 */
input[type="button"][value="다음"]:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
}



input[type="text"][name="mem_name"] {
	margin-left:-220px;
}

input[type="text"][name="mem_number"] {
	margin-left:-220px;
}


input[type="text"][name="mem_auth"] {
	margin-left:-220px;
}






	input [type="submit"]  {
	outline: none;
	border : none;
	color: #007bff;/* 버튼 글자색 변경 */
	padding: 10px 80px; /* 버튼 내부 여백 조정 */
	font-size: 16px; /* 버튼 폰트 사이즈 조정 */
	cursor: pointer;
	border-radius: 5px; /* 버튼 모서리 둥글게 만듦 */
	transition: background-color 0.3s; /* 배경색 변경 시 부드러운 전환 효과 */
	margin-top: 10px; /* 버튼 위쪽 여백 추가 */
}

.buttons-group {
	float: right; /* 버튼 그룹을 오른쪽으로 정렬합니다. */
}


td {
	text-align: left; /* 기존에 있던 정렬 해제 */
	display: flex; /* 내부 요소를 가로로 정렬하기 위해 Flexbox 사용 */
	align-items: center; /* 내부 요소를 수직 가운데 정렬 */
}

form {
	margin-left: 420px;
	margin-top: 200px;
	margin-bottom: 50px;
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

.submit {
    color: #007bff; /* 버튼 텍스트 색상을 파란색(#007bff)으로 설정 */
    font-weight: bold; /* 텍스트 굵기를 더 굵게 설정 */
     border: 1px solid transparent; /* 버튼 테두리를 1픽셀의 투명한 선으로 설정 */
}

.submit:hover {
    background-color: #7fa6e0; /* 호버 시 배경색 변경 */
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
	}
	

/*여기서부터 ------------------------------------------------------------------------css*/
</style>
</head>
<body>
	<h2>▶UNIFUND ID찾기 페이지</h2>
	<hr />
	<form action="findId.go" method="post">

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
				<td><input type="text" id="mem_name" name="mem_name"
					placeholder="내용을 입력해주세요"></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><input type="text" id="mem_number" name="mem_number"
					placeholder="전화번호를 입력하세요" class="custom-input"> <input
					type="button" value="인증번호 받기" onclick="showFirstAlert()"></td>
			</tr>
			<tr>
				<th>인증번호</th>
				<td><input type="text" name="mem_auth"
					placeholder="인증번호 숫자 입력 " readonly="readonly"  class="auth"> <input type="button" value="인증"
					onclick="showSecondAlert()"></td>
			</tr>
			<tr>
				<td colspan="2"><br></td>
			</tr>
			<tr>
				<td colspan="2">
					<h3><input type="button" value="취소" onclick="cancelVerification()"> </h3>
					<h4><input type="button" id="nextButton" class="agreement" value="다음" onclick="validateInputs()"></h4>
				</td>
			</tr>
		</table>
	</form>

	<div class="modal">
		<div class="modal-content">
			<span class="close-button" onclick="closeModal()"><h2>X</h2></span>
			<h3 class="title">아이디 찾기창</h3>
			<div class="box">


				<!--  아이디가 존재할 때에만 표시 -->
				<p class="found-id-message">고객님의 정보와 일치하는 아이디 입니다.</p>

				<p class="pikachyu">userid1111</p>

			</div>
			<input type="button" id="submit" class="submit" value="로그인하러가기">

		</div>
	</div>
	<br>
	<br> ${msg}


</body>
<script>
	var check = 0;

	function validateName() {
		var name = document.getElementById('mem_name').value;
		var regex = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]+$/; // 한글, 영문 대소문자만 허용

		if (name === "") {
			alert("이름을 입력하세요.");
			return false;
		} else if (!regex.test(name)) {
			alert("이름은 한글 또는 영문 대소문자만 입력 가능합니다.");
			return false;

		}

		return true;
	}

	function validatePhoneNumber() {
		var phoneNumber = document.getElementById('mem_number').value;
		var regex = /^[0-9-]+$/; // 숫자와 하이픈만 허용

		if (phoneNumber === "") {
			alert("휴대전화 번호를 입력하세요.");
			return false;
		} else if (!regex.test(phoneNumber)) {
			alert("휴대전화 번호는 숫자와 하이픈(-)만 입력 가능합니다.");
			return false;
		}

		return true;
	}

	function validateInputs() {
		if (!validateName() || !validatePhoneNumber()) {
			// 유효성 검사 실패
			return;
		}

		var inputAuthNumber = document.getElementsByName("mem_auth")[0].value;

		if (inputAuthNumber == "") {
			// 인증번호가 올바르지 않은 경우
			alert("인증번호를 입력해주세요.");
			return;
		}
		if (inputAuthNumber !== "0000") {
			// 인증번호가 올바르지 않은 경우
			alert("인증번호를 다시확인해주세요.");
			return;
		}
		if (check != 1) {
			alert('인증 버튼을 먼저 클릭해 주세요.');
			 check = 1;
		} else {
			openModalIfAuthCorrect();			
		}
	}

	function showFirstAlert() {
		console.log("인증번호 받기 버튼이 클릭되었습니다.");
		
		$.ajax({
			type:'POST', 
			url:'idCheck.ajax',
			data:{
				mem_name : $('#mem_name').val(),
				mem_number : $('#mem_number').val()
			},
			dataType:'json',
			success:function(data){
				if (data.check > 0) {
					alert("인증번호가 발송되었습니다!");		
					$('.auth').attr('readonly',false);
					$('#mem_number').attr('readonly',true);
					 // 인증번호 발송 성공 시 check 값을 1로 변경
	                //check = 1;
				} else {
					alert("입력하신 정보가 올바르지 않습니다!");
					$('.auth').attr('readonly',true);
					$('.auth').val('');
				}
			}, 
			error:function(error){ 
			} 
		});
		

	}
	
	
	function showSecondAlert() {
		var inputAuthNumber = document.getElementsByName("mem_auth")[0].value;
		if (inputAuthNumber === "0000") {
			alert("인증이 완료되었습니다.");
		} else if (inputAuthNumber === "") {
			alert("인증번호를 입력해주세요.");
		} else {
			alert("인증번호가 일치하지 않습니다.");
		}
	}

	function cancelVerification() {
		window.location.href = "login.go"; // 로그인 페이지로 이동
	}

	function openModalIfAuthCorrect() {
		var inputAuthNumber = document.getElementsByName("mem_auth")[0].value;
		if (inputAuthNumber === "0000") {
			openModal();
			var mem_name = $('#mem_name').val();
			console.log(mem_name);
			var phoneNumber = $('#mem_number').val();
			console.log(phoneNumber);

			// AJAX 요청 보내기
			$.ajax({
				url : 'findId.ajax', // 실제 요청을 처리할 서버의 URL
				type : 'POST', // 요청 방식 (POST)
				data : {
					mem_name : $('#mem_name').val(),
					mem_number : $('#mem_number').val()
				},
				success : function(response) {
					// 서버로부터의 응답을 처리
					console.log("서버 응답:", response.use); // 응답 값 콘솔에 출력
					if (response.use !== "" && response.use !== null) {
						// 아이디를 찾은 경우 모달에 표시
						showModal(response.use);
						$('.found-id-message').show();
					} else {
						// 아이디를 찾지 못한 경우 메시지 표시
						showModal("고객님의 가입한 ID가 없습니다.");
						$('.found-id-message').hide();
					}
				},
				error : function() {
					// 요청이 실패한 경우 에러 처리
					alert("서버와의 통신에 문제가 발생했습니다.");
				}
			});
		} else {
			alert("인증번호를 입력해주세요.");

		}
	}

	function showModal(id) {
		var modalContent = document.querySelector(".modal-content");
		var pikachyu = modalContent.querySelector(".pikachyu");
		pikachyu.textContent = id;

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
	$('#submit').on('click', function() {
		window.location.href = "login.do";
	});
	$('#submit').on('click', function() {
		console.log("sdadsadasd");
		onClick();

	});
</script>
</html>