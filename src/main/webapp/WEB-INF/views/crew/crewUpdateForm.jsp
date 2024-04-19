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
label {
    display: inline-block;
    margin-bottom: 5px; /* 체크박스와 문구 사이 간격 조절 */
}

label span {
    font-size: 0.8em; /* 문구 사이즈 조절 */
    margin-left: 5px; /* 문구와 체크박스 사이 간격 조절 */
    color: #888; /* 문구 색상 지정 */
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
	<h3>크루 수정</h3>
	<hr/>
	<form action="crewCreate.do" method = "post" enctype="multipart/form-data">
		<table>
			<tr>
    			<th>크루명</th>
    			<td>
        			<label>
            			<input type="button" value="중복체크" onclick="overlay()" />
            			<span>크루명을 바꾸고 싶다면, 체크박스를 클릭해주세요</span>
        			</label>
        			<input type="checkbox" id="nameCheckbox" onclick="toggleNameInput()" />
        			<input type="text" placeholder="크루명을 입력해주세요(최대 8자)" name="crew_name" id="crewNameInput" value="${crew.crew_name}" disabled />
    			</td>
			</tr>
					
			<tr>
				<th>주분야</th>
				<td>
					<input type="text"  placeholder="주분야를 입력해주세요(최대 10자)"  name= "crew_exp" value="${crew.crew_exp}"/>
				</td>
			</tr>
			
			<tr>
    			<th>크루설명 및 모집정보</th>
    			<td><textarea name="crew_con" placeholder="내용 입력해주세요(최대1500자)">${crew.crew_con}</textarea></td>
			</tr>
			
			<tr>
				<th>크루설명 및 모집정보 이미지</th>				
				<td><input type="file" id="crew_recru_photo" name="crew_recru_photo"/><input type= "text" value="${crewPhoto1}"></td>
			</tr>
			
			<tr>
				<th>모집인원 수</th>
				<td>
					<select name="crew_num" id="crew_num">
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
				<td><input type="file" id="crew_logo_photo" name="crew_logo_photo"/><input type= "text" value="${crewPhoto}"></td>
			</tr>
			<tr>
				<th>소통링크</th>
				<td>
					<input type="text"  placeholder="소통링크를 입력해주세요"  name= "crew_link"value="${crew.crew_link}"/>
				</td>
			</tr>
			<tr>
				<th>활동지</th>
				<td>
					<input type="text"  placeholder="활동지를 입력해주세요"  name= "crew_local" value="${crew.crew_local}"/>
				</td>
			</tr>
			<tr>
				<th colspan="2"><button type="button" onclick="join()">수정</button>
				<button type="button" onclick="location.href='./'">취소</button></th>
				
			</tr>
			
		</table>
	</form>
</body>
<script>

var overChk = false;


function join(){
	
	var $crew_name = $('input[name="crew_name"]');
	var $crew_exp = $('input[name="crew_exp"]');	
	var $crew_con = $('textarea[name="crew_con"]');	
	var crew_con_value = $crew_con.val();
	var $crew_recru_photo=$('input[name="crew_recru_photo"]');
	var $crew_logo_photo=$('input[name="crew_logo_photo"]');
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
	}else if(crew_con_value.length>=1500){
		alert('크루설명 및 모집정보 1500자 이내로 적어주세요.');			
		$crew_con.focus();
	}else if($crew_recru_photo.get(0).files.length <1){
		alert('크루 모집정보 사진을 선택해주세요!');			
		$crew_recru_photo.focus();
	}else if($crew_recru_photo.get(0).files.length >1){
		alert('사진은 한 장만 넣어주세요.');			
		$crew_recru_photo.focus();
	}else if($crew_logo_photo.get(0).files.length<1){
		alert('크루 로고사진을 선택해주세요!');			
		$crew_logo_photo.focus();
	}else if($crew_logo_photo.get(0).files.length>1){
		alert('사진은 한 장만 넣어주세요.');			
		$crew_logo_photo.focus();
	}else if($crew_link.val()==''){
		alert('소통링크를 입력 해 주세요!');			
		$crew_link.focus();
	}else if($crew_local.val()==''){
		alert('활동지 입력 해 주세요!');	
		$crew_local.focus();
	}else{
		$('form').submit();
	}
}

function toggleNameInput() {
    var checkBox = document.getElementById("nameCheckbox");
    var inputField = document.getElementById("crewNameInput");
    inputField.disabled = !checkBox.checked;
}


var msg = '${msg}'; 
if(msg != ''){
	alert(msg);
}
function overlay() {
	console.log('click');
	var id = $('input[name="crew_name"]').val();
	
	$.ajax({
		type:'post', 
		url:'crewOverlay.do', 
		data:{'crew_name':id}, 
		success:function(data){ 
			console.log(data);
			if(data.use > 0){
				alert('중복된 크루명입니다.');
				$('input[name="crew_name"]').val('');
			}else{
				alert('사용 가능한 크루명 입니다.');
				overChk = true;
			}
		}, 
		error:function(error){ 
			console.log(error);
		} 
	});
}
</script>
</html>