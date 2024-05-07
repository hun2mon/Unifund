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
	border: none;
	border-radius: 11px;
	box-sizing: border-box;
	margin-bottom: 10px;
	font-size: 16px;
	background-color: #eeecec;
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
	border: none;
	border-radius: 11px;
	background-color: #eeecec;
}

.uni_file {
	padding: 10px;
	box-sizing: border-box;
	margin-bottom: 10px;
	font-size: 16px;
	border: none;
	margin-left: 7px;
	position:;
	border-radius: 11px;
	background-color: #eeecec;
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
	margin-top: 44px;
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
	width: 150px;
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
	margin-top: 230px;
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
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:if test="${mem_status == 'M'}">
			<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		</c:if>
			
	<div class="container">

		<c:forEach items="${adminMemberDetail }" var="adminMemberDetail">
			<input type="hidden" value="${adminMemberDetail.mem_idx }" name="mem_idx" />
			<input type="hidden" value="${adminMemberDetail.mng_rsndate }" name="mng_rsndate" class="mng_rsndate"/>
			<input type="hidden" value="${adminMemberDetail.mng_stopdate }" name="mng_getstopdate"  class="mng_getstopdate"/>
			<div class="form-container">
				<div class="top-container">
					<button class="anotherMem_btn" style="cursor: pointer;"
						onclick="location.href='./adminList.go'">뒤로가기</button>
					<span class="detail_title">회원관리</span>
					<input type="hidden" id="admin_id" class="admin_id" value="${sessionScope.mem_id }"/>

					<c:if test="${adminMemberDetail.mem_status != 'S' && adminMemberDetail.mem_status != 'M'}">
						<button
							style="background-color: red; border-radius: 20px; color: white; border: none;"
							class="stop_btn" onclick="openModal()">정지신청</button>
							<div class="modal-container"></div>
					</c:if>
					<c:if test="${adminMemberDetail.mem_status == 'S' }">
						<button class="stopChange_btn" onclick="openModal()">정지변경</button>
						<div class="modal-container"></div>
					</c:if>
					<c:if test="${adminMemberDetail.mem_status == 'M' && adminMemberDetail.mem_status != 'S' }">
					</c:if>
				</div>
				<hr>
				<table style="width: 100%;">
					<tr>
						<th rowspan="4"
							style="font-family: 'Arial', sans-serif; font-size: 32px; color: #919191; text-shadow: 3px 1px 1px rgb(225, 225, 225);">${adminMemberDetail.mem_id}님의
							상세정보</th>
					</tr>
					<tr>
						<td colspan="5" class="status-container" style="width: 170px;">
							<div class="status-label">회원상태:</div>
							<div class="status-value">
								<c:if test="${adminMemberDetail.mem_status == 'M' }">관리자</c:if>
								<c:if test="${adminMemberDetail.mem_status == 'B' }">가입심사중</c:if>
								<c:if test="${adminMemberDetail.mem_status == 'Y' }">활동중</c:if>
								<c:if test="${adminMemberDetail.mem_status == 'N' }">탈퇴</c:if>
								<c:if test="${adminMemberDetail.mem_status == 'S' }"><span style="color:red">정지</span></c:if>
								<c:if test="${adminMemberDetail.mem_status == 'R' }">가입거절</c:if>
							</div>
						</td>
						<td rowspan="2"><c:if
								test="${not empty adminMemberDetail.profile_file}">
								<img class="img" src="/photo/${adminMemberDetail.profile_file}"
									style="width: 200px; height: 200px;">
							</c:if> 
							<c:if test="${empty adminMemberDetail.profile_file}">
								<img class="img" src="../resources/profile_img/no_image.jpg"
									style="width: 200px; height: 200px;">
							</c:if>
					</tr>
					<tr>
						<td colspan="1" class="status-container"
							style="width: 170px; margin-bottom: 138px; margin-top: 0;">
							<div class="status-label">신고횟수:</div>
							<div class="status-value">${adminMemberDetail.ref_idx_cnt}
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1" class="status-container"
							style="width: 170px; margin-top: -139px;">
							<div class="status-label">정지횟수:</div>
							<div class="status-value">
								${adminMemberDetail.stop_mem_idx}</div>
						</td>
					</tr>
					<tr>
						<th style="width: 50%;">아이디</th>
						<th style="width: 50%;">연락처</th>
						<c:if test="${adminMemberDetail.mem_gender == '여'}">
							<th style="text-align: center;"><i style="width: 200px;"
								class="fa-solid fa-venus"></i></th>
						</c:if>
						<c:if test="${adminMemberDetail.mem_gender == '남'}">
							<th style="text-align: center;"><i style="width: 200px;"
								class="fa-solid fa-mars"></i></th>
						</c:if>
					</tr>
					<tr>
						<td><input type="text" name="mem_id" class="mem_id"
							value="${adminMemberDetail.mem_id }" readonly /></td>
						<td><input type="text" name="mem_number" class="mem_number"
							value="${adminMemberDetail.mem_number }" readonly /></td>
						<th class="align"><a href="../mypage/profile.go?userIdx=${adminMemberDetail.mem_idx}">
						<i class="fa-solid fa-pen-nib"></i>회원프로젝트 보러가기</a></th>
					</tr>
					<tr>
						<th>이름</th>
						<th>대학교</th>
						<th class="align"><a href="../mypage/introUpdate.go?userIdx=${adminMemberDetail.mem_idx}">
						<i class="fa-solid fa-pen-nib"></i>회원자기소개서수정</a></th>
					</tr>
					<tr>
						<td><input type="text" name="mem_name" class="mem_name"
							value="${adminMemberDetail.mem_name }" readonly /></td>
						<td><input type="text" name="mem_uni" class="mem_uni"
							value="${adminMemberDetail.mem_uni }" readonly /></td>
					</tr>
					<tr>
					<tr>
						<th>생년월일</th>
						<th>은행 / 계좌번호</th>
					</tr>
					<tr>
						<td><input type="text" name="mem_birth" class="mem_birth"
							value="${adminMemberDetail.mem_birth }" readonly /></td>
						<td><input type="text" style="width: 26%;"
							name="mem_bankName" class="mem_bankname"
							value="${adminMemberDetail.mem_bankName }" readonly /> <input
							type="text" style="width: 72%;" name="mem_bank" class="mem_bank"
							value="${adminMemberDetail.mem_bank }" readonly /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<th>우편번호</th>
					</tr>
					<tr>
						<td><input type="text" name="mem_email" class="mem_email"
							value="${adminMemberDetail.mem_email }" readonly /></td>
						<td><input type="text" name="mem_post" class="mem_post"
							value="${adminMemberDetail.mem_post }" readonly /></td>
					</tr>
					<tr>
						<th>재학증명서</th>
						<th>주소</th>
					</tr>
					<tr>
						<td><input class="file_input file1"
							value="${adminMemberDetail.uni_file }" readonly="readonly"></td>
						<td><input type="text" name="mem_addr" class="mem_addr"
							value="${adminMemberDetail.mem_addr }" readonly /></br> <input
							type="text" name="mem_detail" class="mem_detail"
							value="${adminMemberDetail.mem_detail }" readonly /></td>
					</tr>
					<tr>
						<th>주분야</th>
						<th>비밀번호</th>
					</tr>
					<tr>
						<td><input type="text" name="self_exp" class="self_exp"
							value="${adminMemberDetail.self_exp }" readonly /></td>
						<td><input type="text" name="mem_pw" class="mem_pw"
							value="${adminMemberDetail.mem_pw }" readonly /></td>
					</tr>
					<tr>
						<th colspan="2">자기소개</th>
					</tr>
					<tr>
						<td colspan="2"><textarea name="pro_content"
								class="pro_content" rows="30" cols="50">${adminMemberDetail.self_introduce }</textarea></td>
					</tr>
					<tr>
						<th colspan="2">활동사진</th>
					</tr>
					<tr>
						<td style="text-align: center;">
							<div id="photoList"></div>
							<div class="pgcontainer">
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination_pho"></ul>
								</nav>
							</div>
						</td>
						<td></td>
						<td>
						<button class="update_btn" onclick="location.href='./adminMemberUpdate.go?mem_idx=${adminMemberDetail.mem_idx}'">수정하기</button>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<input type="hidden" id="searchIn" value="" />
	<input type="hidden" id="searchType" value="M" />
</body>
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script>
var showPage = 1;

$(document).ready(function(){
	memActPhoList(showPage);
 });
 
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
            content += '<td><img src="/photo/'+ item.pho_name + '" style="width: 300px; height: 300px;"></td>';
            //content += '<td><button>삭제</button></td>'
            content += '</tr>';
        }   
    } 
    $('#photoList').html(content);
	
 }
 
function openModal(btn) {
	var memId = $('.mem_id').val();
	var adminId = $('.admin_id').val();
	
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	
	var rsndate = $('.mng_rsndate').val();
	var stopdate = $('.mng_getstopdate').val();
	
	console.log("rsndate",rsndate);
	var stop = '${mng_stopdate}';
	console.log("stop->",stop);
	
	console.log("눌리니? ");
	    var modal = '';
	    modal += '<div class="modal">';
	    modal += '<div class="modal-content">';
	    modal += '<span class="close-button"><h2>X</h2></span>';
	    
	    if (btn === 'stopRequest') {
	        modal += '<h3 class="title">'+memId+'님 정지신청</h3>';
	        modal += '<table style="text-align:center;">';
		    modal += '<tr>';
		    modal += '<th>관리자ID</th>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<td><input type="text" value="'+ adminId +'" readonly/></td>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<th>정지시작일</th>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<td><input type="text" class="mng_rsndate" name="mng_rsndate" value="'+dateString+'"/></td>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<th>정지사유</th>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<td><textarea name="mng_rsn" class="mng_rsn" rows="10" cols="20" placeholder="정지사유를 입력해 주세요."></textarea></td>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<th>정지신청일수</th>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<td>';
		    modal += '<select class="stopDay" name="msg_stopdate" id="stopDay">';
		    modal += '<option value="1">1일</option>';
		    modal += '<option value="7">7일</option>';
		    modal += '<option value="14">14일</option>';
		    modal += '<option value="30">30일</option>';
		    modal += '<option value="90">90일</option>';
		    modal += '<option value="9999999">영구정지</option>';
		    modal += '</select>';
		    modal += '</td>';
		    modal += '</tr>';
		    modal += '</table>';
		    modal += '<input type="button" id="cancel" class="cancel" value="취소"> ';
		    modal += '<input type="button" id="ok" class="ok" value="동의"> ';
	    } else if (btn === 'stopChange') {
	        modal += '<h3 class="title">'+memId+'님 정지변경</h3>';
	        modal += '<table style="text-align:center;">';
	        modal += '<tr>';
		    modal += '<th>정지시작일</th>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<td><input type="text" class="mng_rsndate" name="mng_rsndate" value="'+ rsndate +'" readonly/></td>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<th>정지일수</th>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<td><input type="text" class="stopd" name="stopd" value="'+stop+'" readonly/></td>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<th>정지일수 변경</th>';
		    modal += '</tr>';
		    modal += '<tr>';
		    modal += '<td>';
		    modal += '<select class="changeStop" name="changeStop" id="changeStop">';
		    modal += '<option value="0">정지해제</option>';
		    modal += '<option value="1">1일</option>';
		    modal += '<option value="7">7일</option>';
		    modal += '<option value="14">14일</option>';
		    modal += '<option value="30">30일</option>';
		    modal += '<option value="90">90일</option>';
		    modal += '<option value="9999999">영구정지</option>';
		    modal += '</select>';
		    modal += '</td>';
		    modal += '</tr>';
		    modal += '</table>';
	        modal += '<input type="button" id="cancel" class="cancel" value="취소"> ';
		    modal += '<input type="button" id="change" class="ok" value="변경"> ';
	    }
	    modal += '</div> ';
	    modal += '</div>';

	    var modalElement = $(modal); 
	    $('body').append(modalElement); 
	    modalElement.addClass("show-modal");
	    
	    $(document).on('click', '#change', function() {
	    	console.log("들어오니");
	    	var mem_idx = '${memIdx}';
	    	var stopd = $('.stopd').val();
	    	var changeStop = $('.changeStop').val();
	    	var admin_idx = '${sessionScope.mem_idx}';
	    	
	    	console.log("mem_idx->",mem_idx);
	    	console.log("stopd->",stopd);
	    	console.log("changeStop->",changeStop);
	    	console.log("admin_idx->",admin_idx);

	    	$.ajax({
	    		type:'get',
	    		url:'./stopMemberChange.ajax',
	    		data:{
	    			mng_stopdate: changeStop,
	    			mem_idx: mem_idx,
	    			admin_idx: admin_idx
	    		},
	    		success:function(data){
	    			if(data.stopMemberChange){
	    				closeModal();
	    				location.reload();
	    				
	    			}else if(data.deleteMemberChange){
	    				closeModal();
	    				location.reload();
	    			}
	    		},
	    		 error:function(error){
	    	           console.log(error);
	    		}
	    	});
	    	
	    });
	}

function closeModal() {
    $('.modal').removeClass("show-modal");
}

$(document).on('click', '.stop_btn', function() {
    openModal('stopRequest');
});

$(document).on('click', '.stopChange_btn', function() {
    openModal('stopChange');
});

$(document).on('click', '.close-button', function() {
    closeModal();
});

$(document).on('click', '#cancel', function() {
    closeModal();
});

$(document).on('click', '#ok', function() {
	var mem_idx = '${memIdx}';
	var stopday = $('.stopDay').val();
	var reason = $('.mng_rsn').val();
	var today = $('.mng_rsndate').val();
	var admin_idx = '${sessionScope.mem_idx}';
	
	console.log("mem_idx->",mem_idx);
	console.log("stopday->",stopday);
	console.log("reason->",reason);
	console.log("today->",today);
	console.log("admin_idx->",admin_idx);
	
	$.ajax({
		type:'get',
		url:'./stopMemberApply.ajax',
		data:{
			mng_rsndate: today,
			mng_stopdate: stopday,
			mng_rsn: reason,
			mem_idx: mem_idx,
			admin_idx: admin_idx
		},
		success:function(data){
			if(data.stopMemberApply){
				closeModal();
				location.reload();
				
			}
			
		},
		 error:function(error){
	           console.log(error);
		}
	});
	
});

</script>
</html>