<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<style>
   body {
     background: #e2e1e0;
     text-align: center;
   }
   #title{
      height: 150px;
        width: 100%;
        line-height : 150px;
        text-align: center;
        background-color: white;
   }
   h1{
      text-align: center;
   }
   
   hr{
      height: 10px;
       border: 0;
       box-shadow: 0 10px 10px -10px #8c8c8c inset;
   }
   
   #box{
      width: 800px;
      height : 1000px;
      margin: auto;
      margin-bottom : 150px;
      border: solid 1px white;
      background-color: white;
      box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        border-radius: 18%;   
   }
   #box:hover{
      box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
   }
   
   #profile{
      
      width: 150px;
       height: 150px; 
       border-radius: 70%;
       overflow: hidden;
       margin: auto;
       margin-top: 50px;
       box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        transition: all 0.3s cubic-bezier(.25,.8,.25,1);
   }
   
   #profile:hover{
      box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
   }
   
   .img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    margin: auto;
   }
   
   table,td,th {
       border: white;
       margin: auto;
       margin-top: 10px;
       height: 50px;

   }
   th,td{
      padding: 5px 10px;
      text-align: center;
   }
   
   .out{
     margin-left: -48%;
    margin-right: 105px;
        margin-top: -12px;
   }
   
   input[readonly] {
    background-color: #ccc;
</style>
</head>
<body>
   <%@ include file = "/WEB-INF/views/common/header.jsp" %>
   <hr class="hr-13">
   <br>
   <div id="box">
      <div id="profile">
        <c:if test="${not empty proPhoto}">
            <img class="img" src="/photo/${proPhoto}">
         </c:if>
         <c:if test="${empty proPhoto}">
              <img class="img" src="/photo/no_image.jpg">
          </c:if>
      </div>
      <div>
         <form action="profileUpdate.do" method="post" enctype="multipart/form-data">
         <table>
              <tr>
                  <th>프로필사진</th>
                  <td>
                  <input type="file" name="photo" style="margin-right: -75">
                  </td>
              </tr>
                <tr>
                  <th>아이디</th>
                  <td>
                  <input type="text" name="id" readonly="readonly" value="${info.mem_id}">
                  </td>
              </tr>
              <tr>
                  <th>비밀번호</th>
                  <td>
                  <input type="text" name="pw" readonly="readonly" value="${info.mem_pw}">
                  </td>
              </tr>
              <tr>
                  <th>이름</th>
                  <td>
                  <input type="text" name="name" readonly="readonly" value="${info.mem_name}">
                  </td>
              </tr>
              <tr>
                  <th>생년월일</th>
                  <td>
                  <input type="text" name="birth" readonly="readonly" value="${info.mem_birth}">
                  </td>
              </tr>
              <tr>
                  <th>연락처</th>
                  <td>
                  <input type="text" name="number" value="${info.mem_number}">
                  </td>
              </tr>
              <tr>
                  <th>성별</th>
                  <td>
                  <input type="text" name="gender" readonly="readonly" value="${info.mem_gender}">
                  </td>
              </tr>
              <tr>
                  <th>우편번호</th>
                  <td>
                  <input type="text" name="post" value="${info.mem_post}">
                  </td>
              </tr>
              <tr>
                  <th>주소</th>
                  <td>
                  <input type="text" name="addr" value="${info.mem_addr}">
                  </td>
              </tr>
              <tr>
                  <th>상세주소</th>
                  <td>
                  <input type="text" name="detail" value="${info.mem_detail}">
                  </td>
              </tr>
              <tr>
                  <th>대학교</th>
                  <td>
                  <input type="text" name="uni" readonly="readonly" value="${info.mem_uni}">
                  </td>
              </tr>
              <tr>
                  <th>이메일</th>
                  <td>
                  <input type="text" name="email" value="${info.mem_email}">
                  </td>
              </tr>
              <tr>
                  <th>은행명</th>
                  <td>
                  <input type="text" name="bankName" value="${info.mem_bankName}">
                  </td>
              </tr>
              <tr>
                  <th>계좌번호</th>
                  <td>
                  <input type="text" name="bank" value="${info.mem_bank}">
                  </td>
              </tr>
              
          </table>
          <button type="button" class="proChn" onclick="proUpdate()">프로필수정</button>
         </form>
          <button type="button" class="out">회원탈퇴</button>
      </div>
      
      
   </div>   
</body>
<script>
function proUpdate(){
    var $number = $('input[name="number"]');
    var $post = $('input[name="post"]');
    var $addr = $('input[name="addr"]');
    var $detail = $('input[name="detail"]');
    var $email = $('input[name="email"]');
    var $bankName = $('input[name="bankName"]');
    var $bank = $('input[name="bank"]');
    
    // 전화번호 유효성 검사를 위한 정규표현식
    var phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
    // 이메일 유효성 검사를 위한 정규표현식
    var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    // 은행명에는 숫자가 들어가지 않도록 하기 위한 정규표현식
    var bankNameRegex = /^[^0-9]*$/;
    // 계좌번호 유효성 검사를 위한 정규표현식
    var accountNumRegex = /^[\d-]+$/;

    if ($number.val() == '') {
        alert('연락처를 입력해 주세요!');
        $number.focus();
    } else if (!phoneRegex.test($number.val())) {
        alert('올바른 전화번호 형식이 아닙니다! (예: 010-1234-5678)');
        $number.focus();
    } else if ($post.val() == '') {
        alert('우편번호 입력해 주세요!');
        $post.focus();
    } else if ($addr.val() == '') {
        alert('주소를 입력해 주세요!');
        $addr.focus();
    } else if ($detail.val() == '') {
        alert('상세주소를 입력해 주세요!');
        $detail.focus();
    } else if ($email.val() == '') {
        alert('이메일 입력해 주세요!');
        $email.focus();    
    } else if (!emailRegex.test($email.val())) {
        alert('올바른 이메일 형식이 아닙니다!');
        $email.focus();
    } else if (!bankNameRegex.test($bankName.val())) {
        alert('은행명에는 숫자를 입력할 수 없습니다!');
        $bankName.focus();
    } else if ($bank.val() == '') {
        alert('계좌번호를 입력해 주세요!');    
        $bank.focus();
    } else if (!accountNumRegex.test($bank.val())) {
        alert('올바른 계좌번호 형식이 아닙니다! (숫자와 하이픈(-)만 입력 가능)');
        $bank.focus();
    } else {
        $('form').submit();
    }
}

</script>
</html>