<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
 <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>   
<style>
</style>
</head>
<body>
 <%@ include file = "/WEB-INF/views/common/header.jsp" %>
 <h2>공지사항 수정</h2>
 <form action="./update.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="noti_idx" value="${announcementDTO.noti_idx}">
        <label for="noti_title">제목:</label>
        <input type="text" id="noti_title" name="noti_title" value="${announcementDTO.noti_title}">
        <br>
        <label for="noti_content">내용:</label>
        <textarea id="noti_content" name="noti_content">${announcementDTO.noti_content}</textarea>
        <br>
        <label for="noti_top">상단 고정 여부:</label>
        <input type="checkbox" id="noti_top" name="noti_top" value="B" ${announcementDTO.noti_top == 'B' ? 'checked' : ''}>
        <br>
        <label for="noti_photo">사진 업로드:</label>
        <input type="file" id="noti_photo" name="noti_photo">
        <br>
        <input type="submit" value="수정" onclick="annWrite()" >
    </form>

</body>
<script>

function annWrite() {

	if ($('#noti_top').is(':checked')) {
	    $('#noti_top').val('B');
	} else {
		$('#noti_top').prop('checked',true);
		$('#noti_top').val('A');
	}
	
	$('form').submit();
		
}
</script>
</html>