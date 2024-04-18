<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	input[name="id"]{
	width: 70%;
	}
	table,th,td{
	border:1px solid black;
	border-collapse: collapse;
}

th,td{
	padding: 5px 10px;
}

button{
	margin: 5px;
}
textarea{
	resize: none;
	width:500px;
	height: 150px;
}

input[type="text"]{
	width:100%;
}
img.icon{
	width: 15px;
	height: 15px;
}
	
</style>
</head>
<body>
	<h3>크루 등록</h3>
	<hr/>
	<form action="crewCreate.do" method = "post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>크루명</th>
				<td>
					<input type="text"  placeholder="크루명을 입력해주세요(최대 8자)"  name="crew_name"/>
					<input type="button" value="중복체크" maxlength="8" onclick= "overlay()"/>
				</td>
			</tr>
					
			<tr>
				<th>주분야</th>
				<td>
					<input type="text"  placeholder="주분야를 입력해주세요(최대 10자)"  name= "crew_exp"/>
				</td>
			</tr>
			
			<tr>
				<th>크루설명 및 모집정보</th>
				<td><textarea name = "crew_con" placeholder="내용 입력해주세요(최대1500자)" name="crew_con" ></textarea></td>
			</tr>
			
			<tr>
				<th>크루설명 및 모집정보 이미지</th>				
				<td><input type="file" name="photos" multiple="multiple" name=""/></td>
			</tr>
			
			<tr>
				<th>모집인원 수</th>
				<td>
					<select>
   						<option value="5">5명</option>
  		 				<option value="10">10명</option>
   						<option value="15">15명</option>
   						<option value="20">20명</option>
   						<option value="25">25명</option>
   						<option value="30">30명</option>
  				    </select>
  				</td>
			</tr>
			
			<tr>
				<th>로고사진</th>				
				<td><input type="file" name="photos" multiple="multiple"name="crew_logo"/></td>
			</tr>
			<tr>
				<th>소통링크</th>
				<td>
					<input type="text"  placeholder="소통링크를 입력해주세요"  name= "crew_link"/>
				</td>
			</tr>
			<tr>
				<th>활동지</th>
				<td>
					<input type="text"  placeholder="활동지를 입력해주세요"  name= "crew_local"/>
				</td>
			</tr>
			<tr>
				<th colspan="2"><button type="button" onclick="join()">등록</button>
				<button type="button" onclick="join()">취소</button></th>
				
			</tr>
			
		</table>
	</form>
</body>
<script>

var overChk = false;


function join(){
	
	var $crew_name = $('input[name="crew_name"]');
	var $crew_exp = $('input[name="crew_exp"]');	
	var $crew_con = $('input[name="crew_con"]');
	var $age = $('input[name="age"]');
	
	var $crew_link = $('input[name="crew_link"]');
	var $crew_local = $('input[name="crew_local"]');
			
	if(overChk == false){
		alert('중복 체크를 해 주세요!');
		$crew_name.focus();
	}else if($crew_name.val()==''){
		alert('크루명을 입력 해 주세요!');			
		$crew_exp.focus();
	}else if($crew_name.val().length >=8){
		alert('크루명은 8자 이하로 적어주세요.');			
		$crew_exp.focus();
	}else if($crew_exp.val()==''){
		alert('주분야를 입력 해 주세요!');			
		$crew_exp.focus();
	}else if($crew_exp.val().length>=10){
		alert('주분야는 10자 이하로 적어주세요.');			
		$crew_exp.focus();
	}else if($crew_con.val()==''){
		alert('크루설명 및 모집정보를 입력 해 주세요!');			
		$crew_con.focus();
	}else if($crew_con.val()==''){
		alert('사진을 선택해주세요!');			
		$crew_con.focus();
	}else if($crew_con.val()==''){
		alert('크루설명 및 모집정보는 1500자 이하로 적어주세요.');			
		$crew_con.focus();
	}else if($crew_link.val()==''){
		alert('소통링크를 입력 해 주세요!');			
		$crew_link.focus();
	}else if($crew_local.val()==''){
		alert('활동지 입력 해 주세요!');	
		$crew_local.focus();
	}
}

var msg = '${msg}'; // 쿼터 빠지면 넣은 문구가 변수로 인식됨.
if(msg != ''){
	alert(msg);
}
function overlay() {
	console.log('click');
	var id = $('input[name="crew_name"]').val();
	//ajax를 이용한 비동기 통신 (자바스크렙트를 사용해 보안성이 좋지 못함 취약함)
	$.ajax({
		type:'post', // method 방식
		url:'crewOverlay.do', // 요청한 주소
		data:{'crew_name':id}, // 파라메터
		success:function(data){ // 통신 성공했을경우
		//ajax에서 XmlhttpRequest 객체를 통해 대신 받아와서
		//여기에 뿌려준다
			console.log(data);
			if(data.use > 0){
				alert('중복된 크루명입니다.');
				$('input[name="crew_name"]').val('');
			}else{
				alert('사용 가능한 크루명 입니다.');
				overChk = true;
			}
		}, 
		error:function(error){ // 통신 실패 시
			console.log(error);
		} 
	});
}
</script>
</html>