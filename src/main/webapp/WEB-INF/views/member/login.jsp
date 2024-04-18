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
	<from action="login.do" method="post">
	<table>
		<tr>
			<th>ID</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="로그인"> 
				<input type="button" value="회원가입">
			</th>
		</tr>
	</table>
	</from>
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