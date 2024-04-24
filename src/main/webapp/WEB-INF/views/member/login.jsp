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

</style>
</head>
<body>
	<h2>★UNIFUND LOGIN★</h2>
	<form action="login.do" method="post">
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
    <input type="button" value="회원가입하러가기!" onclick="location.href='join.go'">
    <br>
    <input type="checkbox" id="idSaveCheck">아이디 저장하기
    <br>
    <a href="findId.go">아이디찾기</a>
    <br>
    <a href="findid.jsp">비밀번호 변경</a>
    <br> ${msg}
</body>
<script>
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
	
</script>
</html>
