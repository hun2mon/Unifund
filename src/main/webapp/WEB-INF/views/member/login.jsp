<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
</style>
</head>
<body>
	<h2>★UNIFUND LOGIN★</h2>
	<table>
	<form action="login.do" method="post">
		<tr>
			<th>ID</th>
			<td><input type="text" name="id" placeholder="아이디"></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" name="pw" placeholder="패스워드"><br></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="LOGIN">
	</form>
				<br><p></p>
				<input type="button" value="회원가입하러가기!"><br>
				<input type="checkbox" id="idSaveCheck">아이디 저장하기</p> 
				<input type="link" value="아이디찾기"><br>
				<input type="link" value="비밀번호변경"><br>
			</th>
		</tr>
	</table>
	${msg}
</body>
<script>
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
	
	
	$('input[type="button"]').on('click',function(){
		console.log('click');
		location.href='join.go';
	});
	
</script>
</html>