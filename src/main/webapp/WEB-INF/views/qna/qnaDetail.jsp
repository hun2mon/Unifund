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
	margin-right: 0px;
}

.div_flex {
	display: flex;
}

.paging_container {
	width: 100%;
	text-align: center;
	display: inline-block;
	margin-top: 30px;
	position: fixed;
	bottom: 27px;
}

.paging {
	color: gray;
	text-decoration: none;
	margin-top: 30px;
	background-color: #fdfdfd;
	border: none;
	width: 50px;
	margin: 5px;
	padding: 10px 15px;
	font-size: 16px;
	border-radius: 20px;
	box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff;
	transition: all 0.3s ease;
}

.paging:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.currentPaging {
	background-color: #a1a1a1;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="edit-button">
					<c:if test="${mem_idx eq qnaDTO.mem_idx or mem_status eq 'M'}">
						<!-- 수정 버튼에 링크를 추가하여 수정 페이지로 이동할 수 있도록 합니다. -->
						<a href="update.go?qna_idx=${qna_idx}" class="btn btn-primary">수정</a>
					</c:if>
				</div>
				<div class="delete-button">
					<c:if test="${mem_idx eq qnaDTO.mem_idx or mem_status eq 'M'}">
						<!-- 삭제 버튼에 data-qna-idx 속성을 추가하여 Qna의 인덱스 값을 설정합니다. -->
						<button class="btn btn-danger" data-qna-idx="${qna_idx}"
							onclick="deleteQna(this)">삭제</button>
					</c:if>
				</div>
				<h3 class="panel-title">QnA</h3>
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
					<div class="div_flex"></div>
					<div>
						<div>
							<input type="hidden" class="replyFrom" name="qna_idx"
								value="${qnaDTO.qna_idx}">
							<!-- 답글 인풋박스를 <textarea>로 변경하고 세로 크기를 조절합니다. -->
							<textarea class="replyFrom" name="rplContent" rows="3"
								maxlength="2000" style="width: 100%; resize: vertical;"></textarea>
						</div>
						<div>
							<input type="button" class="sub_reply" value="작성"
								onclick="replyWrite()">
							<button type="button" class="btn btn-default" onclick="cancel()">목록</button>
						</div>
					</div>
				</form>
				<hr>
				<div id="list"></div>
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	repListCall();
})


function repLengthCheck(text){
	var content = $(text).val();
	if (content.length >= 2000) {
		alert('입력 가능 글자수를 초과하였습니다.');
	}
}

function replyWrite(){
	
	var $rplContent = $('input[name="rplContent"]');
	
	if ($rplContent.val()=='') {
		alert('답변 내용을 입력 해주세요');
		$rplContent.focus();
	}else {
		$('form').submit();
	}
	
}

function deleteQna(button) {
    // 삭제할 Qna의 인덱스 값을 가져옵니다.
    var qnaIdx = button.getAttribute('data-qna-idx');

    // AJAX를 사용하여 선택된 Qna를 삭제합니다.
    $.ajax({
        type: 'post', // POST 방식으로 요청을 전송합니다.
        url: './delete.ajax', // 삭제를 처리할 URL을 지정합니다.
        data: {
            'qnaDel': ${qnaDTO.qna_idx} // 삭제할 Qna의 인덱스를 전달합니다.
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



function repListCall(){
	$.ajax({
		type:'get'
		,url:'./replyList.ajax'
		,data:{
			qna_idx:${qnaDTO.qna_idx}
		}
		,dataType:'json'
		,success:function(data){
			console.log(data);
			drawRepList(data.list);
		}
		,error:function(error){
			console.log(error);
		}
	});
}

var comm_idx = 0;

function drawRepList(list){
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
			content += '<a href="./delete.do?comm_idx=' +item.comm_idx + '&qna_idx=' + item.qna_idx +'">답글삭제 </a>';	
			$('input[name="revContent"]').attr('readonly',true);
			$('.sub_review').attr('type','hidden');
		}
		content += '</div>';
		content += '<hr>';
	}
	$('#list').html(content);
}
function cancel() {
    // 이전 페이지로 이동하는 코드 추가
    alert('이전 페이지로 이동합니다.');
    window.history.back();
}

</script>
</html>
