<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<html>
<head>
<meta charset="UTF-8">
<title>:: UNIFUND 회원가입심사::</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<style>
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

.submit_btn, .refuse_btn{
	cursor:pointer;
	height: 35px;
    border-radius: 35px;
    border: none;
    color: white;
    font-weight: bold;
    background: #3b3b3b;
    position: relative;
 	width:80%;
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

td.tr_bottom {
	margin-bottom: 70px;
}

td.tr_bottom:hover {
	background: #e4dfdf;
	font-weight: bold;
}

td {
	padding: 8px;
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
	width: 214px;
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
	width: 50px;
	position: absolute;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px;
	color: black;
    margin-right: 43px;
    margin-top: 14px;
}

#keyword {
	width: 130px;
	position: relative;
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


.modal {
	text-align: center;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 500px;
	height: 250px;
	border-radius: 0.5rem;
}

.box {
	width: 450px;
	height: 108px;
	overflow: auto;
	border: none;
	padding: 20px;
	background-color: white;
}

.close-button {
	float: right;
	width: 35px;
	line-height: 0.5rem;
	height: 35px;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
}

.close-button:hover {
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}

#cancelc, #ok {
	background-color: white;
    border: none;
    padding: 15px 30px;
    font-size: 16px;
    width: 210px;
    margin-right: 10px;
    margin-top: -30px;
    border-radius: 20px;
    box-shadow: 5px 5px 10px #c7c7c7, -5px -5px 10px #ffffff;
    transition: all 0.3s ease;
}

#cancelc:hover, #ok:hover {
	background-color: lightgray;
	box-shadow: 7px 7px 12px #b3b3b3, -7px -7px 12px #ffffff;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
	<div class="container">
		<div class="form-container">
		<div class="top-container">
		<h1>회원관리</h1>
		<button class="anotherMem_btn" onclick="location.href='./adminMemberList.go'">전체회원 보기</button>
		</div>
			<div class="top_content" style="height:8%;">
				<div class="search_container">
					<i id="search_button" class="fa fa-search" style="color: black;margin-right: 43px; margin-top: 14px;"></i> 
					<input type="text" id="keyword" value="${keyword}"
						onKeyPress="if(event.keyCode==13) { $('#search_button').click();}" />
				</div>
			</div>
			<hr>
			<table style="width:100%;">
			 	<colgroup> 
    			<col style="width: 23%;"/> 
        		<col style="width: 15%;"/> 
       		 	<col style="width: 15%;"/> 
        		<col style="width: 21%;"/> 
        		<col style="width: 13%;"/> 
        		<col style="width: 13%;"/> 
    			</colgroup> 
				<thead>
					<tr style="background-color:lightgray;height:5px;">
					<th>사용자ID</th>
					<th>이름</th>
					<th>회원상태</th>
					<th>가입날짜</th>
					<th>승인</th>
					<th>거절</th>
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
	<div class="modal-container"></div>
</body>
<script>

$(document).ready(function(){
	pageNlist(1);
});

$('#search_button').click(function(){
	var keyword = $('#keyword').val();
	
	$('#searchIn').val(keyword);
	pageNlist(1);
});

function pageNlist(page) {
    var keyword = $('#searchIn').val();

    $.ajax({
        type: 'get',
        url: './adminMemberJoinReq.ajax',
        data:{
            pg:page,
            keyword:keyword        
        },
        success: function(data) {
            var content = '';
            var none = '';
            var a = '';
            var modal = '';

            var pg = data.pg;
            var startPage = data.startPage;
            var endPage = data.endPage;
            var totalP = data.totalP;
            
            if(data.joinMemList.length == 0){
                none += '<h1>결과가 존재하지 않습니다.</h1>';
            }

            $.each(data.joinMemList, function(i, member) {
                content += '<tr>';
                content += '<td style="cursor:pointer; color: #535353;" class="tr_bottom" onclick="location.href=\'./memDetail.go?mem_idx=' + member.mem_idx + '\'">' + member.mem_id + '</td>';
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
                }else if(member.mem_status  == 'R'){
                    content += '거절';
                }else{
                    content += '알수없음';
                }
                content += '</td>';
                
                var date = new Date(member.mem_joindate);
                var dateStr = date.toLocaleDateString("ko-KR");//en_US지
                content += '<td>' + dateStr + '</td>';
                
               	content += '<td><button class="submit_btn" style="background: #77ce11;" data-mem="'+ member.mem_idx +'">승인</button></td>';
               	content += '<td><button class="refuse_btn" style="background: #ee2a2a;" data-mem="'+ member.mem_idx +'">거절 </button></td>';
                
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

            function openModal(memIdx,btn) {
                var modal = '<div class="modal">'; 
                modal += '<div class="modal-content">'; 
                modal += '<span class="close-button"><h2>X</h2></span>'; 
                modal += '<h3 class="title"> </h3> ';
                modal += '<p><div class="box">';
                if(btn === 'submit'){
                	modal += '<h2>가입을 승인하시겠습니까?</h2>';
                } else if(btn === 'refuse'){
                	modal += '<h2>가입을 거절하시겠습니까?</h2>';
                }
                modal += '</div></p>';
                modal += '<input type="button" id="cancelc" class="cancelc" value="취소"> ';
                modal += '<input type="button" id="ok" class="ok" value="동의"> ';
                modal += '</div> ';
                modal += '</div>';

                $('.modal-container').html(modal);
                $('.modal').addClass("show-modal");

                $('.ok').click(function(){
                    console.log(memIdx);
                   	var urlInfo = '';
                   	if(btn === 'submit'){
                   		urlInfo = './adminMemberSubmitStatus.ajax';
                   	}else if(btn === 'refuse'){
                   		urlInfo = './adminMemberRefuseStatus.ajax';
                   	}
                    $.ajax({
                        type:'get',
                        url: urlInfo,
                        data: {
                            mem_idx : memIdx
                        },
                        success: function(data) {
                            console.log("inininin");
                            	pageNlist(pg);
                            	closeModal();
                        },
                        error: function(xhr, status, error) {
                            console.error(xhr.responseText);
                        }
                    });
                });
                
                $('.close-button, .cancelc').click(closeModal);
            }
            
            function closeModal() {
                $('.modal').removeClass("show-modal");
            }

            $(document).on('click','.submit_btn',function(){
                var memIdx = $(this).attr('data-mem');
                openModal(memIdx,'submit');
            });
            
            $(document).on('click','.refuse_btn',function(){
                var memIdx = $(this).attr('data-mem');
                openModal(memIdx,'refuse');
            });
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}

</script>
</html>