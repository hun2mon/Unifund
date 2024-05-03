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

/* Remaining styles from your CSS file */
input[type="text"],input[type="button"] {
	border: 1px solid #ccc; /* 윤곽선을 회색으로 지정 */
	border-radius: 5px; /* 윤곽선의 모서리를 둥글게 만듦 */
	padding: 10px; /* 입력창 내부 여백 설정 */
	width: 100%; /* 입력창을 가득 채우도록 설정 */
	box-sizing: border-box; /* 입력창의 너비에 padding과 border를 포함하도록 설정 */
}

input[type="text"][id="mem_id"] {
    margin-left: 15px;
    width: 300px;
}
input[type="text"][id="mem_number"] {
     margin-left: 15px;
    width: 300px;
}
input[type="text"][name="mem_auth"] {
    margin-left: 15px;
    width: 300px;
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

input[type="button"][value="취소"]{
	margin-left:40px;
	margin-top: 15;
	width:120px;
	background-color: #007bff; /* 배경색 */
	color: white; /* 글자색 */
	padding: 10px 20px;
	transition: background-color 0.3s ease; /* 호버 효과를 위한 전환 */
}

input[type="button"][value="다음"]{
	margin-left:1px;
	width:120px;
	background-color: #007bff; /* 배경색 */
	color: white; /* 글자색 */
	padding: 10px 20px;
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

form {
	margin-left: 650px;
	margin-top: 230px;
	margin-bottom: 50px;
}

.modal {
	margin-top:-75px;
	margin-left:55px;
    text-align: center;
    position: fixed;
    left: 50%; /* 모달의 왼쪽을 화면의 중앙에 위치시킵니다. */
    top: 50%;
    transform: translate(-50%, -50%); /* 모달을 가운데로 정렬합니다. */
    width: 500px; /* 모달의 너비를 조절합니다. */
    height: 450px;
    background-color: rgba(0, 0, 0, 0.5); /* 어두운 배경 효과를 줍니다. */
    opacity: 0;
    visibility: hidden;
    transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; /* 변경된 속성에 대한 전환 효과 추가 */
    z-index: 9999; /* 다른 요소보다 위에 위치하도록 z-index 설정 */
}

.modal-content {
    position: relative;
    background-color: #e6e6e6;
    padding: 1rem 1.5rem;
    width: 100%;
    height: 100%;
    border-radius: 0.5rem;
    z-index: 10000; /* 다른 요소 위에 표시하기 위해 z-index 설정 */
}

.show-modal {
    opacity: 1;
    visibility: visible;
}

.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 어두운 배경 효과를 줍니다. */
    z-index: 9998; /* 모달보다 아래에 위치하도록 z-index 설정 */
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
	position: relative;
	background-color: #e6e6e6;
    padding: 1rem 1.5rem;
    width: 100%;
    height: 100%;
    border-radius: 0.5rem;
    z-index: 10000; /* 다른 요소 위에 표시하기 위해 z-index 설정 */
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
		
	}
	
</style>
</head>
<body>
	<h2>▶UNIFUND PW변경 페이지</h2>
	<hr />
	<form action="findPw.go" method="post">

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
				<td><input type="text" name="mem_id" id="mem_id"
					placeholder="내용을 입력해주세요"></td>
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
				<td><input type="text" name="mem_auth"
					placeholder="인증번호 숫자 입력 " readonly="readonly" class="auth"><br></td>
				<td><input type="button" value="인증" onclick="showSecondAlert()"></td>
			</tr>
			<tr>
				<td colspan="2"><br></td>
			</tr>

			<tr>
				<td colspan="2">
				<input type="button" value="취소" onclick="cancelVerification()">
				 <input type="button" id="nextButton" class="agreement" value="다음" onclick="validateInputs()">
				 </td>
			</tr>
		</table>
	</form>

	<form class="modal" action="./findPw.do" method="post">
		<div class="modal-content">
			<span class="close-button" onclick="closeModal()"><h2>X</h2></span>
			<h3 class="title">비밀번호 변경하기창</h3>
			<div class="box">
				<br> <input type="hidden" name="memId" class="memId">
				<p>새로운 비밀번호</p>
				<input type="password" name="new_password"
					placeholder="새로운 비밀번호를 입력" id="mem_pw"> <br>
				<p>비밀번호 확인</p>
				<input type="password" name="confirm_password"
					placeholder="비밀번호를 한번 더 입력" id="mem_pw1">
			</div>
			<input type="submit" id="submit" class="submit" value="확인 후 로그인화면">
		</div>
	</form>
	<br>
	<br> ${msg}


</body>
<script>
	var check = 0;

	function validateId() {
		var id = document.getElementById('mem_id').value;
		var regex = /^[a-zA-Z0-9]+$/; // 한글, 영문 대소문자만 허용

		if (id === "") {
			alert("아이디를 입력하세요.");
			return false;
		} else if (!regex.test(id)) {
			alert("아이디는 영어와 숫자만 입력 가능합니다.");
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
		if (!validateId() || !validatePhoneNumber()) {
			// 유효성 검사 실패
			return;
		}

		var inputAuthNumber = document.getElementsByName("mem_auth")[0].value;

		if (inputAuthNumber == "") {
			// 인증번호가 올바르지 않은 경우
			alert("인증버튼을 먼저 클릭해주세요.");
			return;
		}

		if (inputAuthNumber !== "0000") {
			// 인증번호가 올바르지 않은 경우
			alert("인증번호를 다시확인해주세요.");
			return;
		}
		if (check != 1) {
			alert('인증 버튼을 먼저 클릭해 주세요.');
		} else {
			openModalIfAuthCorrect();			
		}
	}

	function showFirstAlert() {
		console.log("인증번호 받기 버튼이 클릭되었습니다.");
		
		$.ajax({
			type:'POST', 
			url:'memCheck.ajax',
			data:{
				mem_id : $('#mem_id').val(),
				mem_number : $('#mem_number').val()
			},
			dataType:'json',
			success:function(data){
				if (data.check > 0) {
					alert("인증번호가 발송되었습니다!");		
					$('.auth').attr('readonly',false);
					$('#mem_number').attr('readonly',true);
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
			check = 1;
		} else if (inputAuthNumber === "") {
			alert("인증번호를 입력해주세요");
		} else {
			alert("인증번호가 일치하지 않습니다.");
		}
	}

	
	
	function cancelVerification() {
		window.location.href = "login.go"; // 로그인 페이지로 이동
	}

	/*var modal = document.querySelector(".modal");
	var agreement = document.querySelector(".agreement");
	var close = document.querySelector(".close-button");
	var submit = document.querySelector(".submit");*/

	function onClick(event) {
		if (event.target == modal) {
			console.log("da");
			openModal();
		}
	}

	
	
	
	
	function openModalIfAuthCorrect() {
		var inputAuthNumber = $('input[name="mem_auth"]').eq(0).val();
		//var inputAuthNumber = '0000';
		$('.memId').val($('#mem_id').val());

		if (inputAuthNumber === "0000") {
			openModal();
			var mem_id = $('#mem_id').val();
			console.log(mem_id);
			var mem_number = $('#mem_number').val();
			console.log(mem_number);
			
			// "인증이 완료되었습니다" 문구가 뜨면 다음 버튼을 활성화합니다.
	        $('#nextButton').prop('readonly', false);
	    
		}
	}
	function showModal(id) {
		var modalContent = document.querySelector(".modal-content");

	}

	var modal = document.querySelector(".modal");
	var agreement = document.querySelector(".agreement");
	var submit = document.querySelector(".submit");
	var close = document.querySelector(".close-button");

	function openModal() {
		modal.classList.toggle("show-modal");
	}

	
	
	close.addEventListener("click", openModal);
	submit.addEventListener("click", openModal);
	window.addEventListener("click", onClick);

	
	
	//모달창 "확인" 버튼 클릭 시 login.do로 페이지 이동
	//$('#submit').on('click' , function(){
	// window.location.href = "login.go";
	// });
	/*$('#submit').on('click',function(){
	   console.log("sdadsadasd");
	   onClick();
	   
	});*/
</script>
</html>