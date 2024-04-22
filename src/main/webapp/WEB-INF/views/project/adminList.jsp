<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.divMain {
	right: 50;
	border: 1px solid red;
	width: 1000px;
	margin: 0 auto;
}

table {
	border-collapse: collapse;
	width: 1000px;
}

thead {
	background-color: lightgray;
}

th, td {
	text-align: center;
	border-bottom: 1px solid #000;
	height: 30;
	vertical-align: top;
	vertical-align: bottom;
	vertical-align: middle;
}

span {
	display: flex;
}

.divTop {
	border: 1px solid rebeccapurple;
	width: 260;
	margin-left: auto;
}

.delButton {
	border: 1px solid rebeccapurple;
	width: 40;
	margin-left: auto;
	display: flex;
}

.text {
	width: 55;
	border: 1px solid red;
	display: flex;
}
</style>
</head>
<body>
	<div class="divMain">
		<table align="center">
			<div class="divTop">
				<span> <select name="revNum" class="selectNum">
						<option value="전체">전체</option>
						<option value="삭제">삭제</option>
						<option value="심사중">심사중</option>
						<option value="펀딩중">펀딩중</option>
						<option value="펀딩완료">펀딩완료</option>
						<option value="펀딩실패">펀딩실패</option>
				</select>
					<form>
						<input type="text" name="serch" placeholder="검색어를 입력하세요">
						<input type="submit">
					</form>
				</span>
			</div>
			<thead>
				<tr>
					<th class="checkBox"><input type="checkbox">
					</td>
					<th class="proIdx">번호
					</td>
					<th class="userId">사용자 ID
					</td>
					<th class="proTitle">프로젝트 제목
					</td>
					<th class="proDeadLine">마감기한
					</td>
					<th class="rewPrice">리워드 가격
					</td>
					<th class="targerPrice">목표 금액
					</td>
					<th class="progress">할인율
					</td>
					<th class="fundState">펀딩 상태
					</td>
				</tr>
			</thead>
			<tbody id="list">
				<tr>
					<td class="checkBox"><input type="checkbox"></td>
					<td class="proIdx">1</td>
					<td class="userId">admin</td>
					<td class="proTitle">가가가가가가가가가가가가가가가가가가가가</td>
					<td class="proDeadLine">2024/04/29</td>
					<td class="rewPrice">15000</td>
					<td class="targerPrice">300000</td>
					<td class="progress">50%</td>
					<td class="fundState">펀딩중</td>
				</tr>
			</tbody>
		</table>
		<div class="delButton">
			<button>삭제</button>
		</div>
	</div>
</body>
<script>
	listCall();
	
	function listCall(){
		$.ajax({
			type:'get'
			,url:'./adminList.ajax'
			,data:{}
			,dataType:'json'
			,success:function(data){
				consol.log(data);
				drawList(data.list);
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	var num = 1;
	function drawList(list){
		var content = '';
		for (item of list) {
			
			content += '<tr>';
			content += '<td class="checkBox"><input type="checkbox"></td>';
			content += '<td class="proIdx">' + num + '</td>';
			content += '<td class="userId">' + admin + '</td>';
			content += '<td class="proTitle">' + 가가가가가가가가가가가가가가가가가가가가 + '</td>';
			content += '<td class="proDeadLine">' + 2024/04/29 + '</td>';
			content += '<td class="rewPrice">' + 15000 + '</td>';
			content += '<td class="targerPrice">' + 300000 + '</td>';
			content += '<td class="progress">' + 50% + '</td>';
			content += '<td class="fundState">' + 펀딩중 + '</td>';
			content += '</tr>';
			num += 1;
		}
		$('#list').html(content);
	};
	
</script>
</html>