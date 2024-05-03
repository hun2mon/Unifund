<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
      height : 1100px;
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
   
   #minibox{
      
      width: 700px;
       height: 980px;
       margin: auto;
       margin-top: 20px;
       border: solid 1px white;
       background-color: #f8fbfc;
       box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
       transition: all 0.3s cubic-bezier(.25,.8,.25,1);
       border-top-right-radius: 20%;
       border-top-left-radius: 20%;
       border-bottom-right-radius: 20%;
       border-bottom-left-radius: 20%
   }
   
   #minibox:hover{
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
    margin-top: 15px;
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
     margin-left: 2%;
    margin-right: 105px;
   }
    .intro{
     
       width: 70px;
       height: 30px;
       border: black;
       margin: auto;
       text-align: center;
       font-weight: bold;
       font-size: 17px;
   }
   
   #selfExp{
      
      width: 400px;
      height: 30px;
      border: black;
      margin: auto;
      padding: 10px 0;
      background-color :white;
   }
   
   #selfInt{
      width: 400px;
       height: 200px;
       background-color :white;
       margin: auto;
       padding: 10px 0;
       
   }
   
   #play{
      width: 400px;
      height: 300px;
      
      margin: auto;
      margin-top: 10px;
   }
   
   #proBtn{
         margin-left: 71.8%;
          margin-top: 30px;
   }
   
   input[name="selfExp"]{
         width: 50%;
         text-align: center;
         
   }
   
   textarea {
   overflow: auto;
    width: 80%;
    height: 30%;
    resize: none;
   }
   
   input[name="photos"] {
            margin-left: 61.35%;
		    margin-top: -89px;
		    margin-bottom: 54px;
   }
   
   .imgList{
   		margin-left: -41%;
   }
   
   #navCss{
   		margin-left: -41%
   }
</style>
</head>
<body>
   <%@ include file = "/WEB-INF/views/common/header.jsp" %>
   <br>
   <div id="box">
      <div id="minibox">
         <form action="introUpdate.do?mem_idx=${memIdx}" method="post" enctype="multipart/form-data">
         <h1>자기소개서</h1>
         	   <input id="phoMem_idx" value="${memIdx}" hidden>
               <div class="intro">주분야</div>
                  <input type="text" name="selfExp" placeholder="주분야를 입력해주세요."  value="${introDto.self_exp}">
               <div class="intro">자기소개</div>
                  <textarea name="selfInt" id="selfIntro" oninput="checkLength(this, 500)" placeholder="자기소개를 입력해주세요. 최대 500자까지 입력 가능합니다." >${introDto.self_introduce}</textarea>
               <h2>활동사진</h2>
		        <hr class="hr-13">
		        <table>    
		          <tbody id="photoList"></tbody>   
		            <tr>
		               <td colspan="1">
		                  <div class="container">
		                   <nav id="navCss" aria-label="Page navigation">
		                       <ul class="pagination" id="pagination_pho"></ul>
		                   </nav>
		               </div>
		               </td>
		            </tr>
		        </table> 
            <input type="file" name="photos" multiple="multiple">
         <button type="submit" id="proBtn" onclick="introUp()">자소서 수정</button>
         </form>
      </div>
   </div>   
</body>
<script>
	var showPage = 1;
	
	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라 
	   photoList(showPage);
	});
	
	var $mem_idx = $('#phoMem_idx').val()
	
	function photoList(page) {
	    $.ajax({
	       type:'get',
	       url:'./photoList.ajax',
	       data:{
	          'page':page,
	          'cnt':1,
	          'mem_idx':$mem_idx
	       },
	       dataType:'json',
	       success:function(data){
	               console.log('data',data);
	               drawPhoList(data.list);
	               
	               var startPage = data.currPage  > data.totalPages ? data.totalPages : data.currPage;
	               
	               $('#pagination_pho').twbsPagination({
	                   startPage:1, // 시작페이지
	                   totalPages:data.totalPages, // 총 페이지 갯수
	                   visiblePages:5, // 보여줄 페이지 수[1][2][3][4][5]
	                   onPageClick:function(evt, pg){
	                      console.log(evt);//이벤트 객체
	                      console.log(pg);//클릭한 페이지 번호
	                      showPage = pg;
	                      photoList(pg);
	                   }               
	                });           
	          },
	          error:function(error){
	              console.log(error);
	           } 
	    });
	 }
	 
	 function drawPhoList(list) {
	    var content = '';
	    
	    if (list.length === 0) {
	        content += '<tr>';
	        content += '<td><img class ="imgList" src="../resources/profile_img/no_image.jpg"  style="width: 300px; height: 300px;"></td>';
	        content += '</tr>';  
	    } else {
	        for (item of list) {
	            content += '<tr>';
	            content += '<td style="width: 300px;"><img class="imgList" src="/photo/' + item.pho_name + '" style="width: 300px; height: 300px;"></td>';	            
	            content += '</tr>';
	            content += '<tr>';
	            content += "<td><a href='#' class='deleteButton' data-pho-name='" + item.pho_name + "'>삭제</a></td>";
	            content += '</tr>';
	        }   
	    } 
	    $('#photoList').html(content);
	 }      
	 
	 $(document).on('click', '.deleteButton', function(e) {
		    e.preventDefault(); // 링크의 기본 동작인 이동을 막음
		    
		    var phoName = $(this).data('pho-name');
		    
		    del(phoName); // del() 함수 호출
		});
	 
	 
	 function del(phoName) {
		    $.ajax({
		        url: './introPhoDel.ajax',
		        type: 'get', 
		        data: { 
		            'phoName': phoName
		        }, 
		        success: function(data) {
		            console.log(data);
		            $('#pagination_pho').twbsPagination('destroy');
		            photoList(showPage);
		        },
		        error: function(error) {
		            console.log(error);
		        }
		    });
		}
	 
	 function checkLength(textarea, maxLength) {
		    if (textarea.value.length > maxLength) {
		        textarea.value = textarea.value.substring(0, maxLength);
		        alert("최대 글자수를 초과했습니다.");
		    }  
		}	 
	 
</script>
</html>