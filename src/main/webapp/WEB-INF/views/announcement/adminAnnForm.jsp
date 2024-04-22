<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
    <!-- 필요한 스타일 시트 및 스크립트를 여기에 추가하세요 -->
    <style>
        /* 스타일 시트를 추가하세요 */
    </style>
</head>
<body>
    <h1>공지사항 작성</h1>
    <form id="noticeForm" action="notiWrite" method="post" enctype="multipart/form-data">
        <label for="noti_title">제목:</label>
        <input type="text" id="noti_title" name="noti_title"><br><br>
        
        <label for="noti_content">내용:</label><br>
        <textarea id="noti_content" name="noti_content" rows="5" cols="50"></textarea><br><br>
        
        <label for="noti_top">상단고정:</label>
        <input type="checkbox" id="noti_top" name="noti_top" value="B"><br><br>
        
        <label for="noti_photo">사진 첨부:</label>
        <input type="file" id="noti_photo" name="noti_photo"><br><br>
        
        <input type="button" value="작성" onclick="submitForm()">
        <input type="button" value="취소" onclick="cancel()">
    </form>

    <script>
        function annWrite() {
           
            var $noti_title = $('#noti_title')
            var $noti_content = $('#noti_content')
            var $noti_top = $('#noti_top')
            var $noti_photo = $('#noti_photo')
            
            if($noti_title.val() == ''){
				alert(' 제목을 입력해주세요.');
     			$pro_title.focus();
            }else if($noti_title.val().length > )
         
            
            document.getElementById("noticeForm").submit();
        }

        function cancel() {
            // 취소 버튼 클릭 시 이전 페이지로 돌아가기
            history.back();
        }
    </script>
</body>
</html>