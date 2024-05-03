<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<html>
<head>
<meta charset="UTF-8">
<title>:: UNIFUND 회원가입심사::</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f2f2f2;
}

input[type="text"], textarea, input[type="date"], select, option {
	width: 100%;
	padding: 10px;
	border: 1px solid lightgray;
	border-radius: 11px;
	box-sizing: border-box;
	margin-bottom: 10px;
	font-size: 16px;
}

.container {
	max-width: 1200px;
	margin: 50px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	/*box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
}

.top-container {
	height: 102px;
}

.form-container {
	background: #fefefe;
	box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.1), -10px -10px 20px
		rgba(255, 255, 255, 0.8);
	border-radius: 20px;
	padding: 40px;
}

.file_input {
	width: 100%;
	position: relative;
	padding: 10px;
	box-sizing: border-box;
	margin-bottom: 10px;
	font-size: 16px;
	background-color:lightgray;
	border: 1px solid lightgray;
	border-radius: 11px;
}

.uni_file {
	padding: 10px;
	box-sizing: border-box;
	margin-bottom: 10px;
	font-size: 16px;
	margin-left: 7px;
	border: 1px solid lightgray;
	border-radius: 11px;
}

.pro_photo, .pro_main_photo {
	width: 90px;
	position: absolute;
	padding:10px;
	border:1px solid #ccc;
	border-radius: 5px;
	box-sizing:border-box;
	margin-bottom: 10px;
	font-size: 16px;
}

input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	border: 0;
}

.table_margin {
	margin-left: 50px;
}

textarea {
	resize: none;
}

.btn_td {
	text-align: center;
}

.btn_submit, .btn_cancel {
	margin-top: 30px;
	background-color: #fdfdfd;
	border: none;
	width: 200px;
	margin-right: 30px;
	padding: 15px 30px;
	font-size: 16px;
	border-radius: 20px;
	box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff;
	transition: all 0.3s ease;
}

.btn_submit:hover, .btn_cancel:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

#submit, #cancel {
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

.anotherMem_btn {
	width: 130px;
	height: 42px;
	margin-top: -23px;
	margin-right: 26px;
	border-radius: 20px;
	border: none;
}

.detail_title {
	font-size: 40px;
	margin-top: 24px;
	position: absolute;
	margin-left: -150px;
}

.stop_btn {
	background-color: red;
	border-radius: 20px;
	height: 45px;
	color: white;
	border: none;
	width: 130px;
	margin-top: 31px;
	margin-left: auto; 
	display: block; 
	margin-right: 20px; 
}

.stopChange_btn{
background-color: #5f9693;
	border-radius: 20px;
	height: 45px;
	color: white;
	border: none;
	width: 130px;
	margin-top: 31px;
	margin-left: auto;
	display: block;
	margin-right: 20px;
	
}

.update_btn {
    background-color: #f5ca70;
    color: white;
	border-radius: 20px;
	height: 45px;
	border: none;
	width: 130px;
	margin-top: 31px;
	margin-left: auto;
	display: block;
	margin-right: 20px;
	font-weight: bold;
	font-size: 17px;
}

.update_btn:hover {
	background-color:#ffc13f;

}

.status-container {
	margin-top: 30px;
	color: #817d7d;
	border: 1px solid white;
	background-color: #f2f2f2;
	display: flex;
	margin-left: 50px;
	width: 170px;
}

.status-label {
	margin-left: 27px;
	margin-left: 2px;
	width: 120px;
}

.status-value {
	margin-left: 2px;
	flex-grow: 1;
	width: 119px;
}

/* Adjustments for the whole table */
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: none;
	padding: 10px;
	vertical-align: middle;
	color: #858686;
	text-align: left;
}

/* Optional: Simplify border-radius and box-shadow */
.btn_submit, .btn_cancel, .stop_btn, .anotherMem_btn {
	border-radius: 20px;
}

.btn_submit:hover, .btn_cancel:hover, .stop_btn:hover, .anotherMem_btn:hover
	{
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.img {
	border-radius: 110px;
}

.pgcontainer {
	width: 100%;
	text-align: center; /* 컨테이너 안의 내용을 가운데 정렬합니다. */
}

.page-link {
	border-radius: 23px;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	z-index: 3;
	color: #fff;
	cursor: default;
	background-color: #333333;
	border-color: #000000;
}

.pagination>li>a, .pagination>li>span {
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #000000;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #ddd;
}

th.align {
	text-align: center;
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
	display:block;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #e6e6e6;
	padding: 1rem 1.5rem;
	width: 500px;
	height: 755px;
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

#cancel, #ok, #change {
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

#cancel:hover, #ok:hover, #change:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.delete_btn{
	border-radius: 20px;
    border: none;
    padding: 13px;
    color: #989898;
    background-color: white;
    box-shadow: 1px 1px 7px #a2a2a2;
    cursor: pointer;
}

.delete_btn:hover{
	background-color: lightgray;
    box-shadow: inset 0px -3px 7px #a2a2a;
}

.fileAct{
border-radius: 20px;
    border: none;
    padding: 13px;
    color: #989898;
    background-color: white;
    box-shadow: 1px 1px 7px #a2a2a2;
    cursor: pointer;
    margin-top: 3px;
}

.mem_id{
background-color:lightgray;
}

.filef{
background-color:pink;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:if test="${mem_status == 'M'}">
			<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		</c:if>
			
	<div class="container">
	<form action="adminMemberUpdate.do" method="post">
		<c:forEach items="${adminMemberUpdate }" var="adminMemberUpdate">
			<input type="hidden" value="${adminMemberUpdate.mem_idx }" name="mem_idx" />
			<input type="hidden" value="${adminMemberUpdate.mng_rsndate }" name="mng_rsndate" class="mng_rsndate"/>
			<input type="hidden" value="${adminMemberUpdate.mng_stopdate }" name="mng_getstopdate"  class="mng_getstopdate"/>
			<div class="form-container">
				<div class="top-container">
					<button class="anotherMem_btn" style="cursor: pointer;"
						onclick="history.back()">뒤로가기</button>
					<span class="detail_title">회원관리</span>
					<input type="hidden" id="admin_id" class="admin_id" value="${sessionScope.mem_id }"/>
				</div>
				<hr>
				<table style="width: 100%;">
					<tr>
						<th rowspan="4"
							style="font-family: 'Arial', sans-serif; font-size: 32px; color: #919191; text-shadow: 3px 1px 1px rgb(225, 225, 225);">${adminMemberUpdate.mem_id}님의
							정보수정</th>
					</tr>
					<tr>
						<td colspan="5" class="status-container" style="width: 170px;">
							<div class="status-label">회원상태:</div>
							<div class="status-value">
								<c:if test="${adminMemberUpdate.mem_status == 'M' }">관리자</c:if>
								<c:if test="${adminMemberUpdate.mem_status == 'B' }">가입심사중</c:if>
								<c:if test="${adminMemberUpdate.mem_status == 'Y' }">활동중</c:if>
								<c:if test="${adminMemberUpdate.mem_status == 'N' }">탈퇴</c:if>
								<c:if test="${adminMemberUpdate.mem_status == 'S' }"><span style="color:red">정지</span></c:if>
								<c:if test="${adminMemberUpdate.mem_status == 'R' }">가입거절</c:if>
							</div>
						</td>
						<td rowspan="2"><c:if
								test="${not empty adminMemberUpdate.profile_file}">
								<img class="img" src="/photo/${adminMemberUpdate.profile_file}"
									style="width: 200px; height: 200px;">
							</c:if> 
							<c:if test="${empty adminMemberUpdate.profile_file}">
								<img class="img" src="../resources/profile_img/no_image.jpg"
									style="width: 200px; height: 200px;">
							</c:if>
					</tr>
					<tr>
						<td colspan="1" class="status-container"
							style="width: 170px; margin-bottom: 138px; margin-top: 0;">
							<div class="status-label">신고횟수:</div>
							<div class="status-value">${adminMemberUpdate.ref_idx_cnt}
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1" class="status-container"
							style="width: 170px; margin-top: -139px;">
							<div class="status-label">정지횟수:</div>
							<div class="status-value">
								${adminMemberUpdate.stop_mem_idx}</div>
						</td>
					</tr>
					<tr>
						<th style="width: 50%;">아이디</th>
						<th style="width: 50%;">연락처</th>
					</tr>
					<tr>
						<td><input type="text" name="mem_id" class="mem_id"
							value="${adminMemberUpdate.mem_id }" readonly/></td>
						<td><input type="text" name="mem_number" class="mem_number"
							value="${adminMemberUpdate.mem_number }"   /></td>
					</tr>
					<tr>
						<th>이름</th>
						<th>대학교</th>
					</tr>
					<tr>
						<td><input type="text" name="mem_name" class="mem_name"
							value="${adminMemberUpdate.mem_name }"   /></td>
						<td><input type="text" name="mem_uni" class="mem_uni"
							value="${adminMemberUpdate.mem_uni }"   /></td>
					</tr>
					<tr>
					<tr>
						<th>생년월일</th>
						<th>은행 / 계좌번호</th>
					</tr>
					<tr>
						<td><input type="text" name="mem_birth" class="mem_birth"
							value="${adminMemberUpdate.mem_birth }"   /></td>
						<td><input type="text" style="width: 26%;"
							name="mem_bankName" class="mem_bankname"
							value="${adminMemberUpdate.mem_bankName }"   /> <input
							type="text" style="width: 72%;" name="mem_bank" class="mem_bank"
							value="${adminMemberUpdate.mem_bank }"   /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<th>우편번호</th>
					</tr>
					<tr>
						<td><input type="text" name="mem_email" class="mem_email"
							value="${adminMemberUpdate.mem_email }"   /></td>
						<td><input type="text" name="mem_post" class="mem_post"
							value="${adminMemberUpdate.mem_post }"   /></td>
					</tr>
					<tr>
						<th>재학증명서</th>
						<th>주소</th>
					</tr>
					<tr>
						<td><input class="file_input file1"
							value="${adminMemberUpdate.uni_file }" readonly></td>
						<td><input type="text" name="mem_addr" class="mem_addr"
							value="${adminMemberUpdate.mem_addr }" /></br> <input
							type="text" name="mem_detail" class="mem_detail"
							value="${adminMemberUpdate.mem_detail }"   /></td>
					</tr>
					<tr>
						<th>주분야</th>
						<th>비밀번호</th>
					</tr>
					<tr>
						<td><input type="text" name="self_exp" class="self_exp"
							value="${adminMemberUpdate.self_exp }"   /></td>
						<td><input type="text" name="mem_pw" class="mem_pw"
							value="${adminMemberUpdate.mem_pw }"   /></td>
					</tr>
					<tr>
						<th colspan="2">자기소개</th>
					</tr>
					<tr>
						<td colspan="2"><textarea name="self_introduce"
								class="self_introduce" rows="30" cols="50">${adminMemberUpdate.self_introduce }</textarea></td>
					</tr>
					<tr>
						<th colspan="2">활동사진 (**활동사진은 삭제만 가능합니다.)</th>
					</tr>
					<tr>
						<td id="photoTd" style="text-align: center;">
							<div id="photoList"></div>
							<div class="pgcontainer">
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination_pho"></ul>
								</nav>
							</div>
						</td>
					</tr>
				</table>
				<input type="button" class="update_btn" onclick="check()" value="수정하기"/>
			</div>
		</c:forEach>
		</form>
	</div>
	<input type="hidden" id="searchIn" value="" />
	<input type="hidden" id="searchType" value="M" />
</body>
<script>
var showPage = 1;

$(document).ready(function(){
	memActPhoList(showPage);
 });
 
 
 
function check(){
	var $number = $('input[name="mem_number"]');
	var $name = $('input[name="mem_name"]');
	var $uni = $('input[name="mem_uni"]');
	var $birth = $('input[name="mem_birth"]');
	var $bankName = $('input[name="mem_bankName"]');
	var $bank = $('input[name="mem_bank"]');
	var $email = $('input[name="mem_email"]')
	var $post = $('input[name="mem_post"]');
	var $addr = $('input[name="mem_addr"]');
	var $detail = $('input[name="mem_detail"]');
	var $pw = $('input[name="mem_pw"]');
	
	// 전화번호 유효성 검사를 위한 정규표현식
    var phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
 	// 은행명에는 숫자가 들어가지 않도록 하기 위한 정규표현식
    var bankNameRegex = /^[^0-9]*$/;
    // 계좌번호 유효성 검사를 위한 정규표현식
    var accountNumRegex = /^[\d-]+$/;
 	// 이메일 유효성 검사를 위한 정규표현식
    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    
    if ($number.val() == '') {
        alert('연락처를 입력해 주세요!');
        $number.focus();
    } else if (!phoneRegex.test($number.val())) {
        alert('올바른 전화번호 형식이 아닙니다! (예: 010-1234-5678)');
        $number.focus();
    } else if ($name.val() == '') {
    	 alert('이름을 입력해 주세요!');
         $name.focus();
    }else if($uni.val()==''){
    	alert(' 대학교를 입력해 주세요!');			
    	$uni.focus();
    }else if($birth.val()==''){
    	alert('생년월일을 입력해 주세요!');			
    	$birth.focus();
    }else if($bankName.val() == ''){
    	 alert('사용하실 은행명을 입력해 주세요!');
         $bankName.focus();
    }else if (!bankNameRegex.test($bankName.val())) {
        alert('은행명에는 숫자를 입력할 수 없습니다!');
        $bankName.focus();
    } else if ($bank.val() == '') {
        alert('계좌번호를 입력해 주세요!');    
        $bank.focus();
    } else if (!accountNumRegex.test($bank.val())) {
        alert('올바른 계좌번호 형식이 아닙니다! (숫자와 하이픈(-)만 입력 가능)');
        $bank.focus();
    } else if ($email.val() == '') {
        alert('이메일 입력해 주세요!');
        $email.focus();    
    } else if (!emailRegex.test($email.val())) {
        alert('올바른 이메일 형식이 아닙니다!');
        $email.focus();
    } else if ($post.val() == '') {
        alert('우편번호 입력해 주세요!');
        $post.focus();
    } else if ($addr.val() == '') {
        alert('주소를 입력해 주세요!');
        $addr.focus();
    } else if ($detail.val() == '') {
        alert('상세주소를 입력해 주세요!');
        $detail.focus();
    } else if($pw.val() == ''){
    	alert('초기화할 비밀번호를 입력해 주세요!');
        $detail.focus();
    }else{
    	 $('form').submit();
    }
    
}
	
 
function memActPhoList(page){
	var mem_idx = '${memIdx}';
	console.log(mem_idx);
	$.ajax({
		type:'get',
		url:'./memActPhoList.ajax',
		data:{
			'page':showPage,
			'cnt':1,
			'mem_idx':mem_idx
		},
		dataType:'json',
		success:function(data){
			console.log(data.list);
			drawPhoList(data.list);
			
			$('#pagination_pho').twbsPagination({
			    startPage:1, // 시작페이지
			    totalPages:data.totalPages, // 총 페이지 갯수
			    visiblePages:5, // 보여줄 페이지 수[1][2][3][4][5]
			    onPageClick:function(evt, pg){
			       console.log(evt);//이벤트 객체
			       console.log(pg);//클릭한 페이지 번호
			       showPage = pg;
			       memActPhoList(pg);
			    }               
			});           
		
       },
       error:function(error){
           console.log(error);
		}
		
	});
}

function drawPhoList(list) {
    var content = '';
    if (list.length === 0) {
        content += '<tr>';
        content += '<td><img src="../resources/profile_img/no_image.jpg" style="width: 300px; height: 300px;"></td>';
        content += '</tr>';  
    } else {
        for (item of list) {
            content += '<tr>';
            content += '<td><img src="/photo/'+ item.pho_name + '" style="margin-left: 50px; width: 300px; height: 300px;"></td>';
        	content += '<td><span class="delete_btn" data-file="'+ item.pho_name +'" data-type="file"><i class="fa-solid fa-trash-can"></i></span><td>';
        	content += '</tr>';
        }   
    } 
    $('#photoList').html(content);
	
 }
 
$('#photoList').on('click', '.delete_btn', function(e){
    var target = $(this).data("file");
    var mem_idx = '${memIdx}';
    var page = showPage;
    if(confirm("해당사진을 정말로 지우시겠습니까 ? 사진은 즉시 삭제됩니다.")){
        
       	$.ajax({
       		type:'get',
       		url:'./deletePhotoAct.ajax',
       		data:{
       			pho_name:target,
       			mem_idx:mem_idx,
       		},
       		success:function(data){
       		 	$('#pagination_pho').twbsPagination('destroy');
       			 memActPhoList(page);
       		},
	        error: function(error) {
	            console.log(error);
	        }
       	});
        
    }
});

$('#photoList').on('click', '#addPhotoBtn', function(e){
    $('#fileInput').click(); 
});

$('#fileInput').change(function() {
    var formData = new FormData();
    formData.append('photo', $(this)[0].files[0]); 
    
    $.ajax({
        type: 'POST',
        url: './addPhoAct.ajax',
        data: formData,
        processData: false, 
        contentType: false,
        success: function(data) {
           
            memActPhoList(showPage);
            
        },
        error: function(error) {
        	 console.log(error);
        }
    });
});

</script>
</html>