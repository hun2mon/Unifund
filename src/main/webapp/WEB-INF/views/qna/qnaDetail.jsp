<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QnA 상세보기</title>
<!-- 부트스트랩 CSS 추가 -->
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="../resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
.info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.info p {
	margin: 0;
}

.question-content {
	border: 1px solid #ccc;
	padding: 10px;
	margin-top: 20px;
}

.edit-button {
	text-align: right;
}

.delete-button {
	float: right;
	margin-bottom: 10px;
	margin-right: 0px; /* 수정된 부분: 삭제 버튼을 수정 버튼 왼쪽으로 5px 정도 떨어뜨립니다. */
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="edit-button">
					<a href="update.go?qna_idx=${qna_idx}" class="btn btn-primary">수정</a>
				</div>
				<div class="delete-button">
					<c:if test="${mem_idx eq qnaDTO.mem_idx or mem_status eq 'M'}">
						<!-- 삭제 버튼에 data-qna-idx 속성을 추가하여 Qna의 인덱스 값을 설정합니다. -->
						<button class="btn btn-danger" data-qna-idx="${qna_idx}"
							onclick="deleteQna(this)">삭제</button>
					</c:if>
				</div>
				<h3 class="panel-title">QnA 상세보기</h3>
			</div>
			<div class="panel-body">
				<div class="info">
					<p>제목: ${qnaDTO.qna_title}</p>
					<p>작성자: ${qnaDTO.mem_id}</p>
					<p>${qnaDTO.qna_show}</p>
					<p>작성일: ${qnaDTO.qna_date}</p>
				</div>
				<div class="question-content">
					<p>${qnaDTO.qna_content}</p>
				</div>
			</div>
		</div>
		<div class="div_reply">
			<div class="div_reply_top">
				<form action="reply/write.do" method="post"
					enctype="multipart/form-data">
					<div class="div_flex">
					</div>
					<div>
						<div>
							<input type="hidden" class="replyFrom" name="qna_idx"
								value="${qnaDTO.qna_idx }">
							<input type="text" class="replyFrom" name="rplContent" min="5" maxlength="500"
								onkeyup="lengthCheck(this)">
						</div>
						<div>
						<input type="button" class="sub_reply" value="작성" onclick="revWrite()">
						</div>
					</div>
				</form>
				<hr>
				<div id="list"></div>
			</div>

		</div>
</body>
<script>
$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall();
});

function deleteQna(button) {
    // 삭제할 Qna의 인덱스 값을 가져옵니다.
    var qnaIdx = button.getAttribute('data-qna-idx');

    // AJAX를 사용하여 선택된 Qna를 삭제합니다.
    $.ajax({
        type: 'post', // POST 방식으로 요청을 전송합니다.
        url: './delete.ajax', // 삭제를 처리할 URL을 지정합니다.
        data: {
            'qnaDel': qnaIdx // 삭제할 Qna의 인덱스를 전달합니다.
        },
        success: function (response) {
            // 삭제가 성공한 경우 알림 메시지를 표시하고 목록을 다시 불러옵니다.
            if (response === "success") {
                alert("선택된 Qna가 삭제되었습니다.");
                // 삭제 후 목록 다시 불러오기
                window.location.href = './list.go'; // 삭제 후 목록 페이지로 이동합니다.
            } else {
                // 삭제가 실패한 경우 알림 메시지를 표시합니다.
                alert("Qna 삭제에 실패했습니다.");
            }
        },
        error: function (error) {
            // 서버 요청 실패 시 에러 메시지를 콘솔에 출력하고 알림 메시지를 표시합니다.
            console.log(error);
            alert("Qna 삭제에 실패했습니다.");
        }
    });
}
function listCall(){
	$.ajax({
		type:'get'
		,url:'./qna/detail.ajax'
		,data:{
			qna_idx:${qna.qna_idx},
		}
		,dataType:'json'
		,success:function(data){
			drawList(data.list);
		}
		,error:function(error){
			console.log(error);
		}
	});
}

var comm_idx = 0;

function drawList(list){
	var content = '';
	for (item of list) {
		content += '<div id = "rev_css">';
		content += '<span class="spanMargin">작성자 : ' + item.mem_id + '</span>';
		var date = new Date(item.comm_date);
		var dateStr = date.toLocaleDateString("ko-KR");
		content += '<span class="spanMargin">' + dateStr + '</span>';
		content += '<div class="reply_content">' + item.comm_content + '</div>';
		content += '<div>';
		if (item.mem_id == '${mem_id}') {
			content += '<a href="qna/delete.do?comm_idx=' +item.comm_idx + '&qna_idx=' + item.qna_idx +'">리뷰삭제 </a>';	
			$('input[name="revContent"]').attr('readonly',true);
			$('.sub_review').attr('type','hidden');
		}
		content += '</div>';
		content += '<hr>';
	}
	$('#list').html(content);
};

































</script>
</html>
