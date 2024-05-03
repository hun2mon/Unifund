<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

.main {
	min-width: 1400px;
}

.mainImg {
	width: 100%;
	height: 200px;
	line-height: 200px;
	background-color: lightgray;
	font-size: 50px;
	text-align: center;
}

.middle, .bottom {
	width: 1400px;
	height: 460px;
	margin: 0 auto;
	margin-top: 50px;
}

.middleTitle, .bottomTitle {
	height: 50px;
	font-size: 40px;
}

.middleContent, .bottomContent {
	display: flex;
	height: 400px;
}

.content {
	width: 330px;
	height: 380px;
	margin: 0 auto;
	margin-top: 7px;
	background-color: whitesmoke;
	border-radius: 20px;
}

.content:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.proImg, .crewImg {
	width: 300px;
	height: 220px;
	margin: 0 auto;
	margin-top: 10px;
	border-radius: 20px;
}

.proInfo {
	border-radius: 20px;
	width: 300px;
	height: 140px;
	margin: 0 auto;
}

.img {
	width: 280px;
	height: 220px;
	margin-left: 11px;
	border-radius: 20px;
	object-fit: cover;
}

.crewImg {
	width: 280px;
	height: 220px;
	margin-left: 11px;
	border-radius: 20px;
	object-fit: contain;
}

.info {
	margin-left: 9px;
	margin-top: 11px;
	width: 280px;
}

.detail, .price, .crewName {
	display: flex;
}

.infoBottom {
	margin: 0 auto;
}

.deadLine {
	border-radius: 20px;
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.15);
	width: 100px;
	text-align: center;
}

.likeCnt, .popCnt {
	border-radius: 20px;
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.15);
	width: 30px;
	text-align: center;
}

.memId {
	border-radius: 20px;
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
	background-color: rgba(255, 255, 255, 0.15);
	width: 120px;
	text-align: center;
}

.progress {
	font-size: 20px;
	color: dodgerblue;
}

.oriPrice {
	text-decoration: line-through;
}

.name {
	font-size: 25px;
	font-weight: 600;
}

.popCnt {
	margin: 0;
	margin-left: 10px;
}

.crewImg {
	margin-top: 20px;
}

.crewName {
	margin-top: 30px;
}

.category {
	line-height: 3;
}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<c:if test="${mem_status == 'M'}">
			<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		</c:if>
	</header>
	<div class="main">
		<div class="mainImg">UNIFUND에 오신걸 환영합니다.</div>
		<div class="middle">
			<div class="middleTitle">프로젝트 TOP4</div>
			<hr>
			<div class="middleContent">
			</div>
		</div>
		<div class="bottom">
			<div class="bottomTitle">크루 TOP4</div>
			<hr>
			<div class="bottomContent">
			</div>
		</div>
	</div>
</body>
<script>
	listCall();
	function listCall() {
		$.ajax({
			type : 'get',
			url : '/main/mainProList.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				drawProject(data.list);
			},
			error : function(error) {
				console.log(error);
			}
		});
		
		$.ajax({
			type : 'get',
			url : '/main/mainCrewList.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				drawCrew(data.list);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	function drawProject(list) {
		var content = '';
		for(pro of list){
			content += '<div class="content" onClick="detailGo(' + pro.pro_idx +',1)">';
			content += '<div class="proImg">';
			content += '<img src="/photo/' + pro.pro_img_name + '" class="img">';
			content += '</div>';
			content += '<div class="proInfo">';
			if (pro.progress == null) {
				content += '<div class="info progress">0% 진행중</div>';
			} else {
				content += '<div class="info progress">' + pro.progress + '% 진행중</div>';				
			}
			content += '<div class="info title">[' + pro.category + ']'  + pro.pro_title + '</div>';
			content += '<div class="info price">';
			content += '<p class="oriPrice">' + pro.ori_price + '</p>>>' + pro.rew_price + '  ' + Math.round((((pro.ori_price - pro.rew_price)/pro.ori_price)*100))  + '%';
			content += '</div>';
			content += '<div class="info detail">';
			var date = new Date(pro.pro_deadline);
			var dateStr = date.toLocaleDateString("ko-KR");
			content += '<div class="infoBottom deadLine">' + dateStr + '</div>';
			content += '<div class="infoBottom likeCnt">' + pro.like_cnt + '</div>';
			content += '<div class="infoBottom memId">' + pro.mem_id + '</div>';
			content += '</div>';
			content += '</div>';
			content += '</div>';
		}
		$('.middleContent').html(content);
	}
	
	function drawCrew(list){
		var content = '';
		for(crew of list){
			content += '<div class="content" onClick="detailGo(' + crew.crew_idx + ', 2)">';
			content += '<div class="crewImg">';
			content += '<img src="/photo/' + crew.pho_name + '" class="crewImg">';
			content += '</div>';
			content += '<div class="proInfo">';
			content += '<div class="info crewName">';
			content += '<p class="name">' + crew.crew_name + '</p>';
			content += '<p class="category">/' + crew.crew_exp + '</p>';
			content += '</div>';
			content += '<div class="info detail">';
			content += '<p>크루원</p>&nbsp;';
			content += '<div class="infoBottom popCnt">' + crew.crew_mem_cnt + '</div>&nbsp; &nbsp; &nbsp;';
			content += '<p>인기도</p>&nbsp;';
			content += '<div class="infoBottom popCnt">' + crew.crew_cool_cnt +'</div>';
			content += '</div>';
			content += '</div>';
			content += '</div>';
		}
		$('.bottomContent').html(content);
	}
	
	function detailGo(idx, division){
		if (division == 1) {
			var form = document.createElement('form');
			form.method = 'post';
			form.action = '/main/project/detail.go';

			var input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'pro_idx';
			input.value = idx; 
			form.appendChild(input);
			
			document.body.appendChild(form);
			form.submit();
		} else {
			var form = document.createElement('form');
			form.method = 'post';
			form.action = '/main/crew/detail.go';
	
			var input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'pro_idx';
			input.value = idx; 
			form.appendChild(input);
			
			document.body.appendChild(form);
			form.submit();			
		}
	}

	var msg = '${msg}';
	if (msg != '') {
		alert(msg);
	}
</script>
</html>