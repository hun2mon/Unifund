<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!--<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>-->
<style>
tr {
	margin-bottom: 10px;
}

body {
	width: 100%;
	background-color: #f2f2f2;
}

.container {
	max-width: 100%;
	background-color: #f2f2f2;
	margin: 50px auto;
	padding: 10px;
	border-radius: 10px;
	/*box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
}

.form-container {
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(10px);
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	color: #fff;
	cursor: pointer;
	transition: background 0.3s ease, color 0.3s ease;
	margin: 20px;
	float: left;
	height: 330px;
	border-radius: 20px;
	padding: 10px;
	width: 247px;
}

.empty-container{
	background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    color: black;
    cursor: pointer;
    transition: background 0.3s ease, color 0.3s ease;
    margin: 20px;
    float: left;
    font-size: 50px;
    height: 70%;
    text-align: center;
    border-radius: 20px;
    padding: 10px;
    width: 95%;
}

.empty-container h1{
  font-size: 2em;
    text-align: center;
    color: #f5f5f5;
    text-shadow: 5px 5px #959595;
    margin: 0;
}

.form-container:hover {
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
}

.thumb_img {
	position: relative;
	height: 180px;
    width: 227px;
	border-radius: 20px;
}

.search_container {
	margin-left: 20px;
	padding: 0px 0px 0px 22px;
	width: 289px;
	height: 50px;
	display: inline-block;
	align-items: center;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(10px);
	border-radius: 20px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.filter_container {
	margin-left: 20px;
    padding: 0px 0px 0px 10px;
    width: 337px;
    height: 50px;
    display: inline-block;
    align-items: center;
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    border-radius: 20px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}


#search_btn {
	width: 85px;
	position: absolute;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px;
}

#keyword {
	width: 150px;
	position: relative;
	padding: 10px;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px;
	border: none;
	background: none;
	outline: none;
}

.write_container {
	margin-right: 20px;
	display: inline-block;
	float: right;
	text-align: right;
}

.heart_icon {
	position: absolute;
	padding: 5px;
	position: flex;
	margin-left: -37px;
	margin-top: -82px;
	background-color: white;
	border-radius: 20px;
}

.small_content {
	font-size: 12px;
	margin-top: 11px;
}

.small_content_box {
	background-color: #f8f8f8;
	border: none;
	margin: 2px;
	padding: 2px 6px;
	border-radius: 8px;
	box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff;
	transition: all 0.3s ease;
}

.write_btn {
	background: rgba(255, 255, 255, 0.15);
	padding: 9px 19px;
	backdrop-filter: blur(10px);
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	border: none;
	cursor: pointer;
	transition: background 0.3s ease, color 0.3s ease;
	border-radius: 15px;
}

.filter_button{
	background: rgba(255, 255, 255, 0.15);
    padding: 7px;
    width: 75px;
    margin-top: 6px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    border: none;
    cursor: pointer;
    transition: background 0.3s ease, color 0.3s ease;
    border-radius: 15px;
}

.filter_button:hover{
	background:rgb(0 0 0 / 15%);
}
.filter_button.active {
	background-color: black;
	color: white;
}

.title_size{
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    max-width: 100px;
    word-break: break-all;
}
</style>
</head>
<body>
	<input type="hidden" value="1" name="mem_idx" class="mem_idx" />
	<input type="hidden" value="${category}" name="category" class="category" />
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="top_content">
			<div class="filter_container">
				<input type="button"  class="filter_button <c:if test="${filter == 'recent'}">active</c:if>" value="최신순" data-filter="recent"/>
				<input type="button" id="progressFilter_button"  class="filter_button <c:if test="${filter == 'progress'}">active</c:if>" value="달성률순" data-filter="progress"/>
				<input type="button" id="likeFilter_button"  class="filter_button <c:if test="${filter == 'like'}">active</c:if>" value="좋아요순" data-filter="like"/>
				<!-- <input type="button" id="startFilter_button"  class="filter_button <c:if test="${filter == 'we dont need it'}">active</c:if>" value="즐겨찾기순" data-filter="we dont need it"/> -->
			</div>
			<div class="search_container">
				<i id="search_button" class="fa fa-search"></i>
				<input type="text" id="keyword" value="${keyword}" onKeyPress="if(event.keyCode==13) { $('#search_button').click();}"/>
			</div>
			<div class="write_container">
				<button class="write_btn" onclick="check_create()">작성하기</button>
			</div>
		</div>
		
		<c:if test="${empty list}">
			<div class="empty-container">
				<h1>UNIFUND</h1>
			</div>
		</c:if>
		
		<c:forEach items="${list }" var="project">
			<div class="form-container">
				<table>
					<tr>
						<input type="hidden" value="${project.pro_idx}" name="pro_idx" class="pro_idx" />
						<td><img src="/photo/${project.pro_main_name }" class="thumb_img" onerror="this.onerror=null;this.src='resources/project_img/noImg.png'"></td>
						<td><i class="fa fa-heart heart_icon readLike like_button"  style="color: #cccccc"></i></td>
					</tr>
					<tr>
						<c:if test="${project.progress == null}">
							<td>0% 진행중</td>
						</c:if>
						<c:if test="${project.progress != null}">
							<fmt:parseNumber value="${project.progress}" var="NUM" />
							<c:if test="${NUM < 100}">
								<fmt:parseNumber var="NUM_round" value="${NUM}"
									integerOnly="true" />
								<td><c:out value="${NUM_round}" />% 진행중</td>
							</c:if>
							<c:if test="${NUM >= 100}">
								<td style="color: gray">펀딩완료</td>
							</c:if>
						</c:if>
					</tr>
					<tr>
						<td class="title_size"><span>[${project.cateName}] </span><span>${project.pro_title}</span></td>
					</tr>
					<tr>
						<td>
						<span><del>${project.ori_price}</del></span> >> 
						<span><fmt:parseNumber var="price_up" value="${project.rew_price }" integerOnly="true" />${price_up}</span> 
						<span>
						<fmt:parseNumber var="percent" value="${((project.ori_price - (project.rew_price)) / project.ori_price) * 100}" integerOnly="true" />${percent}%
						</span>
						</td>
					</tr>
					<tr>
						<td>
						<div class="small_content">
							<span class="small_content_box">
							<fmt:formatDate value="${project.pro_deadline}" pattern="MM/dd" />까지</span> 
							<span class="small_content_box like_cnt">${project.like_cnt }</span>
							<span class="small_content_box">${project.userId }</span>
						</div>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
</body>
<script>
	
	$('.form-container').each(function() {
		var mem_idx = $('input[type="hidden"].mem_idx').val();
		var pro_idx = $(this).find('input[type="hidden"].pro_idx').val();
		var each_project = $(this);
		
		$.ajax({
			type : 'get',
			url : 'projectReadLike.ajax',
			data : {
				'mem_idx' : mem_idx,
				'pro_idx' : pro_idx
			},
			success : function(data) {
				console.log(data.projectReadLike);
				if (data.projectReadLike > 0) {
					each_project.find('.readLike').css('color', '#ff2600');
				}
			},
			error : function(error) {
				console.log(error);
			}
		});
		
	});

	$('.like_button').each(function() {
		$(this).on('click',function() {
			var mem_idx = $('input[type="hidden"].mem_idx').val();
			var pro_idx = $(this).closest('.form-container').find('input[type="hidden"].pro_idx').val();
			var like_cnt = $(this).parents('.form-container').find('.like_cnt').text();
			var each_project = $(this);
			console.log("mem_idx::", mem_idx);
			console.log("pro_idx::", pro_idx);
			console.log("like_cnt::", like_cnt);

			$.ajax({
				type : 'get',
				url : 'projectCheckLike.ajax',
				data : {
					'mem_idx' : mem_idx,
					'pro_idx' : pro_idx
				},
				success : function(data) {
					console.log(data.projectCheckLikeRow);
					if (data.projectCheckLikeRow == 0) {
						each_project.css('color','#cccccc');
						each_project.closest('.form-container').find('.like_cnt').text(Number(like_cnt) - 1);
					} else {
						each_project.css('color','#ff2600');
						each_project.closest('.form-container').find('.like_cnt').text(Number(like_cnt) + 1);
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
			
		});
	});

	function check_create() {
		var mem_idx = $('input[type="hidden"].mem_idx').val();
		$.ajax({
			type : 'get',
			url : 'checkProject.ajax',
			data : {
				'mem_idx' : mem_idx
			},
			success : function(data) {
				console.log(data.checkProject);
				if (data.checkProject > 100) {
					alert('프로젝트는 1인당 최대 3개까지 진행가능합니다.');
					return;
				}
				location.href="./projectCreateForm";
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

</script>
</html>