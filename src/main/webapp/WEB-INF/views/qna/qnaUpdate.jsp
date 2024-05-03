<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QnA 수정</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<style>

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<h1>QnA 수정 </h1>
    <form id="qnaUpdateForm" action="./update.do" method="post">
        <input type="hidden" name="qna_idx" value="${qnaDTO.qna_idx}">
        <label for="qna_title">제목:(최대 20자)</label><br>
        <input type="text" id="qna_title" name="qna_title" maxlength="20" value="${qnaDTO.qna_title}"><br>

        <label for="qna_content">내용:</label><br>
        <textarea id="qna_content" name="qna_content" rows="4" cols="50">${qnaDTO.qna_content}</textarea><br>

          <label for="qna_show">비공개</label>
        <input type="checkbox" id="qna_show" name="qna_show" value="비공개" ${qnaDTO.qna_show == '비공개' ? 'checked' : ''}>

        <div id="passwordField" style="${qnaDTO.qna_show ? 'display:block;' : 'display:none;'}">
            <label for="qna_pass">비밀번호:</label><br>
            <input type="password" id="qna_pass" name="qna_pass" value="${qnaDTO.qna_pass}"><br>
        </div>

        <button type="button" onclick="submitForm()">수정</button>
        <button type="button" onclick="cancel()">취소</button>
    </form>

</body>
<script>
    window.onload = function() {
        var qnaShowCheckbox = document.getElementById('qna_show');
        var passwordField = document.getElementById('passwordField');
        
        if (qnaShowCheckbox.checked) {
            passwordField.style.display = 'block';
        } else {
            passwordField.style.display = 'none';
        }
    };

    function submitForm() {
        var title = document.getElementById('qna_title').value.trim();
        var content = document.getElementById('qna_content').value.trim();
        var isPrivate = document.getElementById('qna_show').checked;
        var password = document.getElementById('qna_pass').value.trim();

        if (title === '' || content === '') {
            alert('제목과 내용을 모두 작성해주세요.');
            return;
        }

        if (title.length > 20) {
            alert('제목은 최대 20자까지만 가능합니다.');
            return;
        }

        if (isPrivate && password === '') {
            alert('비밀번호를 입력하세요.');
            return;
        }
        
        if ($('#qna_show').is(':checked')) {
    	    $('#qna_show').val('비공개');
    	} else {
    		$('#qna_show').prop('checked',true);
    		$('#qna_show').val('공개');
    	}

        // 폼 제출
        document.getElementById("qnaUpdateForm").submit();
    }

    function cancel() {
        // 이전 페이지로 이동하는 코드 추가
        alert('이전 페이지로 이동합니다.');
        window.history.back();
    }

    document.getElementById('qna_show').addEventListener('change', function() {
        var passwordField = document.getElementById('passwordField');
        if (this.checked) {
            passwordField.style.display = 'block';
            this.value = '비공개';
        } else {
            passwordField.style.display = 'none';
            this.value = '공개';
        }
    });
</script>
</html>