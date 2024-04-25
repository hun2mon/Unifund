<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
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
	height: 350px;
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
	width: 230px;
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
    width: 353px;
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

.star_button{
position: absolute;
	padding: 5px;
	position: flex;
	margin-left: -37px;
	margin-top: -50px;
	background-color: white;
	border-radius: 20px;s
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
    width: 80px;
    margin-top: 6px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    border: none;
    cursor: pointer;
    transition: background 0.3s ease, color 0.3s ease;
    border-radius: 15px;
}

.paging {
	margin-top: 30px;
	background-color: #fdfdfd;
	border: none;
	width: 50px;
	margin: 5px;
	padding: 10px 15px;
	font-size: 16px;
	border-radius: 20px;
	box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff;
	transition: all 0.3s ease;
}

.filter_button:hover{
	background:rgb(0 0 0 / 15%);
}

.filter_button.active {
	background-color: black;
	color: white;
}

.paging:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.paging_container {
	width: 100%;
	height: 100px;
	text-align: center;
	display: inline-block;
	margin-top: 10px;
}

.currentPaging {
	background-color: #a1a1a1;
	color: white;
}

.go_btn{
background: rgba(255, 255, 255, 0.15);
    padding: 7px;
    width: 100%;
    margin-top: 25px;
    backdrop-filter: blur(10px); 
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    border: none;
    cursor: pointer;
    transition: background 0.3s ease, color 0.3s ease;
    border-radius: 15px;
}

.go_btn:hover{
	background:rgb(0 0 0 / 15%);
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
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
	
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="top_content">
			<div class="filter_container">
				<input type="button"  class="filter_button <c:if test="${filter == 'recent'}">active</c:if>" value="최신순" data-filter="recent"/>
				<input type="button" id="progressFilter_button"  class="filter_button <c:if test="${filter == 'progress'}">active</c:if>" value="달성률순" data-filter="progress"/>
				<input type="button" id="likeFilter_button"  class="filter_button <c:if test="${filter == 'like'}">active</c:if>" value="좋아요순" data-filter="like"/>
				<input type="button" id="startFilter_button"  class="filter_button <c:if test="${filter == 'favorites'}">active</c:if>" value="즐겨찾기순" data-filter="favorites"/>
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
						<input type="hidden" value="${project.pro_idx}" id="pro_idx" name="pro_idx" class="pro_idx" />
						<td><img src="/photo/${project.pro_main_name }" class="thumb_img" onerror="this.onerror=null;this.src='../resources/project_img/noImg.png'"></td>
						<td><i class="fa fa-heart heart_icon readLike like_button"  style="color: #cccccc"></i></td>
						<td><i class="fa fa-star star_icon readFavorites star_button"  style="color: #cccccc"></i></td>
					</tr>
					<tr>

						<c:if test="${project.pro_state == 'C'}">
							<c:if test="${project.pro_deadline < today }">
								<td>펀딩실패</td>
							</c:if>
							
							<c:if test="${project.pro_deadline >= today }">
								
								<c:if test="${project.progress == null }">
									<td>0% 진행중</td>
								</c:if>
								
								<c:if test="${project.progress != null }">
									<fmt:parseNumber value="${project.progress}" var="NUM" />
									<c:if test="${NUM < 100}">
										<fmt:parseNumber var="NUM_round" value="${NUM}"
											integerOnly="true" />
										<td><c:out value="${NUM_round}"/>% 진행중</td>
									</c:if>
									
									<c:if test="${NUM >= 100 }">
										<td style="color: gray">펀딩완료</td>
									</c:if>
								</c:if>
							
							</c:if>
						
						</c:if>
						
						<c:if test="${project.pro_state == 'B'}">
							<td style="color: gray">펀딩완료</td>
						</c:if>
			
					</tr>
					<tr>
						<td class="title_size"><span>[${project.cateName}] </span><span>${project.pro_title}</span></td>
					</tr>
					<tr>
						<td>
						<span><del>${project.ori_price}</del></span> >> 
						<span><fmt:parseNumber var="price_up" value="${project.rew_price}" integerOnly="true" />${price_up}</span> 
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
					<tr>
						<td><input type="button" class="go_btn" onclick="goDetail()" value="프로젝트 상세보기"/></td>
					</tr>
				</table>
			</div>
		</c:forEach>
		<div class="paging_container">
			<c:if test="${startPage > 5}">
				<a class="paging" href="./list.go?category=${category}&pg=${startPage-1 }&keyword=${keyword}&filter=${filter}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a class="paging <c:if test="${pg == i}">currentPaging</c:if>" href="./list.go?category=${category}&pg=${i}&keyword=${keyword}&filter=${filter}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < totalP}">
				<a class="paging" href="./list.go?category=${category}&pg=${endPage+1 }&keyword=${keyword}&filter=${filter}">다음</a>
			</c:if>
		</div>
	</div>
</body>
<script>
	$('.like_button').each(function() {
		$('.form-container').each(function() {
			var mem_idx = $('input[type="hidden"].mem_idx').val();
			var pro_idx = $(this).find('input[type="hidden"].pro_idx').val();
			var each_project = $(this);
			
			$.ajax({
				type : 'get',
				url : './readLike.ajax',
				data : {
					'mem_idx' : mem_idx,
					'pro_idx' : pro_idx
				},
				success : function(data) {
					if (data.projectReadLike > 0) {
						each_project.find('.readLike').css('color', '#ff2600');
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
			
		});
		
		$(this).on('click',function() {
			var mem_idx = $('input[type="hidden"].mem_idx').val();
			var pro_idx = $(this).closest('.form-container').find('input[type="hidden"].pro_idx').val();
			var like_cnt = $(this).parents('.form-container').find('.like_cnt').text();
			var each_project = $(this);

			$.ajax({
				type : 'get',
				url : './checkLike.ajax',
				data : {
					'mem_idx' : mem_idx,
					'pro_idx' : pro_idx
				},
				success : function(data) {
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
	
	$('.star_button').each(function() {
		$('.form-container').each(function() {
			var mem_idx = $('input[type="hidden"].mem_idx').val();
			var pro_idx = $(this).find('input[type="hidden"].pro_idx').val();
			var projectFav = $(this);
		
			$.ajax({
				type : 'get',
				url : './projectReadFavorites.ajax',
				data : {
					'mem_idx' : mem_idx,
					'pro_idx' : pro_idx
				},
				success : function(data) {
					if (data.projectReadFavorites > 0) {
						projectFav.find('.readFavorites').css('color', '#ffd968');
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
			
		});
		
		$(this).on('click',function() {
			var mem_idx = $('input[type="hidden"].mem_idx').val();
			var pro_idx = $(this).closest('.form-container').find('input[type="hidden"].pro_idx').val();
			var each_favorite = $(this);

			$.ajax({
				type : 'get',
				url : './checkFavorites.ajax',
				data : {
					'mem_idx' : mem_idx,
					'pro_idx' : pro_idx
				},
				success : function(data) {
					if (data.projectCheckFavoritesRow == 0) {
						each_favorite.css('color','#cccccc');
					} else {
						each_favorite.css('color','#ffd968');
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
			url : './checkProject.ajax',
			data : {
				'mem_idx' : mem_idx
			},
			success : function(data) {
				if (data.checkProject > 3) {
					alert('프로젝트는 1인당 최대 3개까지 진행가능합니다.');
					return;
				}
				location.href="./create.go";
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
	
	$('#search_button').on('click', function() {
		var keyword = $('#keyword').val();
		var category = $('.category').val();
		if (keyword == '') {
			alert('검색어를 입력해주세요.');
			return;
		}
		location.href = './list.go?category='+ category+'&pg=1'+'&keyword='+ keyword;
	});
	
	$('.filter_button').on('click', function() {
		var filter = $(this).attr("data-filter");
		var keyword = $('#keyword').val();
		var category = $('.category').val();
		
		location.href = './list.go?category='+category+'&keyword=' + keyword + '&filter=' + filter;
	});
	
	$('.go_btn').on('click',function(){
		var pro_idx = $(this).closest('.form-container').find('input[type="hidden"].pro_idx').val();
		location.href = './detail.go?pro_idx='+ pro_idx
	});
</script>
</html>