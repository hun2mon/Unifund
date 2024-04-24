<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
    /* CSS 스타일은 여기에 작성 */
    .container {
        width: 80%;
        margin: auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        border: none;
        padding: 8px;
    }
    th {
        text-align: left;
        font-weight: bold;
        width: 30%;
    	border-right: solid 1px green;
        
    }
    .content {
        padding: 10px;
        border: 1px solid #dddddd;
        border-radius: 5px;
        background-color: #f9f9f9;
        margin-bottom: 20px;
    }
    .content th {
        text-align: center;
    }
    .content td {
        text-align: center;
    }
    .content td p {
        margin: 0;
    }
    .btn-container {
        text-align: center;
    }
    .btn,.btn-open-modal {
        margin: 5px;
        padding: 10px 20px;
        border: none;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
        border-radius: 5px;         
    }
      
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        justify-content: center;
        align-items: center;
    }
    
    .modal-content {
        width: 600px;
        height: 400px;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
    
    textarea{
    	width : 500px;
    	height: 250px;
    	
    }
</style>
</head>
<body>
    <div class="container">
        <h2>신고 상세보기</h2>
        <div class="content">
            <table>
                <tr>
                    <th>작성자</th>
                    <td>${detail.mem_id}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${detail.rep_date}</td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>${detail.rep_division}</td>
                </tr>
                <tr>
                    <th>참조번호</th>
                    <td>${detail.ref_idx}</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <p style="text-align: center;">${detail.rep_content}</p>
                    </td>
                </tr>
            </table>
        </div>
        <div class="btn-container">
            <button class="btn" onclick="goToList()">리스트 페이지로</button>
            <button class="btn-open-modal">신고 처리</button>      
        </div>
    </div>
    <div class="modal">
        <div class="modal-content" >
            <h2>신고 처리 내용</h2>
            <form action="transContent" method="post">  
            	<c:if test="${detail.trans_content != null}">
            		<textarea style="background-color: #f2f2f2;" type="text" name="transContent" placeholder="처리내용을 입력해주세요." readonly="readonly">${detail.trans_content}</textarea>
	            </c:if>
	            <c:if test="${detail.trans_content == null}">
	            	<textarea type="text" name="transContent" placeholder="처리내용을 입력해주세요." ></textarea>
	            </c:if>
	            <input name ="refIdx" value="${detail.rep_idx}" hidden="">
	            <input name ="cateRefIdx" value="${detail.ref_idx}" hidden="">
	            <input name ="cate" value="${detail.rep_division}" hidden="">
	            
	            <br>
	            <c:if test="${detail.trans_content != null}">
	            	 <input type="button" class="btn" onclick="closeModal()" value="확인">
	            </c:if>
	            <c:if test="${detail.trans_content == null}">
	            	<input type="submit"  class="btn" value="확인">
	            </c:if>	
	            <input type="button" class="btn" onclick="closeModal()" value="닫기">
            </form>
        </div>
    </div>
</body>

<script>
    function goToList() {
        // 리스트 페이지로 이동하는 JavaScript 코드 추가
        location.href = "adminList.go";
    }

    const modal = document.querySelector('.modal');
    const btnOpenModal = document.querySelector('.btn-open-modal');
    const btnCloseModal = document.querySelector('.btn-close-modal');

    btnOpenModal.addEventListener("click", () => {
        modal.style.display = "flex";
    });

    function closeModal() {
		
        modal.style.display = "none";
	};
    

    window.addEventListener("click", (event) => {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
</script>
</html>
