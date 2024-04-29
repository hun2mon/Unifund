<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QnA 작성</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<style>

</style>
</head>
<body>
    <h1>QnA 작성 폼</h1>
    <form id="qnaForm" action="./create.do" method="post">
        <label for="qna_title">제목:(최대 20자)</label><br>
        <input type="text" id="qna_title" name="qna_title" maxlength="20"><br>
        
        <label for="qna_content">내용:</label><br>
        <textarea id="qna_content" name="qna_content" rows="4" cols="50"></textarea><br>
        
        <input type="checkbox" id="qna_show" name="qna_show">
        <label for="qna_show">비공개</label><br>
        
        <div id="passwordField" style="display:none;">
            <label for="qna_pass">비밀번호:</label><br>
            <input type="password" id="qna_pass" name="qna_pass"><br>
            <button type="button" onclick="setPassword()">확인</button>
        </div>
        
        <button type="button" onclick="submitForm()">등록</button>
        <button type="button" onclick="cancel()">취소</button>
    </form>
 <script>
 var chcckflag = false;
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
            if(chcckflag == false){
            	alert('비밀번호를 입력해주세용');
            	return ;
            }
            
      	   // 폼에 qna_show 값을 설정
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
        
        
        
        
        
        
        function cancel() {
            // 이전 페이지로 이동하는 코드 추가
            alert('이전 페이지로 이동합니다.');
        }
        
        function setPassword() {
            var password = document.getElementById('qna_pass').value.trim();
            if (password === '') {
                alert('비밀번호를 입력하세요.');
                return;
            }
            chcckflag = true;
            // 비밀번호 설정 처리
            // 여기에 비밀번호 설정 후 메시지 출력하는 코드 추가
            
            alert('비밀번호가 설정되었습니다.');
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