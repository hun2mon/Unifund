<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
input[name="아이디"] {
	width: 65%
}
input[name="연락처"] {
	width: 65%
}
input[name="연락처 인증"] {
	width: 65%
}
	
</style>
</head>
<body>
	<h3>UNIFUND 회원가입</h3>
	<hr />
	<form action="join.do" method="post">
		<table>
			<tr>
				<th>프로필 사진</th>
				<td><input type="file" value="첨부파일"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="아이디" /> <input type="button"
					value="아이디체크" onclick="overlay()" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="비밀번호" /></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="text" id="비밀번호 확인" /><span id="msg"></span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="이름" /></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="생년월일" /></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="연락처" /><input type="button"
					value="인증"></td>
			</tr>
			<tr>
				<th>연락처 인증</th>
				<td><input type="text" name="연락처 인증" /><input type="button"
					value="확인"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="성별" value="남" />남자
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gender"
					value="여" />여자</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="이메일" /></td>
			</tr>
			<tr>
				<th>은행</th>
				<td><input type="text" name="은행" /></td>
			</tr>
			<tr>
				<th>은행 계좌번호</th>
				<td><input type="text" name="은행 계좌번호" /></td>
			</tr>
			<tr>
				<th>재학증명서</th>
				<td><input type="file"	value="첨부파일"></td>
			</tr>
			<tr>
				<th>대학교 선택</th>
				<td><input type="text" name="대학교 선택" /></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="우편번호" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="주소" /></td>
			</tr>
			<tr>
				<th>개인정보 동의</th>
				<td><input type="text" name="개인정보 동의" /></td>
			</tr>
			<tr>
				<!-- button 태그에 type="button" 을 넣으면 submit 기능이 사라진다. -->
				<th colspan="2"><button type="button" onclick="join()">회원가입</button></th>
			</tr>
		</table>
	</form>
</body>
<script>

	var overChk = false;

	$('#confirm').on('keyup',function(){
		if($('input[name="pw"]').val() == $(this).val()){
			$('#msg').html('비밀번호가 일치 합니다.');
			$('#msg').css({'color':'green'});
		}else{
			$('#msg').html('비밀번호가 일치하지 않습니다.');
			$('#msg').css({'color':'red'});
		}
	});
	
	
	function join(){
		
		var $id = $('input[name="id"]');
		var $pw = $('input[name="pw"]');
		var $auth = $('input[name="auth"]:checked');
		var $name = $('input[name="name"]');
		var $age = $('input[name="age"]');
		var $gender = $('input[name="gender"]:checked');
		var $email = $('input[name="email"]');
				
		if(overChk == false){
			alert('중복 체크를 해 주세요!');
			$id.focus();
		}else if($id.val()==''){
			alert('아이디를 입력 해 주세요!');			
			$id.focus();
		}else if($pw.val()==''){
			alert('비밀번호를 입력 해 주세요!');			
			$pw.focus();
		}else if($name.val()==''){
			alert('이름을 입력 해 주세요!');			
			$name.focus();
		}else if($age.val()==''){
			alert('나이를 입력 해 주세요!');			
			$age.focus();
		}else if($gender.val()==null){
			alert('성별을 체크 해 주세요!');			
		}else if($email.val()==''){
			alert(' 이메일을 입력 해 주세요!');			
			$email.focus();
		}else{
			// 데이터 넣기 전에 확인
			var regExp = new RegExp('[a-zA-Zㄱ-ㅎ가-힣]');
			var match = regExp.test($age.val()); // 위의 표현식 일치 여부
			if(match){
				alert('숫자만 입력 해 주세요!');
				$age.val('');
				$age.focus();
				return false;
			}			
			console.log('서버로 회원가입 요청');
			$('form').submit();//submit 버튼 역활
		}
		
		
	}

	var msg = '${msg}'; // 쿼터 빠지면 넣은 문구가 변수로 인식됨.
	if(msg != ''){
		alert(msg);
	}
	function overlay() {
		console.log('click');
		var id = $('input[name="id"]').val();
		//ajax를 이용한 비동기 통신 (자바스크렙트를 사용해 보안성이 좋지 못함 취약함)
		$.ajax({
			type:'post', // method 방식
			url:'overlay.do', // 요청한 주소
			data:{'id':id}, // 파라메터
			success:function(data){ // 통신 성공했을경우
			//ajax에서 XmlhttpRequest 객체를 통해 대신 받아와서
			//여기에 뿌려준다
				console.log(data);
				if(data.use > 0){
					alert('이미 사용중인 아이디 입니다.');
					$('input[name="id"]').val('');
				}else{
					alert('사용 가능한 아이디 입니다.');
					overChk = true;
				}
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	}
</script>
</html>