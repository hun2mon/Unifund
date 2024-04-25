<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
<style>
.divMain {
	right: 50;
	border: 1px solid red;
	width: 1000px;
}

.proList {
	border-collapse: collapse;
	width: 1000px;
}

thead>*{
	background-color: lightgray;
}

th,td {
	text-align: center;
	border-bottom: 1px solid #000;
	height: 30;
}

span {
	display: flex;
}

.divTop {
	border: 1px solid rebeccapurple;
	width: 260;
	margin-left: 1065;
}

.delButton {
	border: 1px solid rebeccapurple;
	width: 40;
}

.text {
	width: 55;
	border: 1px solid red;
	display: flex;
}
.pagination {
  display: flex;
  justify-content: center;
  list-style-type: none;
  padding: 0;
  margin: 20px 0;
}

.pagination li {
  margin: 0 5px;
  font-size: 16px;
  font-weight: bold;
}

.pagination li a {
  display: block;
  padding: 8px 16px;
  text-decoration: none;
  color: #333;
  border-radius: 4px;
}

.pagination li.active a {
  background-color: #007bff;
  color: #fff;
}

.pagination li a:hover {
  background-color: #e9ecef;
  color: #495057;
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
<body>

	<div class="divMain">
		<table align="center" class="proList">
			<div class="divTop">
				<span> 
				<select name="revNum" class="selectNum">
						<option value="전체">전체</option>
						<option value="삭제">삭제</option>
						<option value="심사중">심사중</option>
						<option value="펀딩중">펀딩중</option>
						<option value="펀딩완료">펀딩완료</option>
						<option value="펀딩실패">펀딩실패</option>
				</select>
						<input type="text" placeholder="검색어를 입력하세요" class="keyWord" onKeyPress="enterKey()">
						<input type="button" value="검색" onclick="search()">
				</span>
			</div>
			<thead>
				<tr>
					<th class="checkBox"><input type="checkbox">
					</td>
					<th class="proIdx">번호
					</td>
					<th class="userId">사용자 ID
					</td>
					<th class="proTitle">프로젝트 제목
					</td>
					<th class="proDeadLine">마감기한
					</td>
					<th class="rewPrice">리워드 가격
					</td>
					<th class="targerPrice">목표 금액
					</td>
					<th class="progress">할인율
					</td>
					<th class="fundState">펀딩 상태
					</td>
				</tr>
			</thead>
			<tbody id="list">
			</tbody>
			<tr>
	      		<td colspan="9">
					<div class="container">                           
	               		<nav aria-label="Page navigation" style="text-align:center">
	                		<ul class="pagination" id="pagination"></ul>
						</nav>               
	            	</div>
	      		</td>
      		</tr>
		</table>
		<div class="delButton">
			<button>삭제</button>
		</div>
	</div>
</body>
<script>
	var showPage = 1;

	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
		listCall(cate,showPage);
	});

	var cate = '전체';
	$('.selectNum').on('change',function(){
		$('#pagination').twbsPagination('destroy');
		var cate;
		if ($('.selectNum').val() == '심사중') {
			cate ='A';
		}
		if ($('.selectNum').val() == '펀딩완료') {
			cate ='B';
		}
		if ($('.selectNum').val() == '펀딩중') {
			cate ='C';
		}
		if ($('.selectNum').val() == '삭제') {
			cate ='D';
		}
		if ($('.selectNum').val() == '펀딩실패') {
			cate ='E';
		}
		if ($('.selectNum').val() == '거절') {
			cate ='F';
		}
		if ($('.selectNum').val() == '전체') {
			cate =$('.selectNum').val();
		}
		listCall(cate,showPage);
	})
	
	function listCall(cate,showPage){
		console.log(cate);
		console.log(showPage);
		$.ajax({
			type:'get'
			,url:'./adminList.ajax'
			,data:{
				category:cate,
				page:showPage,
				cnt:10
			}
			,dataType:'json'
			,success:function(data){
				drawList(data.list);
				$('#pagination').twbsPagination({
	            	startPage:1, // 시작페이지
	            	totalPages:data.totalPages, // 총 페이지 수
	            	visiblePages:5, // 보여줄 페이지 수 1,2,3,4,5
	            	onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
	            		console.log(pg); // 클릭한 페이지 번호
	            		num = pg;
	            		listCall(cate,pg);
	            	}
	            })
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	function drawList(list){
		var num = 1;
		var content = '';
		for (item of list) {
			
			content += '<tr>';
			content += '<td class="checkBox"><input type="checkbox"></td>';
			content += '<td class="proIdx">' + item.pro_idx + '</td>';
			content += '<td class="userId">' + item.mem_id + '</td>';
			content += '<td class="proTitle"><a href="detail.go?pro_idx=' + item.pro_idx + '">' + item.pro_title + '</a></td>';
			var date = new Date(item.pro_deadline);
			var dateStr = date.toLocaleDateString("ko-KR");//en_US
			content += '<td class="proDeadLine">' + dateStr + '</td>';
			content += '<td class="rewPrice">' + (item.rew_price !== null ? Number(item.rew_price).toLocaleString() : '') + '원</td>';
			content += '<td class="targerPrice">' + (item.target_price !== null ? Number(item.target_price).toLocaleString() : '') + '원</td>';
			content += '<td class="progress">' + (item.progress !== null ? item.progress + '%' : '') + '</td>';

			var state = '';
			if (item.pro_state == 'A') {
				state = '심사중';
			}
			if (item.pro_state == 'B') {
				state = '펀딩완료';
			}
			if (item.pro_state == 'C') {
				state = '펀딩중';
			}
			if (item.pro_state == 'D') {
				state = '삭제';
			}
			if (item.pro_state == 'E') {
				state = '실패';
			}
			if (item.pro_state == 'F') {
				state = '거절';
			}
			content += '<td class="fundState">' + state + '</td>';
			content += '</tr>';
			num += 1;
		}
		$('#list').html(content);
	};
	
	function search(showPage) {
		console.log($('.keyWord').val());
		console.log(showPage);
		$('.selectNum').val('전체');
		$.ajax({
			type:'get'
			,url:'./search.ajax'
			,data:{
				keyWord:$('.keyWord').val(),
				page:showPage,
				cnt:10
			}
			,dataType:'json'
			,success:function(data){
				console.log(data.list);
				console.log(data.totalPages);
				drawList(data.list);
				$('#pagination').twbsPagination({
	            	startPage:1, // 시작페이지
	            	totalPages:data.totalPages, // 총 페이지 수
	            	visiblePages:5, // 보여줄 페이지 수 1,2,3,4,5
	            	onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
	            		console.log(pg); // 클릭한 페이지 번호
	            		num = pg;
	            		search(pg);
	            	}
	            })
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	function enterKey() {
		if (event.keyCode==13) {
			var showPage = 1;
			$('#pagination').twbsPagination('destroy');
			search(showPage);
		}
	}
</script>
</html>