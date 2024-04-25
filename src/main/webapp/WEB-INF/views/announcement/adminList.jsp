<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
table {
	width: 50%;
	border-collapse: collapse;
	margin: 20px auto;
}

th, td {
	border: WHITE;
	padding: 8px;
	text-align: center;
	cursor: pointer;
}

th {
	background-color: #f2f2f2;
}

.red-text {
	color: red;
}

.green-text {
	color: green;
}

.search-bar {
	margin-bottom: 10px;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<h2>공지사항</h2>
	<div class="search-bar">
		<input type="text" placeholder="검색어를 입력하세요" id="keyWord"
			class="keyWord" onKeyPress="enterKey()"> <input type="button"
			value="검색" onclick="searchDo()">

	</div>
	<div style="text-align: center; margin-top: 20px;">
		<button onclick="goToAdminAnnForm()">공지사항 작성</button>
	</div>
	<div style="text-align: center; margin-top: 20px;">
        <button onclick="deleteSelectedAnnouncements()">선택된 공지사항 삭제</button>
    </div>
	<table>

		<thead>
			<tr>
			    <th><input type="checkbox" class="checkbox" id="selectAll" onclick="selectAll()"></th>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody id="list">

		</tbody>
		<tr>
			<td colspan="6" id="paging">
				<div class="container">
					<nav aria-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
	</table>

</body>
<script>
var showPage = 1;

$(document).ready(function(){ 
    listCall(showPage);
});

function listCall(page){
	console.log(showPage);
	$.ajax({
		type:'get'
		,url:'./adminList.ajax'
		,data:{
			'page':page,
            'cnt':20,
		}
		,dataType:'json'
		,success:function(data){
			drawList(data.adminList);
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
    if (Array.isArray(list)) { // list가 배열인지 확인
        for(var item of list){
            console.log(item);
            content += '<tr>';
            content += '<td><input type="checkbox" class="checkBox" value="' + item.noti_idx + '"></td>';
            content += '<td>' + item.noti_idx + '</td>';
            content += '<td';
            if(item.noti_top === 'B') {
                content += ' class="red-text"';
            }
            content += '>' + item.mem_id + '</td>';
            content += '<td';
            console.log(item.noti_status);
            if(item.noti_status === 'B') {
                content += ' class="green-text"';
            }
            content += ' onclick="goToDetail(' + item.noti_idx + ')">';
            
            // 제목 길이가 20자를 넘어가면 ...
            if (item.noti_title.length > 20) {
                content += item.noti_title.substring(0, 20) + '...';
            } else {
                content += item.noti_title;
            }
            
            content += '</td>';
            var notiDate = new Date(item.noti_date);
            var notiDateStr = notiDate.toLocaleDateString("ko-KR");
            content += '<td>' + notiDateStr + '</td>';
            content += '</tr>';
        }
    } else {
        content = '<tr><td colspan="3">공지 목록을 불러올 수 없습니다.</td></tr>';
    }
    
    $('#list').html(content);
}

function deleteSelectedAnnouncements() {
    var selectedNotiIdxList = [];
    $(".checkBox:checked").each(function () {
        selectedNotiIdxList.push($(this).val());
    });

    if (selectedNotiIdxList.length === 0) {
        alert("선택된 공지사항이 없습니다.");
        return;
    }

    $.ajax({
        type: 'post',
        url: './delete.ajax',
        traditional: true, // 배열 파라미터 전송을 위해 필요
        data: {
            'notiIdxList': selectedNotiIdxList
        },
        success: function (response) {
            if (response === "success") {
                alert("선택된 공지사항이 삭제되었습니다.");
                // 삭제 후 목록 다시 불러오기
                listCall(showPage);
            } else {
                alert("공지사항 삭제에 실패했습니다.");
            }
        },
        error: function (error) {
            console.log(error);
            alert("공지사항 삭제에 실패했습니다.");
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

function search(showpage) {
    var keyWord = $('#keyWord').val(); // 검색어를 가져옴 (keyWord로 수정)
    console.log(keyWord),
    $.ajax({
        type: 'get',
        url: './adminListSearch.ajax',
        data: {
            'keyWord': keyWord, // 검색어를 keyWord로 전달
            'page': showpage,
            'cnt': 20
        },
        dataType: 'json',
        success: function(data) {
            console.log(data.adminList);
            console.log(data.totalPages);
            drawList(data.adminList);
            $('#pagination').twbsPagination({
                startPage:1, // 시작페이지
                totalPages: data.totalPages, // 총 페이지 수
                visiblePages: 5, // 보여줄 페이지 수 1,2,3,4,5
                onPageClick: function(evt, pg) { // 페이지 클릭시 실행 함수
                    console.log(pg); // 클릭한 페이지 번호
                    num = pg;
                    search(pg); // 페이지를 넘겨가면서 검색
                }
            })
        },
        error: function(error) {
            console.log(error);
        }
    });
}
function goToDetail(notiIdx) {
    window.location.href = '/main/announcement/annDetail.go?noti_idx=' + notiIdx; // 공지사항 상세 페이지로 이동
}
function searchDo(){
	var showPage = 1;
	$('#pagination').twbsPagination('destroy');
	search(showPage);
}


function goToAdminAnnForm() {
    window.location.href = 'adminAnnForm.go'; // 공지사항 작성 페이지로 이동
}



var isAllChecked = false;

function selectAll() {
    var checkBoxes = $('.checkBox');
    if (isAllChecked) {
        checkBoxes.prop('checked', false);
    } else {
        checkBoxes.prop('checked', true);
    }
    isAllChecked = !isAllChecked;
}
</script>