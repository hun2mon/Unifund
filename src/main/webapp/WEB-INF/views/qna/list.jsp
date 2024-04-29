<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        width: 200px;
        height: 150px;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
    
    textarea{
    	width : 500px;
    	height: 250px;
    	
    }
    #write{
    	 float: right;
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
                    <option value="공개">공개</option>
                    <option value="비공개">비공개</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요" class="keyWord" onKeyPress="enterKey()">
                <input type="button" value="검색" onclick="search(1)">
            </span>
        </div>
        <table class="proList">
            <thead>
                <tr>
                	<!-- <th><input type="checkbox" id="all"/></th>  -->
                    <th class="qnaIdx">번호</th>
                    <th class="qnaTitle">제목</th>
                    <th class="qnaId">작성자</th>
                    <th class="state">공개/비공개</th>
                    <th class="qndDate">등록일</th>
                </tr>
            </thead>
            <tbody id="list"></tbody>
        </table>
        <div class="paginationContainer">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="pagination"></ul>
            </nav>
            <button class="btn" id="write" onclick="write()">글쓰기</button>
        </div>  
    </div>
    <div class="modal">
        <div class="modal-content" >
		    <h2>비밀번호</h2>
		    <input id="passwordInput" style="background-color: #f2f2f2;" type="password" placeholder="비밀번호를 입력해 주세요">   
		    <br>  
		    <input type="submit" class="btn" value="확인" onclick="checkPassword()">     
		    <input type="button" class="btn" onclick="closeModal()" value="닫기">
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
		if ($('.selectNum').val() == '공개') {
			cate ='공개';
		}
		if ($('.selectNum').val() == '비공개') {
			cate ='비공개';
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
			,url:'./userQnaList.ajax'
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
			 var shortenedContent = (item.qna_title && typeof item.qna_title === 'string') ? (getByteLength(item.qna_title) > 30 ? item.qna_title.substring(0, 20) + '...' : item.qna_title) : '';
			content += '<tr>';
			//content += '<td><input type="checkbox" name="del" value="' + item.qna_idx+'"/></td>';
			content += '<td class="qnaIdx">' + item.qna_idx + '</td>';
			if (item.qna_show == '공개') {
			    content += '<td class="qnaTitle"><a href="qnaDetail.go?qna_idx=' + item.qna_idx + '">' + shortenedContent + '</a></td>';	
			} else {
				content += '<td class="qnaTitle"><a href="#" onclick="modal(\'' + item.qna_pass + '\', \'' + item.qna_idx + '\')">' + shortenedContent + '</a></td>';

				function modal(pass, idx) {
				    console.log(pass);
				    console.log(idx);
				    
				    // 이후에 모달을 열거나 pass와 idx를 이용하여 다른 작업을 수행합니다.
				}
	
			}
			content += '<td class="qnaId">' + item.mem_id + '</td>';
			content += '<td class="state">' + item.qna_show + '</td>';
			
			var date = new Date(item.qna_date);
			var dateStr = date.toLocaleDateString("ko-KR");//en_US
			content += '<td class="qndDate">' + dateStr  + '</td>';
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
	
	function modal(pass, qnaIdx) {
	    const modal = document.querySelector('.modal');
	    modal.style.display = "flex";
	    // 비교할 비밀번호를 전역 변수로 설정
	    window.passToCompare = pass;
	    window.qnaIdxTocompare = qnaIdx;
	}

	function checkPassword() {
	    const password = document.getElementById('passwordInput').value;
	    const pass = window.passToCompare; // 비교할 비밀번호를 전역 변수에서 가져옴
		const qnaIdx = window.qnaIdxTocompare;
	    if (password === pass) {
	        // 비밀번호가 일치하는 경우
	        
	        alert('비밀번호가 일치합니다.');
	        closeModal();
	        location.href = 'qnaDetail.go?qna_idx='+qnaIdx;
	    } else {
	        // 비밀번호가 일치하지 않는 경우	      
	        alert('비밀번호가 일치하지 않습니다.')
	        
	        closeModal();
	    }
	}

    function closeModal() {
    	const modal = document.querySelector('.modal');
        modal.style.display = "none";
	};
    

    window.addEventListener("click", (event) => {
    	const modal = document.querySelector('.modal');
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
    
    function write() {
		location.href='qnaForm.go';
	}
</script>
</html>