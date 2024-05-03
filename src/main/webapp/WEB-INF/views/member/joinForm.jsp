<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/common.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
<!--
개인정보 동의 모달창 css -->#submit, #cancel {
	background-color: #f0f0f0;
	border: none;
	padding: 15px 30px;
	font-size: 16px;
	width: 100px;
	margin-top: 20px;
	width: 210px;
	margin-right: 10px;
	border-radius: 20px;
	box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff;
	transition: all 0.3s ease;
}

#submit:hover, #cancel:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.modal {
	text-align: center;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.box {
	width: 450px;
	height: 280px;
	overflow: auto;
	border: 1px solid gray;
	padding: 0 0.5em;
	background-color: #fcfcfc;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #e6e6e6;
	padding: 1rem 1.5rem;
	width: 500px;
	height: 450px;
	border-radius: 0.5rem;
}

.close-button {
	float: right;
	width: 35px;
	line-height: 0.5rem;
	height: 35px;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
}

.close-button:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}

.left-align {
	text-align: left;
}

*, *:before, *:after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Open Sans', Helvetica, Arial, sans-serif;
	background: #ededed;
}

input, button {
	border: none;
	outline: none;
	background: none;
	font-family: 'Open Sans', Helvetica, Arial, sans-serif;
}

/* Remaining styles from your CSS file */
input[type="text"], input[type="password"], input[type="button"] {
	border: 1px solid #ccc; /* 윤곽선을 회색으로 지정 */
	border-radius: 5px; /* 윤곽선의 모서리를 둥글게 만듦 */
	padding: 10px; /* 입력창 내부 여백 설정 */
	width: 100%; /* 입력창을 가득 채우도록 설정 */
	box-sizing: border-box; /* 입력창의 너비에 padding과 border를 포함하도록 설정 */
}

input[type="submit"]:hover, input[type="button"]:hover {
	background: #2e8b57; /* 마우스 호버 시 버튼 배경색 변경 */
	.
	button-container
	{
	text-align
	:
	right; /* 오른쪽 정렬 */
}

}

/* 버튼 스타일 */
input[type="button"] {
	background: rgb(0, 196, 196); /* 배경색 */
	color: white; /* 글자색 */
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과를 위한 전환 */
}

/* 버튼 호버 효과 */
input[type="button"]:hover {
	background: rgb(0, 156, 156); /* 호버 시 배경색 변경 */
}

/* 파일 첨부 버튼 스타일 */
input[type="file"] {
	background-color: #f0f0f0; /* 배경색 */
	color: #333; /* 글자색 */
	border: 1px solid #ccc; /* 테두리 */
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

/* 인증 버튼 스타일 */
input[type="button"][value="인증"] {
	background-color: #ff9900; /* 배경색 */
	color: white; /* 글자색 */
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과를 위한 전환 */
}

/* 인증 버튼 호버 효과 */
input[type="button"][value="인증"]:hover {
	background-color: #e68a00; /* 호버 시 배경색 변경 */
}

/* 회원가입 버튼 스타일 */
button[type="button"] {
	background-color: #007bff; /* 배경색 */
	color: white; /* 글자색 */
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 호버 효과를 위한 전환 */
}

/* 회원가입 버튼 호버 효과 */
button[type="button"]:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
}

#profileImage {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	display: inline-block;
	margin-left: 200px;
	margin-top: 25px;
	margin-bottom: 20px;
}

form {
	margin-left: 550px;
}

</style>
</head>
<body>


	<!--end 모달 팝업-->

	<h2>▶UNIFUND 회원가입</h2>
	<hr />
	<form action="join.do" method="post" enctype="multipart/form-data">
		<img id="profileImage" src="../resources/images/default_image.png">
		<table>
			<tr>
				<th>프로필 사진</th>
				<td><input type="file" id="profilePhoto" name="profilePhoto"
					accept="image/*" onchange="previewProfilePhoto(event)"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mem_id" placeholder="아이디를 입력해주세요" />
					<input type="button" value="아이디체크" onclick="overlay()" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mem_pw"
					placeholder="비밀번호를 입력하세요" /></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="mem_confirm"
					placeholder="비밀번호를 한번 더 입력하세요" /><span id="msg"></span></td>
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
				<td colspan="2"><input type="checkbox" name="mem_consent"
					class="mem_consent" disabled><a class="agreement">&nbsp(필수)개인정보
						수집 및 이용 동의에 동의합니다</a></td>
				<!--  <input name="mem_consent" type="hidden" value="Y" />-->
			</tr>
			<tr>
				<!-- button 태그에 type="button" 을 넣으면 submit 기능이 사라진다. -->
				<th colspan="2"><button type="button" onclick="join()">회원가입</button></th>
			</tr>

		</table>
	</form>

	<div class="modal">
		<div class="modal-content">
			<span class="close-button"><h2>X</h2></span>
			<h3 class="title">개인정보 수집 및 이용동의</h3>
			<div class="box">
				<p>
					제1조 (목적)<br></br> 본 이용약관은 개인정보 보호 및 이용에 관한 사항을 명확히 하고, 이를 준수함으로써
					이용자의 권익을 보호하는 것을 목적으로 합니다.</br> </br> 제2조 (수집하는 개인정보의 항목 및 이용 목적)</br> 수집하는 개인정보의
					항목: 성명, 생년월일, 주소, 전화번호, 이메일 주소 등 이용 목적: 서비스 제공, 고객 문의 응대, 이벤트 참여 및
					당첨 안내, 서비스 개선 및 제공, 고객 서비스 관리 등</br> </br> 제3조 (개인정보의 보유 및 이용기간) 개인정보의 보유 기간은
					이용자가 서비스를 이용하는 동안 유지되며, 이용목적 달성 시에는 지체 없이 파기됩니다. 법령에 따라 보존할 필요가 있는
					경우 관련 법령의 규정에 따라 보존됩니다.</br> </br> 제4조 (개인정보의 제공) 개인정보는 이용자의 동의 없이 타인에게 제공되지
					않으며, 법령에 의해 요구되는 경우에 한하여 제외됩니다. 외부 업체에 개인정보를 제공할 필요가 있는 경우, 이용자에게
					사전 동의를 얻은 후에 제공됩니다.</br> </br> 제5조 (이용자의 권리) 이용자는 본인의 개인정보에 대해 열람, 정정, 삭제를
					요청할 수 있습니다. 개인정보의 정정 및 삭제를 요청하는 경우, 이에 따른 처리는 신속히 이루어집니다.</br> </br> 제6조
					(개인정보의 안전성 확보 조치) 개인정보의 안전성 확보를 위해 필요한 기술적, 관리적 조치를 취합니다. 개인정보 관련
					취급 직원에 대한 교육을 실시하고 있으며, 개인정보보호를 위한 정기적인 감사를 실시합니다. 위의 내용에 동의합니다.
				</p>
			</div>
			<input type="button" id="submit" value="동의"> <input
				type="button" id="cancel" value="취소">
		</div>
	</div>
</body>
<script>

$(document).ready(function() {
	
    var profileImage = $('#profileImage');
    var defaultImageSrc = "../resources/images/default_image.png";
    
    // 이미지가 로드될 때 이벤트 핸들러 설정
    profileImage.on('load', function() {
        // 이미지가 로드되었을 때 처리할 내용
        profileImage.css('display', 'block');
    }).on('error', function() {
        // 이미지 로드에 실패했을 때 처리할 내용
        console.error("기본 이미지 로드 실패");
    });

    // 기본 이미지를 설정하고, 이미지가 로드될 때 이벤트 핸들러가 호출되도록 함
    profileImage.attr('src', defaultImageSrc);
});


function previewProfilePhoto(event) {
	var input = event.target; //파일 선택(input) 엘리먼트
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#profileImage').attr('src', e.target.result);
            $('#profileImage').css('display', 'block');
        };
        reader.readAsDataURL(input.files[0]);
    }else{
    	 // 파일을 선택하지 않은 경우 기본 이미지로 설정
        $('#profileImage').attr('src', 'resources/images/default_image.png');
        $('#profileImage').css('display', 'block');
  
    }
}






function showFirstAlert() {
    alert("인증번호를 확인 해주세요!");
  }
  

function showSecondAlert() {
	var $confirm = $('input[name="mem_confirm"]');
	if ($confirm.val() === null || $confirm.val() === ' ') {
		alert("인증번호를 입력해 주세요!");
	}else if ($confirm.val() === '0000') {
    	alert("인증번호가 확인되었습니다. ");
	} else {
		alert("인증번호가 일치하지 않습니다. ");
		}
  }
  
  
  

$('#mem_confirm').on('keyup', function(){
    if($('input[name="mem_pw"]').val() == $(this).val()){
        $('#msg').html('비밀번호가 일치 합니다.');
        $('#msg').css({'color':'green'});
    }else{
        $('#msg').html('비밀번호가 일치하지 않습니다.');
        $('#msg').css({'color':'red'});
    }
});
	
	
	
	var overChk;
	
	
	
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
		var $consent = $('input[name="mem_consent"]:checked');
		var $profilePhoto = $('input[name="profilePhoto"]');
		var $cor = $('input[name="mem_cor"]');
		

		var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

		
		
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
		}else if($number.val()=='' || !/^[0-9-]+$/.test($number.val())){
			alert('연락처를 입력 해 주세요! (숫자와 하이픈만 허용됩니다.)');			
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
		}else if($consent.val()== null){
			alert(' 개인정보 수집 및 이용에 동의해주세요!');			
			$consent.focus();
		} else if($cor.val()==''){
	        alert('재학증명서 사진을 첨부해 주세요!'); 
	    $cor.focus(); 
	
	   
	 
			
				
			}else{
			
				var $post = $('input[name="mem_post"]');
			    var postValue = $post.val();
			    
			    // 우편번호가 입력되지 않았을 때
			    if (postValue === '') {
			        alert('우편번호를 입력해 주세요!');
			        $post.focus();
			        return false;
			    }
			    
			    // 입력된 값이 숫자로만 이루어져 있는지 확인
			    if (!/^\d+$/.test(postValue)) {
			        alert('우편번호에는 숫자만 입력해주세요!');
			        $post.val(''); // 입력된 값을 초기화하여 숫자만 입력하도록 유도
			        return false; // 숫자가 아닌 문자가 포함되어 있으므로 회원가입을 중단
			        
			    }
			    
		   
			    
			    
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
	
	var modal = document.querySelector(".modal"); 
	var agreement = document.querySelector(".agreement"); 
	var close = document.querySelector(".close-button"); 
	var cancel = document.querySelector("#cancel");

	function openModal() { 
	    modal.classList.toggle("show-modal"); 
	}

	function onClick(event) { 
	    if (event.target == modal) { 
	    	openModal(); 
	    } 
	}

	agreement.addEventListener("click", openModal); 
	close.addEventListener("click", openModal); 
	cancel.addEventListener("click", openModal); 
	window.addEventListener("click", onClick); 

	$('#submit').on('click',function(){
		$('input[name="mem_consent"]').attr('checked',true);
		openModal();
	});

	$('#cancel').on('click',function(){
		$('input[name="mem_consent"]').attr('checked',false);
		onClick();
	});
	
	
	
	
</script>
</html>