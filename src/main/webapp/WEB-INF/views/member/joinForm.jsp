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
//개인정보 동의 모달창 css
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal_popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

.close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
	background-color: transparent;
	border: none;
	cursor: pointer;
}

.left-align {
	text-align: left;
}

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
	<div class="modal" >
		<div class="modal_popup">
			<h3>모달 팝업 타이틀 입니다!</h3>
			<p>약관 내용입니다</p>
			<button type="button" class="close_btn">닫기</button>
		</div>
	</div>
	<!--end 모달 팝업-->
	
	<h3>UNIFUND 회원가입</h3>
	<hr />
	<form action="join.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>프로필 사진</th>
				<td><input type="file" id="profilePhoto" name="profilePhoto"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mem_id"
					placeholder="프로필 사진을 첨부하세요" /> <input type="button" value="아이디체크"
					onclick="overlay()" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mem_pw"
					placeholder="비밀번호를 입력하세요" /></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="text" id="mem_confirm"
					placeholder="비밀번호를 입력하세요" /><span id="msg"></span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mem_name" placeholder="이름을 입력하세요" /></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="mem_birth"
					placeholder="생년월일을 입력하세요" /></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="mem_number"
					placeholder="연락처를 입력하세요" /> <input type="button" value="인증"
					onclick=showFirstAlert()></td>
			</tr>
			<tr>
				<th>연락처 인증</th>
				<td><input type="text" name="mem_confirm"
					placeholder="인증번호를 확인하세요" /> <input type="button" value="확인"
					onclick=showSecondAlert()></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="mem_gender" value="남" />남자
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="mem_gender"
					value="여" />여자</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="mem_email"
					placeholder="이메일 주소를 입력하세요" /></td>
			</tr>
			<tr>
				<th>은행</th>
				<td><input type="text" name="mem_bankName"
					placeholder="은행명을 입력하세요" /></td>
			</tr>
			<tr>
				<th>은행 계좌번호</th>
				<td><input type="text" name="mem_bank"
					placeholder="계좌번호를 입력하세요" /></td>
			</tr>
			<tr>
				<th>재학증명서</th>
				<td><input type="file" id="mem_cor" name="mem_cor"></td>
			</tr>
			<tr>
				<th>대학교 선택</th>
				<td><input type="text" name="mem_uni" placeholder="대학교를 입력하세요" /></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="mem_post"
					placeholder="우편번호를 입력하세요" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="mem_addr" placeholder="주소를 입력하세요" />
					<br> <input type="text" name="mem_detail"
					placeholder="상세주소를 입력하세요" /></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="mem_consent" class="consent_checkbox" /></td>
				<th><a href="#" class="modal_btn">개인정보 수집 및 이용 동의에 동의합니다</a></th>
			</tr>
			<tr>
				<!-- button 태그에 type="button" 을 넣으면 submit 기능이 사라진다. -->
				<th colspan="2"><button type="button" onclick="join()">회원가입</button></th>
			</tr>

		</table>
	</form>
</body>
<script>

$(document).ready(function(){
    // 모달 팝업 열기
    $(".modal_btn").click(function(){
        $(".modal").fadeIn();
    });

    // 모달 팝업 닫기
    $(".close_btn").click(function(){
        $(".modal").fadeOut();
    });
});

function showFirstAlert() {
    alert("인증번호를 확인 해주세요!");
  }
  
function showSecondAlert() {
    alert("인증번호가 확인되었습니다. ");
  }
  


	var overChk = false;

	$('#confirm').on('keyup',function(){
		if($('input[name="mem_pw"]').val() == $(this).val()){
			$('#msg').html('비밀번호가 일치 합니다.');
			$('#msg').css({'color':'green'});
		}else{
			$('#msg').html('비밀번호가 일치하지 않습니다.');
			$('#msg').css({'color':'red'});
		}
	});
	
	
	
	function join(){
		
		var $id = $('input[name="mem_id"]');
		var $pw = $('input[name="mem_pw"]');
		var $auth = $('input[name="auth"]:checked');
		var $name = $('input[name="mem_name"]');
		var $birth = $('input[name="mem_birth"]');
		var $number = $('input[name="mem_number"]');
		var $confirm = $('input[name="mem_confirm"]');
		var $gender = $('input[name="mem_gender"]:checked');
		var $email = $('input[name="mem_email"]');
		var $bankName = $('input[name="mem_bankName"]');
		var $bank = $('input[name="mem_bank"]');
		var $uni = $('input[name="mem_uni"]');
		var $post = $('input[name="mem_post"]');
		var $addr = $('input[name="mem_addr"]');
		var $detail = $('input[name="mem_detail"]');
				
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
		}else if($birth.val()==''){
			alert('생년월일을 입력 해 주세요!');			
			$birth.focus();
		}else if($number.val()==''){
			alert('연락처를 입력 해 주세요!');			
			$number.focus();
		}else if($confirm.val()==''){
			alert('인증번호를 입력 해 주세요!');			
			$confirm.focus();
		}else if($gender.val()==null){
			alert('성별을 체크해 주세요!');			
			$gender.focus();
		}else if($email.val()==''){
			alert(' 이메일을 입력 해 주세요!');			
			$email.focus();
		}else if($bankName.val()==''){
			alert(' 은행명을 입력 해 주세요!');			
			$email.focus();
		}else if($bank.val()==''){
			alert(' 계좌번호를 입력 해 주세요!');			
			$bank.focus();
		}else if($uni.val()==''){
			alert(' 대학교를 입력 해 주세요!');			
			$uni.focus();
		}else if($post.val()==''){
			alert(' 우편번호 입력 해 주세요!');			
			$post.focus();
		}else if($addr.val()==''){
			alert(' 주소를 입력 해 주세요!');			
			$addr.focus();
		}else if($detail.val()==''){
			alert(' 상세주소를 입력 해 주세요!');			
			$detail.focus();
				
			}else{
			// 데이터 넣기 전에 확인
			var regExp = new RegExp('[a-zA-Zㄱ-ㅎ가-힣]');
			var $birth = $('input[name="mem_birth"]');
			var match = regExp.test($birth.val()); // 생년월일 입력 필드의 값에 대한 정규식 일치 여부 확인
			if(match){
			    alert('숫자만 입력 해 주세요!');
			    $birth.val(''); // 잘못된 값 초기화
			    $birth.focus(); // 생년월일 입력 필드에 포커스 설정
			    return false; // 함수 종료
			}
			console.log('서버로 회원가입 요청');
			$('form').submit();//submit 버튼 역활
			
		}
		
		
	}

	var msg = '${msg}'; // 쿼터 빠지면 넣은 문구가 변수로 인식됨.
	console.log(msg);
	if(msg !=''){
		alert(msg);
		
	}
	
	
	
	function overlay() {
		console.log('click');
		var id = $('input[name="mem_id"]').val();
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
					$('input[name="mem_id"]').val('');
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