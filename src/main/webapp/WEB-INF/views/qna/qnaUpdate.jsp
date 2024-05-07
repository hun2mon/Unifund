<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QnA 수정</title>
<!-- 부트스트랩 CSS 추가 -->
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	padding: 20px;
	background-color: #e2e1e0; /* 연한 회색 배경 */
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
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	width: 100%;
	max-width: 500px;
	height: 66vh; /* 페이지 세로 길이의 2/3 (66.6%) */
	overflow-y: auto; /* 내용이 넘칠 경우 스크롤바 표시 */
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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="form-container">
			<h1>QnA 수정</h1>
			<form id="qnaUpdateForm" action="./update.do" method="post">
				<input type="hidden" name="qna_idx" value="${qnaDTO.qna_idx}">
				<div class="form-group">
					<label for="qna_title">제목: (최대 20자)</label> <input type="text"
						class="form-control" id="qna_title" name="qna_title"
						maxlength="20" value="${qnaDTO.qna_title}">
				</div>

				<div class="form-group">
					<label for="qna_content">내용:</label>
					<textarea class="form-control" id="qna_content" name="qna_content"
						rows="12" cols="50">${qnaDTO.qna_content}</textarea>
				</div>

				<div class="checkbox">
					<label> <input type="checkbox" id="qna_show"
						name="qna_show" ${qnaDTO.qna_show == '비공개' ? 'checked' : ''}
						value="비공개"> 비공개
					</label>
				</div>

				<div id="passwordField"
					style="${qnaDTO.qna_show == '비공개' ? 'display:block;' : 'display:none;'}">
					<div class="form-group">
						<label for="qna_pass">비밀번호:</label> <input type="password"
							class="form-control" id="qna_pass" name="qna_pass"
							value="${qnaDTO.qna_pass}">
					</div>
				</div>

				<button type="button" class="btn btn-primary" onclick="submitForm()">수정</button>
				<button type="button" class="btn btn-default" onclick="cancel()">취소</button>
			</form>
		</div>
	</div>

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

			// 폼 제출
			document.getElementById("qnaUpdateForm").submit();
		}

		function cancel() {
			// 이전 페이지로 이동하는 코드 추가
			alert('이전 페이지로 이동합니다.');
			window.history.back();
		}

		document.getElementById('qna_show').addEventListener(
				'change',
				function() {
					var passwordField = document
							.getElementById('passwordField');
					if (this.checked) {
						passwordField.style.display = 'block';
					} else {
						passwordField.style.display = 'none';
					}
				});
	</script>
</body>
</html>
