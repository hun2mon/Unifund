<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<style>
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
<%@ include file = "/WEB-INF/views/common/header.jsp" %>
<%@ include file = "/WEB-INF/views/common/sideBar.jsp" %>
	 <div class="container">
        <div class="searchContainer">
            <span>
                <input type="text" placeholder="검색어를 입력하세요" class="keyWord" id="inputField" >
                <input type="button" id ="searchBtn" value="검색" >
            </span>
        </div>
        <table class="adminCrewList">
            <thead>
                <tr>
                    <th class="crewIdx">크루번호</th>
                    <th class="crewName">크루 이름</th>
                    <th class="crewChief">크루장</th>
                    <th class="crewChief">크루 상태</th>           
                    <th class="crewNum">크루원 수</th>
                    <th class="crewDate">창설일</th>
                    <th class="crewCoolCnt">인기도</th>                    
                </tr>
            </thead>
            <tbody id="list"></tbody>
        </table>
        <div class="paging" id=pagination></div>
        <div class="container">
            <nav aria-label="Page navigation" >
                <ul class="pagination" id="pagination"></ul>
            </nav>
        </div>
        
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script src="../resources/js/jquery.twbsPagination.js"	type="text/javascript"></script>
<script>

var showPage = 1;

$(document).ready(function(){ 
	listCall(showPage);
});

function listCall(showPage){
	console.log(showPage);
	$.ajax({
		type:'get'
		,url:'./adminList.ajax'
		,data:{
			'page':showPage,
			'cnt':10
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
            		listCall(pg);
            	}
            })
		}
		,error:function(error){
			console.log(error);
		}
	});
}

function drawList(list){
    
var content = '';

for(item of list){
	content += '<tr>';
	content += '<td class="crewIdx">' + item.crew_idx + '</td>';
    content += '<td><button class="btn" onclick=\'location.href="/main/crew/detail.go?crew_idx=' +item.crew_idx + '"\'>' + item.crew_name + '</button></td>'
	//content += '<td class="crewName"><a href="crew/detail.go?crew_idx=' + item.crew_idx + '">' + item.crew_name + '</a></td>';
	content += '<td class="crewChief">' + item.crew_leader_id + '</td>';
    content += '<td>'
        if(item.crew_status  == 'A') {
        	content += '활동중';	
        }else {
        	content += '크루 삭제';	
        }
    content += '</td>';
	content += '<td class="crewNum">' + item.crew_num + '</td>';	
	var date = new Date(item.crew_date);
	var dateStr = date.toLocaleDateString("ko-KR");//en_US
	content += '<td class="crewDate">' + dateStr + '</td>';
	content += '<td class="crewCoolCnt">' + item.crew_cool_cnt + '</td>';
	content += '</tr>';
	}

$('#list').html(content);
}

$('#searchBtn').click(function() {    
	var showPage = 1;
	$('#pagination').twbsPagination('destroy');
	search(showPage);
})

$('#inputField').keypress(function(event) {
    if (event.which === 13) { 
        var showPage = 1;
        $('#pagination').twbsPagination('destroy');
        search(showPage);
    }
});

function search(showPage) {	
	console.log($('.keyWord').val());
	console.log(showPage);
	$.ajax({
		type:'get'
		,url:'./search.ajax'
		,data:{
			'keyWord':$('.keyWord').val(),
			'Page':showPage,
			'cnt':10
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














</script>
</html>