<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        .crew-details {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            position: relative;
        }

        .crew-details img.logo {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-right: 20px;
        }
        
        .crew-con img.recruitment_information {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-right: 20px;
        }

        .crew-details .info {
            flex-grow: 1;
        }

        .crew-details .buttons {
            position: absolute;
            top: 10px;
            right: 20px;
            display: flex;
        }

        .crew-details .btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            margin: 5px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 10px;
        }

        .crew-details .btn:hover {
            background-color: #0056b3;
        }

        .crew-con {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            text-align: center;
        }

        .crew-description h2 {
            font-size: 20px;
        }

        .crew-con {
            margin-top: 20px;
            text-align: center;
        }

        .crew-con p {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .crew-con img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .crew-table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .crew-table th, .crew-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .crew-table th {
            background-color: #f2f2f2;
        }

        .activity-section {
            margin-top: 20px;
            text-align: center;
        }

        .activity-section h2 {
            font-size: 20px;
        }

        .activity-images {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .activity-images img {
            width: 200px;
            height: 150px;
            border-radius: 10px;
            margin: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

.activity-buttons {
            margin-top: 20px;
            text-align: right;
        }
        
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <input type="hidden" name="crew_idx" class="crew_idx" id="crew_idx" value="${crew.crew_idx}"/>
    <input type="hidden" name="mem_idx" class="mem_idx" id="mem_idx" value="${mem_idx}"/>
    <input type="hidden" name="state" class="state" id="state" value="${crewMember_list.state}"/>
    <div class="container" id="crew-detail-container">
        <div class="crew-details">
            <img src="/photo/${crew.crew_logo}" class="logo"> 
            <div class="info">
                <h1>${crew.crew_name}</h1>
                <p>주 분야: ${crew.crew_exp}</p>
                <p>활동지역: ${crew.crew_local}</p>
                <p>소통링크: ${crew.crew_link}</p>
                <p>인기도 : ${crew.crew_cool_cnt}</p>
            </div>
            <div class="buttons">
                <button class="btn apply-btn" onclick="apply()" >크루 신청</button>
                <button class="btn report-btn" onclick="openReportModal()">크루 신고</button>
					<!-- 크루 신고 팝업 모달 -->
					<div id="reportModal" class="modal">
    					<div class="modal-content">
        					<span class="close" onclick="closeReportModal()">&times;</span>
        					<h2>크루 신고</h2>
        					<textarea id="repContent" name="repContent" rows="4" placeholder="신고 사유를 입력해주세요"></textarea>
        					<button class="btn report-submit-btn" onclick="submitReport()">신고</button>
        					<button class="btn cancel-btn" onclick="closeReportModal()">취소</button>
    					</div>
					</div>
                <div class="thumb">
                    <button class="btn like-btn" onclick="cool()">👍</button>
                </div>
                <c:if test="${sessionScope.mem_idx == crew.crew_leader || sessionScope.mem_idx == crew.crew_member}">
                	<button class="btn leave-btn" onclick="crewOut()">크루 탈퇴하기</button>
                </c:if>
                <c:if test="${sessionScope.mem_idx == crew.crew_leader || sessionScope.mem_idx == crew.manager_idx}">
					<button class="btn edit-btn" onclick="location.href='/main/crew/update.go?crew_idx=${crew.crew_idx}'">크루 수정</button> 
				</c:if>
				<c:if test="${sessionScope.mem_idx == crew.crew_leader || sessionScope.mem_idx == crew.manager_idx}">
    				<button class="btn delete-btn" onclick="openDeleteModal()">크루 삭제</button>				
				</c:if>
					<div id="deleteModal" class="modal">
    					<div class="modal-content">
        					<span class="close" onclick="closeDeleteModal()">&times;</span>
        					<h2>크루 삭제</h2>
        					<textarea id="delContent" name="delContent" rows="4" placeholder="삭제 사유를 입력해주세요"></textarea>
        					<button class="btn delete-submit-btn" onclick="submitDelete()">삭제</button>
        					<button class="btn cancel-btn" onclick="closeDeleteModal()">취소</button>
    					</div>
					</div>
            </div>
        </div>
        <hr>
        <div class="crew-con">
            <p>크루 설명 및 모집 정보</p>
            <p>${crew.crew_con}</p>
            <img src="/photo/${crew.crew_recruitment_information}" class="recruitment_information"> 
            <hr>
            <div id="delegateModal" class="modal" style="display: none;">
    			<div class="modal-content">
        			<span class="close" onclick="closeDelegateModal()">&times;</span>
        			<h2>크루장 위임</h2>
        			<textarea id="delegateReason" name="delegateReason" rows="4" placeholder="크루장 위임 사유를 입력해주세요"></textarea>
        			<button class="btn delegate-submit-btn" onclick="delegateLeader()">위임</button>
        			<input type="hidden" id="num1"/>
        			<button class="btn cancel-btn" onclick="closeDelegateModal()">취소</button>
    			</div>
			</div>
			<div>
            <table class="crew-table">
                <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody class="crew_member_list" id="list"></tbody>
                <tr>
      				<td colspan="3">
      					<div class="container"> 
      						<nav aria-label="Page navigation">
                				<ul class="pagination" id="pagination_member"></ul>
            				</nav>     
        				</div>
      				</td>
     			 </tr>
            </table>
            <div class="activity-section">
            	<table class="activity-table">
            		<thead>
            			<tr>
            				<th>활동 사진</th>
            				<th>활동 내용</th>
            			</tr>
            		</thead>
            		<tbody class="activity_list" id="activity_list"></tbody>
            		<tr>
            			<td colspan="2">
            				<div class="container">
            					<nav aria-label="Page navigation" style="text-align:center">
                					<ul class="pagination" id="pagination"></ul>
            					</nav>     
            				</div>
            			</td>
            		</tr>
            	</table>
            	<div class="activity-buttons">
            		<c:if test="${sessionScope.mem_idx == crew.crew_leader}">
            			<button class="btn btn-primary" onclick="openActivityModal()">활동내역 등록</button>
            		</c:if>
            	</div>
            </div>
            <!-- 활동 내역 등록 모달 -->
			<div id="activityModal" class="modal">
    			<div class="modal-content">
        			<span class="close" onclick="closeActivityModal()">&times;</span>
        			<h2>활동내역 등록</h2>
        			<form action="activity/write.do" method="post" enctype="multipart/form-data">
        				<input type="hidden" name="crew_idx" class="crew_idx" id="crew_idx" value="${crew.crew_idx}"/>
            			<textarea id="activity_details" name="activity_details" rows="6" placeholder="활동 내용(1000자 이내)을 입력해주세요"></textarea>
            			<input type="file" id="crew_activity_photo" name="crew_activity_photo">        			
        			<button class="btn btn-primary" onclick="submitActivity()">등록</button>
        			<button class="btn btn-secondary" onclick="closeActivityModal()">취소</button>
        			</form>
    			</div>
			</div>
        </div>        
    </div>
   

</body>

<script>



var showPage = 1;
var showPage1 = 1;

$(document).ready(function(){
	listCall(showPage);
	listCall1(showPage1);
/* 	$('#pagination_member').twbsPagination('destroy');
	$('#pagination').twbsPagination('destroy'); 	 */
	
    var userState = $("#state").val(); 
    console.log(userState);

    if (userState === "크루장") {
        $(".crew-buttons").show(); // 크루장인 경우 버튼 보이기
    } else {
        $(".crew-buttons").hide(); // 일반 크루원인 경우 버튼 숨기기
    }
});

function listCall(showPage){	
	console.log(showPage);
	var crew_idx= $("#crew_idx").val();
    $.ajax({
       type:'get',
       url:'./detail.ajax',
       data:{
           'page':showPage,
           'cnt':5,
           'crew_idx':crew_idx
       },
       dataType:'json',
       success:function(data){                 
          console.log(data);          
          drawList(data.list); 
          var startPage = 1;

          $('#pagination_member').twbsPagination({
          	startPage:startPage, // 시작페이지
          	totalPages:data.totalPages, // 총 페이지 수
          	visiblePages:5, // 보여줄 페이지 수 1,2,3,4,5
          	onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
          		console.log(pg); // 클릭한 페이지 번호
          		showPage = pg;
          		listCall(pg);
          		
          	}
          })
       },
       error:function(request, status, error){
    	   console.log("code: " + request.status)
           console.log("message: " + request.responseText)
           console.log("error: " + error);
       }
    });
}

function listCall1(showPage1){	
	var crew_idx= $("#crew_idx").val();
	var crew_activity_details_idx= $("#crew_activity_details").val();
    $.ajax({
       type:'get',
       url:'./activityList.ajax',
       data:{
           'page':showPage1,
           'cnt':1,
           'crew_idx':crew_idx,
           'crew_activity_details_idx':crew_activity_details_idx
       },
       dataType:'json',
       success:function(data){                 
          console.log(data);          
          drawList1(data.activity_list);   
          var startPage = 1;

          $('#pagination').twbsPagination({
          	startPage:startPage, // 시작페이지
          	totalPages:data.totalPages, // 총 페이지 수
          	visiblePages:5, // 보여줄 페이지 수 1,2,3,4,5
          	onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
          		console.log(pg); // 클릭한 페이지 번호
          		showPage1 = pg;
          		listCall1(pg);
          	}
          })
       },
       error:function(request, status, error){
    	   console.log("code: " + request.status)
           console.log("message: " + request.responseText)
           console.log("error: " + error);
       }
    });
}

function drawList1(activity_list) {
	var content='';
	
	for(item of activity_list){
		content += '<tr>';
		content += '<input type="hidden" value="${crew_activity_details.crew_activity_details_idx}" name="crew_activity_details_idx" class="crew_activity_details_idx">';
		content += '<td><img src="/photo/'+item.activity_photo+'"class="activity_photo_img"></td>';
		content += '<td>' + item.activity_details + '</td>';
		content += '</tr>';
		content += '<tr>';
		content += '<td colspan=2><input type="button" value="삭제" onclick="activityDel('+item.crew_activity_details_idx+')"></td>';		
		content += '</tr>';
	}
	$('#activity_list').html(content);
	
}

function activityDel(idx) {
	console.log(idx);
	$.ajax({
	       type:'post',
	       url:'./activityDel.ajax',
	       data:{
	           'crew_activity_details_idx':idx
	       },
	       success:function(data){
	          console.log(data);  
	          alert('삭제가 완료되었습니다.');
	          location.reload();
	       },
	       error:function(error){
	          console.log(error);
	          alert('삭제에 실패했습니다.');
	       }
	    });
	
}

function drawList(list) {
    var content = '';
    var leaderFound = false; 

    for (item of list) {
        // 크루장인 경우 버튼추가 x
        if (item.state === '크루장' && !leaderFound) {
            content += '<tr>';
            content += '<td>' + item.state + '</td>';
            content += '<td>' + item.mem_id + '</td>';
            content += '<td></td>';
            content += '</tr>';
            leaderFound = true; // 크루장이 나왔음을 표시
        } else if (item.state !== '크루장') { // 크루장이 아닌 경우 옆에 버튼 추가
        	content += '<tr>';
        	content += '<input type="hidden" value="${crewMember_list.mem_idx}" name="crewMem_idx" class="crewMem_idx">';
        	content += '<input type="hidden" value="${crewMember_list.crew_idx}" name="crew_idx" class="crew_idx">';
        	content += '<td>' + item.state + '</td>';
        	content += '<td>' + item.mem_id + '</td>';
        	content += '<td class="crew-buttons">';
        	content += '<c:if test="${sessionScope.mem_idx == crew.crew_leader || sessionScope.mem_idx == crew.manager_idx}">';
        	content += '<button class="btn btn-danger" onclick="kickMember('+item.mem_idx+')">추방</button>';
        	content += '<button class="btn btn-warning" onclick="openDelegateModal('+item.mem_idx+')">크루장 위임</button>';
        	content += '</c:if>';
        	content += '</td>';
        	content += '</tr>';
        }        
    }    
    // 테이블에 내용 추가
    $('#list').html(content);
}



//모달 열기
function openReportModal() {
    document.getElementById("reportModal").style.display = "block";
}

function closeReportModal() {
    document.getElementById("reportModal").style.display = "none";
}
function openDeleteModal() {
    document.getElementById("deleteModal").style.display = "block";
}

function closeDeleteModal() {
    document.getElementById("deleteModal").style.display = "none";
}

function openDelegateModal(num) {
    // 모달 열기 전에 mem_idx 값을 받아온다.
    console.log(num);
    num1=num;
    $('#num1').attr('value',num);
    var ppp = $('#num1').val();
    console.log(ppp);
    document.getElementById("delegateModal").style.display = "block";
}

function closeDelegateModal() {
    document.getElementById("delegateModal").style.display = "none";
}

function openActivityModal() {
    document.getElementById("activityModal").style.display = "block";
}

function closeActivityModal() {
    document.getElementById("activityModal").style.display = "none";
}


function submitReport() { //크루신고
        var repContent = $("#repContent").val();
        var crew_idx= $("#crew_idx").val();
        $.ajax({
            type: 'post',
            url: './report.ajax',
            data: {
            	'repContent':repContent,
            	'crew_idx':crew_idx
            },
            dataType: 'json',
            success: function(response) {
                alert("신고가 접수되었습니다.");
            },
            error: function(xhr, status, error) {
                // 오류 시 처리할 내용
                alert("오류가 발생했습니다.");
            }
        });
}

function apply(){ //크루신청
	var mem_idx = $('input[type="hidden"].mem_idx').val();
    var crew_idx = $('input[type="hidden"].crew_idx').val();
    var confirmation = confirm("크루에 신청하시겠습니까?");

    if (confirmation) {
        $.ajax({
            type: 'post',
            url: './apply.ajax',
            data: {
                mem_idx: mem_idx,
                crew_idx: crew_idx
            },
            success: function(response) {
                if (response.success) {
                    alert(response.success);                    
                } else if (response.error) {
                    alert(response.error);
                }
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    }
}

function cool() { // 크루 인기도 
	var mem_idx = $('input[type="hidden"].mem_idx').val();
	var crew_idx= $('input[type="hidden"].crew_idx').val();
	$.ajax({
		type : 'get',
		url : './CoolCheck.ajax',
		data : {
			'mem_idx' : mem_idx,
			'crew_idx' : crew_idx
		},
		success : function(data) {
			location.reload(); // 페이지 새로고침
		},
		error : function(error) {
			console.log(error);
		}
	});	
}

function submitDelete(){ // 크루삭제(B 상태로 update)
	var crew_idx= $('input[type="hidden"].crew_idx').val();
	var delContent = $("#delContent").val();
	$.ajax({
		type : 'post',
		url : './delete.ajax',
		data : {
			'crew_idx' : crew_idx,
			'delContent':delContent
		},
		success : function(data) {
			alert('삭제가 완료되었습니다.');
			window.location.href='/main/crew/crewList.go';
		},
		error : function(error) {
			console.log(error);
		}
	});	
}

function crewOut() {
    var crew_idx = $('input[type="hidden"].crew_idx').val();
    $.ajax({
        type: 'post',
        url: './out.do',
        data: { 'crew_idx': crew_idx },
        success: function(response) {
            alert('크루 탈퇴가 완료되었습니다.');
            window.location.href = '/main/crew/crewList.go'; // 크루 목록 페이지로 이동
        },
        error: function(xhr, status, error) {
            console.log(error);
            alert('크루 탈퇴 중 오류가 발생했습니다.');
        }
    });
}

function kickMember(num) {
    var crew_idx = $('input[type="hidden"].crew_idx').val();
    var num=num;
   console.log(num);
    
    var confirmation = confirm("크루원을 추방하시겠습니까?");
    if(confirmation){
        $.ajax({
            type: 'post',
            url: './deport.ajax',
            data: {
                'crew_idx': crew_idx,
                'crewMem_idx':num
            },
            success: function(data) {
                alert('추방이 완료되었습니다.'); 
                location.reload();
            },
            error: function(xhr, status, error) {
                console.log(error);
                alert('추방 중 오류가 발생했습니다.'); 
            }
        });
    }
}

function delegateLeader() {
	var ppp1 = $('#num1').val();
	console.log("ppp1",ppp1);
	var crew_idx = $('input[type="hidden"].crew_idx').val();
	num1= $('input[name="num1"]').val();
	console.log(num1);
    var delegateReason= $("#delegateReason").val();
    
    if (delegateReason.length >= 10) {
        alert('사유는 100자 이내로 적어주세요.');
        $("#delegateReason").focus(); // 입력 필드에 포커스를 맞춥니다.
        return; // 함수 실행을 중지합니다.
    }
    
    var confirmation = confirm("크루장을 위임하시겠습니까?");
    if(confirmation){
        $.ajax({
            type: 'post',
            url: './delegate.ajax',
            data: {
                'crew_idx': crew_idx,
                'crewMem_idx':ppp1,
                'delgateContent':delegateReason
            },
            success: function(data) {
                alert('위임이 완료되었습니다.'); 
                location.reload();
            },
            error: function(xhr, status, error) {
                console.log(error);
                alert('위임 중 오류가 발생했습니다.'); 
            }
        });
    }	    
}

function submitActivity() {
	var $activity_details=$('input[name="activity_details"]');
	var $crew_activity_photo =$('input[name="crew_activity_photo"]');
	
	if(activity_details.val()==''){
		alert('활동 내용을 입력해주세요.');
		$activity_details.focus();
	}else if($activity_details.val().length>1000){
		alert('활동내용은 1000자 이내로 적어주세요.');
		$activity_details.focus();
	}else if($crew_activity_photo.val()=''){
		alert('사진을 첨부해 주세요.');
		$crew_activity_photo.focus();
	}else {
		$('form').submit();
	}
}



</script>
</html>