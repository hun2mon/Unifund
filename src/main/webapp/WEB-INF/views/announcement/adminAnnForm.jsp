<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="../resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
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

/* Styles specific to this page */
.noti_title {
    font-size: 18px;
}

.noti_content {
    resize: none;
}

.noti_photo {
    display: none;
}

.file_input {
    width: calc(100% - 80px);
    display: inline-block;
    vertical-align: middle;
}

.file_btn {
    background-color: #6286b8;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    display: inline-block;
    vertical-align: middle;
}

/* Additional styles for checkbox label */
.checkbox_label {
    font-size: 16px;
    vertical-align: middle;
}

.center-align {
    text-align: center;
}

.center-align div {
    margin-bottom: 20px; /* 각 요소 사이에 공간을 추가합니다. */
}
.noti_title {
    font-size: 16px; /* 글자 크기 줄이기 */
    height: 30px; 
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
    <div class="form-container">
        <form action="./adminAnnForm.do" method="post" enctype="multipart/form-data">
            <h1>공지사항 작성</h1>
            <div class="center-align">
                <div>
                    <label>공지 제목</label><br>
                    <input type="text" name="noti_title" class="noti_title" placeholder="제목을 입력해주세요."  />
                </div>
                <div>
                    <label>공지 사진</label><br>
                    <input type="file" id="noti_photo" name="noti_photo" class="noti_photo" onchange="updateFileName(this)">
                </div>
                <div>
                    <label>공지 내용</label><br>
                    <textarea name="noti_content" class="noti_content" placeholder="공지 내용을 입력해 주세요."></textarea>
                </div>
                <div>
                    <input type="checkbox" name="noti_top" id="noti_top" class="noti_top" value="A">
                    <label for="noti_top" class="checkbox_label">상단 고정</label>
                </div>
                <div class="btn_td">
                    <input type="button" onclick="location.href='./adminList.go'" value="취소" class="btn_cancel">
                    <input type="button" onclick="annWrite()" value="등록" class="btn_submit">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
	function updateFileName(input) {
		var fileName = input.files[0].name;
		$('.file_input').val(fileName);
	}

	function annWrite() {
		var $noti_title = $('.noti_title');
		var $noti_photo = $('#noti_photo');
		var $noti_content = $('.noti_content');

		if ($noti_title.val() == '') {
			alert(' 제목을 입력해주세요.');
			$noti_title.focus();
		} else if ($noti_photo.get(0).files.length > 1) {
			alert('공지사진은 1장만 추가해주세요.');
		} else if ($noti_content.val() == '') {
			alert('공지사항 내용을 입력해주세요.');
			$noti_content.focus();
		} else {
			if ($('input[name="noti_top"]').is(':checked')) {
				$('input[name="noti_top"]').val('B');
			} else {
				$('input[name="noti_top"]').prop('checked', true);
				$('input[name="noti_top"]').val('A');
			}
			$('form').submit();
		}
	}
</script>
</html>
