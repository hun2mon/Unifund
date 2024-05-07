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
/* Common Styles */
body {
    background-color: #f4f4f4;
    font-family: Arial, sans-serif;
}

.container {
    margin-top: 50px;
}

.form-container {
    background: white;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    color: #333;
    border-radius: 20px;
    padding: 30px;
    max-width: 800px;
    margin: 0 auto;
    text-align: center; /* Center align the content */
}

.form-container h1 {
    color: black; /* Change the color to black */
    margin-bottom: 20px;
    font-size: 24px; /* Increase font size */
}

.btn_td {
    text-align: center;
}

.btn_cancel {
    background-color: #ccc;
    color: #333;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 10px;
}

.btn_submit {
    background-color: #6286b8;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

textarea {
    width: 100%;
    height: 200px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 10px;
}

input[type="text"],
input[type="file"] {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 10px;
}

input[type="checkbox"] {
    margin-right: 5px;
    vertical-align: middle;
}
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    <div class="container">
        <div class="form-container">
            <form action="./update.do" method="post" enctype="multipart/form-data" id="announcementForm">
                <h1>공지사항 수정</h1>
                <div>
                    <label>제목:</label><br>
                    <input name="noti_idx" value="${announcementDTO.noti_idx}" hidden>
                    <input type="text" id="noti_title" name="noti_title" value="${announcementDTO.noti_title}">
                </div>
                <div>
                    <label>내용:</label><br>
                    <textarea id="noti_content" name="noti_content">${announcementDTO.noti_content}</textarea>
                </div>
                <div>
                    <input type="checkbox" id="noti_top" name="noti_top" value="B" ${announcementDTO.noti_top == 'B' ? 'checked' : ''}>
                    <label for="noti_top">상단 고정 여부</label>
                </div>
                <div>
                    <label>사진 업로드:</label><br>
                    <input type="file" id="noti_photo" name="noti_photo">
                </div>
                <div class="btn_td">
                    <input type="button" value="수정" onclick="annWrite()" class="btn_submit">
                    <button type="button" onclick="cancel()" class="btn_cancel">취소</button>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
function annWrite() {
    var notiTitle = $('#noti_title').val();
    var notiContent = $('#noti_content').val();

    if (notiTitle.trim() === '' || notiContent.trim() === '') {
        alert('제목과 내용을 모두 입력해주세요.');
    } else {
        if ($('#noti_top').is(':checked')) {
            $('#noti_top').val('B');
        } else {
            $('#noti_top').prop('checked', true);
            $('#noti_top').val('A');
        }
        $('#announcementForm').submit();
    }
}

function cancel() {
    alert('이전 페이지로 이동합니다.');
    window.history.back();
}
</script>
</html>
