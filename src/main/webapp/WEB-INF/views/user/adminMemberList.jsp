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
    width: 85%;
}

select, option {
	width: 15%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 15px;
	box-sizing: border-box;
	margin-bottom: 10px;
	font-size: 16px;
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
    display:none;
}

.empty-container h1{
  font-size: 30px;
    text-align: center;
    color: #909090;
    text-shadow: 5px 5px #e0e0e0;
    margin-top: 114px;
}

.form-container:hover {
	box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.3);
}


.search_container {
	margin-left: 20px;
	padding: 0px 0px 0px 22px;
	width: 230px;
	height: 50px;
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
	height: 100px;
	text-align: center;
	display: inline-block;
	bottom:0;	
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
<div class="container">
<div class="form-container">
	<h1>회원관리</h1>
		<div class="top_content">
			<div class="searchType_container">
				<select class="search_type" id="keywordType">
					<option value="M">관리자</option>
					<option value="B">가입심사중</option>
					<option value="Y">활동중</option>
					<option value="N">탈퇴</option>
					<option value="S">정지</option>
				</select>
			</div>
			<div class="search_container">
				<i id="search_button" class="fa fa-search"></i>
				<input type="text" id="keyword" value="${keyword}" onKeyPress="if(event.keyCode==13) { $('#search_button').click();}"/>
			</div>
		</div>
		<table>
      <tbody id="dataList">
    </tbody>
</table>
<div class="empty-container"></div>
</div>
<div class="paging_container">
</div>
</div>
	<input type="hidden" id="searchIn" value=""/>
	<input type="hidden" id="searchType" value="M"/>
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
	                content += '<tr style="cursor:pointer" onclick="location.href=\'./memDetail.go?mem_idx=' + member.mem_idx + '\'">';
	                content += '<td>' + member.mem_id + '</td>';
	                content += '<td>' + member.mem_name + '</td>';
	                content += '<td>' + member.mem_status + '</td>';
	                content += '<td>' + member.ref_idx_cnt + '</td>';
	                content += '<td>' + member.stop_mem_idx + '</td>';
	                content += '<td>' + member.mem_joindate + '</td>';
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