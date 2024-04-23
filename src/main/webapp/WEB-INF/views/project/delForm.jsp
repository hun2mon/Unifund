<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
table {
	border-collapse: collapse;
}

th, td {
	width: 600px;
	height: 50px;
	text-align: left;
	border: 1px solid #000;
	vertical-align: top;
	vertical-align: bottom;
	vertical-align: middle;
}

.button {
	text-align: center;
}

input[name=reportTitle] {
	width: 550;
}

input[name=reportContent] {
	width: 600;
	height: 200;
}

.category {
	margin-left: 450;
	width: 70;
}
</style>
</head>
<body>
	<form action="delete.do" method="post">
		<table align="center">
			<tr>
				<th scope="col">삭제 사유 <input type="text" class="category"
					value="프로젝트 번호" hidden>
				</td>
			</tr>
			<tr>
				<td>사유<br> <input type="text" name="reportContent"></td>
			</tr>
			<tr>
				<td class="button">
					<input type="button" value="삭제" onclick="proDelete()">
					<button onclick="window.close()">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
	function proDelete(){
		$('form').submit();
		self.close();
	}
</script>
</html>