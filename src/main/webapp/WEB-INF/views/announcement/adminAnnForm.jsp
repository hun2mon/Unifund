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
/* 스타일 시트를 추가하세요 */
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="form-container">
			<form action="./adminAnnForm.do" method="post"
				enctype="multipart/form-data">
				<h1>공지사항 작성</h1>
				<table>
					<tr>
						<th>공지 제목</th>
					</tr>
					<tr>
						<td><input type="text" name="noti_title" class="noti_title"
							placeholder="제목을 입력해주세요." /></td>
						<td>
					</tr>
					<tr>
						<th>공지 사진</th>
					</tr>
					<tr>
						<td><input class="file_input file1" placeholder="사진 첨부."
							readonly="readonly"><label for="noti_photo"
							class="noti_photo">파일찾기</label> <input type="file"
							id="noti_photo" name="noti_photo"></td>
					</tr>
					<tr>
						<th>공지 내용</th>
					</tr>
					<tr>
						<td><textarea name="noti_content" class="noti_content"
								placeholder="프로젝트 내용을 입력해 주세요."></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" name="noti_top" class="noti_top"/>
						</td>
					</tr>
					<tr>
						<td class="btn_td" colspan="2"><input type="button"
							onclick="location.href='./adminList.go'" value="취소"
							class="btn_cancel"> <input type="button"
							onclick="annWrite()" value="등록" class="btn_submit"></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>
<script>
	function annWrite() {

		var $noti_title = $('.noti_title');
		var $noti_photo = $('#noti_photo');
		var $noti_content = $('.noti_content');
	
		console.log("Sdasadsa");
	
		
		if ($noti_title.val() == '') {
			alert(' 제목을 입력해주세요.');
			$noti_title.focus();
		} else if ($noti_photo.get(0).files.length > 1) {
			alert('공지사진은 1장만 추가해주세요.');
		} else if ($noti_content.val() == '') {
			alert('공지사항 내용을 입력해주세요.');
			$noti_content.focus();
		}else{
			if ($('input[name="noti_top"]').is(':checked')) {
			    $('input[name="noti_top"]').val('B');
			} else {
				$('input[name="noti_top"]').prop('checked',true);
				$('input[name="noti_top"]').val('A');
			}
			console.log($('input[name="noti_top"]').val());
			$('form').submit();
			
		}
		
		

	}


</script>
</html>