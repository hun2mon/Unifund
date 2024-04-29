<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="../resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	padding-top: 20px; /* 네비게이션 바 높이만큼 여백 추가 */
}

.container {
	max-width: 800px; /* 페이지 폭 제한 */
	margin: 0 auto; /* 페이지 중앙 정렬 */
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-top: 20px;
}

h2 {
	color: #333333;
	font-size: 24px; /* 제목 크기 조정 */
	margin-bottom: 20px;
}

.text-right {
	color: #888888;
}

.img-responsive {
	max-width: 100%;
	height: auto;
	margin-bottom: 20px;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	margin-right: 10px; /* 버튼 간 여백 조정 */
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

.btn-container {
	text-align: center; /* 버튼 가운데 정렬 */
	margin-top: 20px; /* 버튼 위 여백 추가 */
}

.section-divider {
	border-top: 1px solid #ccc;
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>${announcementDTO.noti_title}</h2>
				<p class="text-right">등록일: ${announcementDTO.noti_date}</p>
			</div>
		</div>
		<div class="section-divider"></div>
		<div class="row">
			<div class="col-md-12">
				<c:choose>
					<c:when test="${not empty notiPhoto}">
						<img src="/photo/${notiPhoto}" class="img-responsive"
							alt="공지사항 이미지">
					</c:when>
					<c:otherwise>
						<p>${announcementDTO.noti_content}</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="section-divider"></div>
		<div class="row">
			<div class="col-md-12">
				<c:if test="${not empty notiPhoto}">
					<p>${announcementDTO.noti_content}</p>
				</c:if>
			</div>
		</div>
		<div class="section-divider"></div>
		<div class="row btn-container">
			<div class="col-md-6">
				<c:choose>
					<c:when test="${mem_status eq 'M'}">
						<a href="adminList.go" class="btn btn-primary">목록</a>
					</c:when>
					<c:otherwise>
						<a href="annList.go" class="btn btn-primary">목록</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-md-6">
				<c:choose>
					<c:when test="${mem_status eq 'M'}">
						<a href="update.go?noti_idx=${noti_idx}" class="btn btn-primary">수정</a>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</body>
<script>

var noti_idx = ${noti_idx};
console.log(noti_idx);














</script>
</html>