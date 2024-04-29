<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
<style>*, *:before, *:after {
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

input[type="text"], input[type="password"] {
	border: 1px solid #ccc; /* 윤곽선을 회색으로 지정 */
	border-radius: 5px; /* 윤곽선의 모서리를 둥글게 만듦 */
	padding: 10px; /* 입력창 내부 여백 설정 */
	width: 100%; /* 입력창을 가득 채우도록 설정 */
	box-sizing: border-box; /* 입력창의 너비에 padding과 border를 포함하도록 설정 */
}
/* 여기부터 필요한 CSS 코드 추가 */
/* 본문에 필요한 부분만 추출하여 추가하세요 */

/* 예시 */

/* 펀딩 회사에 맞는 디자인으로 수정한 CSS */
h2 {
    font-size: 50px; /* 큰 폰트 사이즈로 변경 */
    text-align: center; /* 가운데 정렬 */
    margin-top: 100px;
    margin-bottom: 40px; /* 아래 여백 추가 */
     color: rgb(0, 196, 196); /* 폰트 색상 변경 */
    font-family: 'Arial Black', sans-serif; /* 특정 폰트로 변경 */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4); /* 텍스트 그림자 추가 */
}


h3 {
 font-size: 14px;
  text-align: center; /* 이 요소의 가로 공간을 기준으로 텍스트를 가운데 정렬시킴 */
  margin-bottom: -20px;
  margin-top: -20px; 
  
}

h4 {
  font-size: 14px;
  text-align: center; /* 이 요소의 가로 공간을 기준으로 텍스트를 가운데 정렬시킴 */
  margin-bottom: 0px;
  margin-top: 5px; 
  margin-right:-200px;
}

h5{
   font-size: 14px;
   
  text-align: center; /* 이 요소의 가로 공간을 기준으로 텍스트를 가운데 정렬시킴 */
  margin-bottom: 0px;
  margin-top: -30px; 
   margin-right:-200px;
   
}
body {
	font-family: 'Arial', sans-serif; /* 펀딩 회사에 어울리는 폰트로 변경 */
	background: #f0f0f0; /* 배경색 변경 */
}

input[type="submit"], input[type="button"] {
	border: none;
	outline: none;
	background:  rgb(0, 196, 196); /* 버튼 배경색 변경 */
	color: #fff; /* 버튼 글자색 변경 */
	padding: 10px 80px; /* 버튼 내부 여백 조정 */
	font-size: 16px; /* 버튼 폰트 사이즈 조정 */
	cursor: pointer;
	border-radius: 5px; /* 버튼 모서리 둥글게 만듦 */
	transition: background-color 0.3s; /* 배경색 변경 시 부드러운 전환 효과 */
	margin-top: 10px; /* 버튼 위쪽 여백 추가 */
}

input[type="submit"]:hover, input[type="button"]:hover {
	background: #2e8b57; /* 마우스 호버 시 버튼 배경색 변경 */
}

.cont {
	overflow: hidden;
	position: relative;
	width: 900px;
	height: 550px;
	margin: 0 auto 100px;
	background: #fff;
}


.form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, 30%);
    text-align: center; /* 입력창과 버튼을 가운데 정렬 */
}

table {
    margin: 0 auto; /* 테이블 가운데 정렬 */
}

input[type="text"], input[type="password"], input[type="submit"], input[type="button"], input[type="checkbox"], a {
    display: block; /* 요소를 블록 요소로 변경하여 한 줄에 하나씩 표시 */
    margin: 10px auto; /* 모든 요소를 가운데 정렬 */
}

.form-links {
    text-align: center; /* 텍스트를 가운데 정렬 */
    position: absolute; /* 절대 위치 설정 */
    left: 50%; /* 왼쪽에서 중앙으로 */
    transform: translateX(-50%); /* 왼쪽으로 50%만큼 이동하여 중앙 정렬 */
    bottom: 0; /* 하단으로 이동 */
    margin-bottom: 20px; /* 아래 여백 추가 */
}

.form-links a {
    display: block; /* 블록 요소로 변경하여 한 줄에 하나씩 표시 */
    margin: 10px auto; /* 가운데 정렬 */
}

input[type="checkbox"] {
    vertical-align: middle; /* 체크박스를 수직으로 중앙 정렬 */
    margin-right: 5px; /* 아이디 저장하기 텍스트와의 간격을 조절 */
}
/* 추가한 CSS 코드 여기까지 */
</style>
</head>
<body>
	<h2>UNIFUND</h2>
	<form action="/main/member/login.do" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" placeholder="아이디"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" placeholder="패스워드"><br></td>
			</tr>
		</table>
		<input type="submit" value="LOGIN">
	</form>
	<br>
	<input type="button" value="회원가입하러가기!"
		onclick="location.href='join.go'">
	<br>
	<h3><input type="checkbox" id="idSaveCheck" style="display: inline-block; vertical-align: middle;">
	<label for="idSaveCheck" style="display: inline-block; margin-right: 5px;">아이디 저장하기</label></h3>
	<br>
	<h4><a href="findId.go" style="color: rgb(0, 196, 196);">아이디찾기</a></h4>
	<br>
	<h5><a href="findPw.go" style="color: rgb(0, 196, 196);">비밀번호 변경</a></h5>
</body>
<script>

	
</script>
</html>
