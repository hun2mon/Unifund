<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/layout.css"/>" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

<style>
.w3-bar {
	overflow: visible !important;
	min-width: 1170px;
}

.w3-right{
	position: relative;
}

#noticeBtn {
	position: absolute;
    top: 5px;
    left: 5px;
    width: 50px;
    height: 50px;
}

.noticeBox {
	display: none;
	position: absolute;
	top: 70px;
	left: -200px;
	width: 320px;
	height: 500px;
 	background: ghostwhite;
    overflow-y: auto;
    box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
}

.noticeBox.on {
	display: block;
}

.notiTop{
    font-size: 20px;
    display: flex;
    width: 300px;
}
.noticeMain{
    display: inline-table;
    margin-top: 15px;
    height: 50px;
    width: 300px;
}
.notiDate{
    font-size: 14px;
    color: black;
    margin-left: 10px;
    text-align: right;
}
.closeBtn{
    width: 15px;
    color: black;
}
.fa-solid:hover{
    box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
    cursor: pointer;
}
.notiContent{
    width: 270px;
    color: black;
    margin-left: 10px;
}

.line{
	margin-top: 10px;
}

.emptyNoti{
    width: 320px;
    height: 500px;
}
</style>

<div class="w3-top">

	<div class="w3-bar w3-black w3-card">
	
		<a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> 
		<a class="w3-bar-item w3-button w3-padding-large w3-hover-black" href="/main"><b>UNIFUND</b></a>
		<div class="w3-dropdown-hover w3-hide-small">
			<button class="w3-padding-large w3-button w3-hover-purple"
				title="More"
				onclick="javascript:location.href='/main/project/list.go'">
				프로젝트<i class="fa fa-caret-down"></i>
			</button>
			<div class="w3-dropdown-content w3-bar-block w3-card-4">
				<a href="/main/project/list.go?category=1" class="w3-bar-item w3-button w3-hover-purple">전시회</a>
				<a href="/main/project/list.go?category=2" class="w3-bar-item w3-button w3-hover-purple">공연</a>
				<a href="/main/project/list.go?category=3" class="w3-bar-item w3-button w3-hover-purple">축제</a> 
				<a href="/main/project/list.go?category=4" class="w3-bar-item w3-button w3-hover-purple">창작물</a>
				<a href="/main/project/list.go?category=5" class="w3-bar-item w3-button w3-hover-purple">기타</a>
			</div>
		</div>
		<a href="/main/crew/list.go"
			class="w3-bar-item w3-button w3-padding-large w3-hover-purple">크루
		</a> <a href="/main/announcement/list.go"
			class="w3-bar-item w3-button w3-padding-large w3-hover-purple">공지사항
		</a> 
		<a href="/main/qna/list.go"class="w3-bar-item w3-button w3-padding-large w3-hover-purple">Q&A</a>
		<a href="/main/mypage/profile.go?userIdx=${sessionScope.mem_idx}"class="w3-padding-large w3-hover-purple w3-hide-small w3-right"><i class="fa fa-user"></i></a> 
		<a href="javascript:void(0)" class="w3-padding-large w3-hover-purple w3-hide-small w3-right"> <i class="fa fa-bell"></i>
		<span id="noticeBtn"></span>
		<span class="noticeBox">
		</span>
		</a> 
		<c:if test="${mem_id == null }">
			<a href="/main/member/login.go" class="w3-padding-large w3-hover-purple w3-hide-small w3-right">
				<i class="fa-solid fa-right-to-bracket"></i>
			</a>		
		</c:if>
		<c:if test="${mem_id != null }">
			<a href="/main/member/logout.do" class="w3-padding-large w3-hover-purple w3-hide-small w3-right">
				<i class="fa-solid fa-right-from-bracket"></i>
			</a>		
		</c:if>
	</div>
	
</div>

<script>
	listNotiCall();
	
	$('#noticeBtn').on('click', function() {
		$('.noticeBox').toggleClass('on');
	});
	
	function blindNoti(idx) {
		$.ajax({
			type : 'post',
			url : '/main/blindNoti.ajax',
			data : {
				noti_idx:idx
			},
			dataType : 'json',
			success : function(data) {
				if (data.row > 0) {
					listNotiCall();	
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	function listNotiCall(){
		console.log('asdf');
		$.ajax({
			type : 'post',
			url : '/main/mainNotiList.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				drawNoti(data.list);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	function drawNoti(list){
		content = '';
		console.log("noti : " + list);
		if (list != '') {
			$('.fa-bell').css("color", "red");
			for(noti of list){
				content += '<div class="noticeMain">';
				content += '<div class="notiTop">';
				content += '<div class="notiContent">' +  noti.noti_content + '</div>';
				content += '<div class="closeBtn" onclick="blindNoti(' + noti.noti_idx+')"><i class="fa-solid fa-x"></i></div>';
				content += '</div>';
				content += '<br/>';
				content += '<div class="notiDate">2024.04.20</div>';
				content += '<hr class="line">';
				content += '</div>';
			}			
		} else {
			content = '<img src="/photo/emptyNoti.jpg" class = emptyNoti>';
			$('.fa-bell').css("color", "white");
		}
		$('.noticeBox').html(content);
	}
</script>




