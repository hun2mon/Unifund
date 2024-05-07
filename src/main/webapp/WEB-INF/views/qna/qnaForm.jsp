<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA 작성</title>
    <!-- 부트스트랩 CSS 추가 -->
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 20px;
            background-color: #f3f3f3; /* 연한 회색 배경 */
            color: #333; /* 어두운 텍스트 색상 */
        }

        .container {
            max-width: 600px;
            margin: 50px auto 0; /* 헤더와 폼 사이의 여백 추가 */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-container {
            background-color: #fff; /* 흰색 배경 */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
            width: 100%;
            max-width: 500px;
        }

        h1 {
            text-align: center;
            color: #333; /* 어두운 텍스트 색상 */
            margin-top: 0;
        }

        label {
            font-weight: bold;
            color: #333; /* 어두운 텍스트 색상 */
        }

        textarea {
            resize: vertical;
            height: 200%; /* 기본 높이의 2배 */
        }

        #passwordField {
            margin-top: 10px;
        }

        button {
            margin-top: 10px;
        }
        
        /* 투명도 효과 */
        .form-container {
            transition: opacity 0.5s ease;
            opacity: 0.9; /* 기본 투명도 설정 */
        }

        .form-container:hover {
            opacity: 1; /* 마우스를 올렸을 때 투명도를 1로 설정하여 완전히 투명하지 않도록 합니다. */
        }
    </style>
</head>
<body>
<body style="background-color: #e2e1e0;"> 
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
    <div class="form-container">
        <h1>QnA 작성 폼</h1>
        <form id="qnaForm" action="./create.do" method="post">
            <div class="form-group">
                <label for="qna_title">제목: (최대 20자)</label>
                <input type="text" class="form-control" id="qna_title" name="qna_title" maxlength="20">
            </div>

            <div class="form-group">
                <label for="qna_content">내용:</label>
                <textarea class="form-control" id="qna_content" name="qna_content" rows="16" cols="50"></textarea>
            </div>

            <div class="checkbox">
                <label>
                    <input type="checkbox" id="qna_show" name="qna_show"> 비공개
                </label>
            </div>

            <div id="passwordField" style="display:none;">
                <div class="form-group">
                    <label for="qna_pass">비밀번호:</label>
                    <input type="password" class="form-control" id="qna_pass" name="qna_pass">
                </div>
            </div>

            <button type="button" class="btn btn-primary" onclick="submitForm()">등록</button>
            <button type="button" class="btn btn-default" onclick="cancel()">취소</button>
        </form>
    </div>
</div>


<script>
    function submitForm() {
        var title = document.getElementById('qna_title').value.trim();
        var content = document.getElementById('qna_content').value.trim();
        var isPrivate = document.getElementById('qna_show').checked;
        var password = document.getElementById('qna_pass').value.trim();

        var qna_show_value = isPrivate ? "비공개" : "공개";

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

        // 비공개로 설정되지 않은 경우, 비밀번호 확인을 건너뛰고 폼을 제출합니다.
        if (!isPrivate) {
            // 비밀번호 필요 없음
            submitWithoutPassword();
            return;
        }

        var qna_show_input = document.createElement("input");
        qna_show_input.setAttribute("type", "hidden");
        qna_show_input.setAttribute("name", "qna_show");
        qna_show_input.setAttribute("value", qna_show_value);

        // 폼에 hidden input 추가
        var form = document.getElementById("qnaForm");
        form.appendChild(qna_show_input);

        // 폼 제출
        form.submit();
    }

    function submitWithoutPassword() {
        // 폼 제출
        var form = document.getElementById("qnaForm");
        form.submit();
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