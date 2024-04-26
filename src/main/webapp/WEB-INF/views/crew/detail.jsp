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
    <input type="hidden" name="mem_idx" class="mem_idx" id="mem_idx" value="${member.mem_idx}"/>
    <div class="container" id="crew-detail-container">
        <div class="crew-details">
            <img src="/photo/${crew.crew_logo}" class="logo"> 
            <div class="info">
                <h1>${crew.crew_name}</h1>
                <p>주 분야: ${crew.crew_exp}</p>
                <p>활동지역: ${crew.crew_local}</p>
                <p>소통링크: ${crew.crew_link}</p>
            </div>
            <div class="buttons">
                <button class="btn apply-btn" >크루 신청</button>
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
                    <button class="btn like-btn">👍</button>
                </div>
                <button class="btn leave-btn">크루 탈퇴하기</button>
				<button class="btn edit-btn" onclick="location.href='/main/crew/crewUpdateForm.go?crew_idx=${crew.crew_idx}'">크루 수정</button> 
				<button class="btn delete-btn">크루 삭제</button>
            </div>
        </div>
        <hr>
        <div class="crew-con">
            <p>크루 설명 및 모집 정보</p>
            <p>${crew.crew_con}</p>
            <img src="/photo/${crew.crew_recruitment_information}" class="recruitment_information"> 
            <hr>
            <table class="crew-table">
                <thead>
                    <tr>
                        <th>공백</th>
                        <th>ID</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>내용</td>
                        <td>내용</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>내용</td>
                        <td>내용</td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>내용</td>
                        <td>내용</td>
                    </tr>
                </tbody>
            </table>
        </div>        
    </div>
</body>

<script>
//모달 열기
function openReportModal() {
    document.getElementById("reportModal").style.display = "block";
}

// 모달 닫기
function closeReportModal() {
    document.getElementById("reportModal").style.display = "none";
}

// 신고 제출
function submitReport() {
        var repContent = $("#repContent").val();
        console.log(repContent);
        $.ajax({
            type: 'post',
            url: './report.ajax',
            data: {
            	'repContent': repContent
            },
            dataType: 'json',
            success: function(response) {
                alert("신고가 접수되었습니다.");
                $("#reportModal").modal("hide"); // 팝업 닫기
            },
            error: function(xhr, status, error) {
                // 오류 시 처리할 내용
                alert("오류가 발생했습니다.");
            }
        });
}


</script>
</html>