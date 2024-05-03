<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 /* 전체 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: lightgray;
            font-weight: bold;
        }
        /* 검색 관련 스타일 */
        .searchContainer {
            float: right;
            margin-top: 20px;
            margin-right: 20px;
        }
        .searchContainer input[type="text"],
        .searchContainer input[type="button"] {
            padding: 6px;
            margin-right: 6px;
        }
        /* 페이지네이션 스타일 */
        .pagination {
            display: flex;
            justify-content: center;
            list-style-type: none;
            padding: 0;
            margin-top: 20px;
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
<body>
<%@ include file = "/WEB-INF/views/common/sideBar.jsp" %>
	 <div class="container">
        <div class="searchContainer">
            <span>
                <select name="revNum" class="selectNum">
                    <option value="전체">전체</option>
                    <option value="프로젝트">프로젝트</option>
                    <option value="크루">크루</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요" class="keyWord" onKeyPress="enterKey()">
                <input type="button" value="검색" id="searchBtn">
            </span>
        </div>
        <table class="proList">
            <thead>
                <tr>
                    <th class="repIdx">번호</th>
                    <th class="category">카테고리</th>
                    <th class="repContent">신고내용</th>
                    <th class="repIdx">신고자ID</th>
                    <th class="repDate">신고날짜</th>
                    <th class="repState">처리상태</th>
                </tr>
            </thead>
            <tbody id="list"></tbody>
        </table>
        <div class="paginationContainer">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="pagination"></ul>
            </nav>
        </div>
        
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script>
	var showPage = 1;

	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
		listCall(cate,showPage);
	});

	var cate = '전체';
	$('.selectNum').on('change',function(){
		$('#pagination').twbsPagination('destroy');
		var cate;
		if ($('.selectNum').val() == '프로젝트') {
			cate ='프로젝트';
		}
		if ($('.selectNum').val() == '크루') {
			cate ='크루';
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
			 var shortenedContent = (item.rep_content && typeof item.rep_content === 'string') ? (getByteLength(item.rep_content) > 30 ? item.rep_content.substring(0, 20) + '...' : item.rep_content) : '';
			content += '<tr>';
			content += '<td class="repIdx">' + item.rep_idx + '</td>';
			content += '<td class="category">' + item.rep_division + '</td>';
			content += '<td class="repContent"><a href="adminDetail.go?rep_idx=' + item.rep_idx + '">' + shortenedContent + '</a></td>';
			var date = new Date(item.rep_date);
			var dateStr = date.toLocaleDateString("ko-KR");//en_US
			content += '<td class="repIdx">' + item.mem_id + '</td>';
			content += '<td class="repDate">' + dateStr + '</td>';
			content += '<td class="repState">' + item.rns_state + '</td>';
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
	
	function getByteLength(str) {
		var len = 0;
		for (var i = 0; i < str.length; i++) {
			if (escape(str.charAt(i)).length >= 4) {
				len += 3;
			} else if (escape(str.charAt(i)) === '%A7') {
				len += 2;
			} else {
				len++;
			}
		}
		return len;
	}
	
	$('#searchBtn').click(function(){
		var showPage= 1;
		$('#pagination').twbsPagination('destroy');
		search(showPage);
	})
</script>
</html>