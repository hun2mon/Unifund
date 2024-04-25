<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<style>
body {
	width: 100%;
	background-color: #f2f2f2;
}

.container {
	font-family: arial;
	position: relative;
	height: 100%;
	max-width: 100%;
	background-color: #f2f2f2;
	margin: 20px auto;
	padding: 10px;
	border-radius: 10px;
	margin-left: 20px;
}

.form-container {
	background: white;
	backdrop-filter: blur(10px);
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	color: #fff;
	transition: background 0.3s ease, color 0.3s ease;
	float: left;
	height: 90%;
	border-radius: 20px;
	padding: 10px;
	width: 60%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.form-container h1 {
	color: gray;
	position: absolute;
}

.top-container {
	
}

.top_content {
	width: 100%;
	hegiht: 11%;
}

.anotherMem_btn {
	height: 36px;
	margin-left: 13px;
	border-radius: 35px;
	margin-bottom: 16px;
	border: none;
	padding: 10px;
	color: white;
	font-weight: bold;
	background: #3b3b3b;
	position: relative;
	margin-left: 125px;
	margin-top: 20px;
	padding-left: 13px;
	padding-right: 14px;
}

hr {
	color: black;
	height: 5px;
	border-radius: 20px;
	margin-bottom: 9px;
}

`
table {
	background: rgba(255, 255, 255, 0.50);
	backdrop-filter: blur(10px);
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	transition: background 0.3s ease, color 0.3s ease;
	border-radius: 20px;
	width: 100%;
	margin-top: 84px;
	border: 1px solid lightgray
}

select, option {
	width: 130px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 15px;
	box-sizing: border-box;
	font-size: 16px;
	cursor: pointer;
}

thead {
	font-size: 19px;
}

tr.tr_bottom {
	margin-bottom: 70px;
}

tr.tr_bottom:hover {
	background: #e4dfdf;
	font-weight: bold;
}

td {
	padding: 10px;
}

.empty-container {
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
	display: none;
}

.empty-container h1 {
	font-size: 30px;
	text-align: center;
	color: #909090;
	text-shadow: 5px 5px #e0e0e0;
	margin-top: 114px;
}

.searchType_container {
	position: absolute;
}

.search_container {
	margin-left: 20px;
	width: 230px;
	height: 43px;
	align-items: center;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(10px);
	border-radius: 20px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	float: right;
	position: relative;
	text-align: right;
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
	position: relative;
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

.paging:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.paging_container {
	width: 100%;
	text-align: center;
	display: inline-block;
	margin-top: 30px;
	position: fixed;
    bottom: 27px;
}

.currentPaging {
	background-color: #a1a1a1;
	color: white;
}

.go_btn {
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

.go_btn:hover {
	background: rgb(0 0 0/ 15%);
}

.title_size {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	max-width: 100px;
	word-break: break-all;
}
</style>
</head>
<body>
	<div class="container">
		
		<div class="form-container">
		<div class="top-container">
		<h1>회원관리</h1>
		<button class="anotherMem_btn" onclick="location.href='./adminJoinReq.go'">가입요청 회원보기</button>
		</div>
			<div class="top_content" style="height:8%;">
				<div class="searchType_container">
					<select class="search_type" id="keywordType">
						<option value="">전체회원</option>
						<option value="M">관리자</option>
						<option value="B">가입심사중</option>
						<option value="Y">활동중</option>
						<option value="N">탈퇴</option>
						<option value="S">정지</option>
					</select>
				</div>
				<div class="search_container">
					<i id="search_button" class="fa fa-search"></i> <input type="text"
						id="keyword" value="${keyword}"
						onKeyPress="if(event.keyCode==13) { $('#search_button').click();}" />
				</div>
			</div>
			<hr>
			<table style="width:100%;">
			 	<colgroup> 
    			<col style="width: 23%;"/> 
        		<col style="width: 15%;"/> 
       		 	<col style="width: 15%;"/> 
        		<col style="width: 10%;"/> 
        		<col style="width: 10%;"/> 
        		<col style="width: 27%;"/> 
    			</colgroup> 
				<thead>
					<tr style="background-color:lightgray;height:5px;">
					<th>사용자ID</th>
					<th>이름</th>
					<th>회원상태</th>
					<th>신고횟수</th>
					<th>정지횟수</th>
					<th>가입날짜</th>
					</tr>
				</thead>
				<tbody id="dataList" style="text-align:center">
				</tbody>
			</table>
			<div class="empty-container"></div>
			<div class="paging_container"></div>
		</div>
	</div>
	<input type="hidden" id="searchIn" value="" />
	<input type="hidden" id="searchType" value="M" />
</body>
<script>

$(document).ready(function(){
	pageNlist(1);
});

$('#search_button').click(function(){
	var keyword = $('#keyword').val();
	var searchType = $('#keywordType').val();
	
	$('#searchIn').val(keyword);
	$('#searchType').val(searchType);
	pageNlist();
});

$('#keywordType').change(function(){
	var keyword = $('#keyword').val();
	var searchType = $('#keywordType').val();
	
	$('#searchIn').val(keyword);
	$('#searchType').val(searchType);
	pageNlist();
});

function pageNlist(page) {
	var searchType = $('#keywordType').val();
    var keyword = $('#searchIn').val();

    $.ajax({
        type: 'get',
        url: './adminMemberList.ajax',
        data:{
			pg:page,
			searchType:searchType,
			keyword:keyword		
		},
		 success: function(data) {
	            var content = '';
	            var a = '';
	            var none = '';
	            var pg = data.pg;
	            var startPage = data.startPage;
	            var endPage = data.endPage;
	            var totalP = data.totalP;
				
	            if(data.memberList.length == 0){
	            	none += '<h1>결과가 존재하지 않습니다.</h1>';
 	            }
	            
	            $.each(data.memberList, function(i, member) {
	            	console.log(data.memberList)
	                content += '<tr style="cursor:pointer; color: #535353;" class="tr_bottom" onclick="location.href=\'./memDetail.go?mem_idx=' + member.mem_idx + '\'">';
	                content += '<td>' + member.mem_id + '</td>';
	                content += '<td>' + member.mem_name + '</td>';
	                content += '<td>'
	                if(member.mem_status  == 'M') {
	                	content += '관리자';	
	                }else if(member.mem_status  == 'B'){
	                	content += '가입심사중';	
	                }else if(member.mem_status  == 'Y'){
	                	content += '활동중';	
	                }else if(member.mem_status  == 'N'){
	                	content += '탈퇴';	
	                }else if(member.mem_status  == 'S'){
	                	content += '정지';
	                }else {
	                    content += '전체선택';
	                }
	                content += '</td>';
	                
	                content += '<td>' + member.ref_idx_cnt + '</td>';
	                content += '<td>' + member.stop_mem_idx + '</td>';

	                var date = new Date(member.mem_joindate);
	    			var dateStr = date.toLocaleDateString("ko-KR");//en_US지
	    			
	                content += '<td>' + dateStr + '</td>';
	                content += '</tr>';
	            });
	            
	            if (startPage > 5) {
	                a += '<a class="paging" href="#" onclick="pageNlist(' + (startPage - 1) + '); return false;">이전</a>';
	            }
	            for (var i = startPage; i <= endPage; i++) {
	                if (pg !== i) {
	                    a += '<a class="paging" href="#" onclick="pageNlist(' + i + '); return false;">' + i + '</a>';
	                } else {
	                    a += '<a class="paging currentPaging" href="#" onclick="pageNlist(' + i + '); return false;">' + i + '</a>';
	                }
	            }
	            if (endPage < totalP) {
	                a += '<a class="paging" href="#" onclick="pageNlist(' + (endPage + 1) + '); return false;">다음</a>';
	            }
	            
	            $("#dataList").html(content);
	            $('.paging_container').html(a);
	            $('.empty-container').html(none);
	        },
	        error: function(xhr, status, error) {
	            console.error(xhr.responseText);
	        }
    });
}

</script>
</html>