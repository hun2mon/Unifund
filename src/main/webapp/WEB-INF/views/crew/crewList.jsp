<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>

<style>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
  background-color: #f0f0f0;
}
.listLogo_img {
  width: 100%; 
  height: auto; 
}

.btn {
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #007bff;
  color: #fff;
  cursor: pointer;
}

.btn:hover {
  background-color: #0056b3;
}

input[type="text"] {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

/* 크루 리스트 칸 스타일 */
.crew_list {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
  padding: 20px;
}

.crew-item {
  border: 1px solid #ccc;
  padding: 20px;
  border-radius: 10px;
}

/* 페이징 버튼 스타일 */
.paging {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

/* 크루 등록 버튼 스타일 */
.register-btn {
  display: block;
  margin: 20px auto;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #28a745;
  color: #fff;
  cursor: pointer;
}

.register-btn:hover {
  background-color: #218838;
}


.btn-group {
  display: flex;
  align-items: center;
}
</style>
</head>

<body>

<input type="hidden" name="mem_idx" class="mem_idx" id="mem_idx" value="1" > <!--value값 바꿔줘야함 {crew.mem_idx} -->
<div class="header">
    <div class="btn-group" style="margin-right: 20px;"> 
        <button class="btn" id="latestBtn">최신순</button>
        <button class="btn" id="popularityBtn">인기도순</button>
    </div>
    <div style="flex-grow: 1;"></div> 
    <input type="text" id="searchInput" placeholder="검색어를 입력하세요" style="margin-right: 10px;"> 
    <button class="btn" id="searchBtn" style="margin-right: 20px;">검색</button> 
    <button class="register-btn" onclick="location.href='/main/crew/crewCreate.go'">크루 등록</button> <!-- 수정된 부분 -->
</div>

<div class="crew_list" id="list">
</div>

<div class="paging" id="pagination">
</div>

<div class="container">                           
     <nav aria-label="Page navigation" style="text-align:center">
         <ul class="pagination" id="pagination"></ul>
     </nav>               
</div>

</body>

<script>

var showPage = 1;

$(document).ready(function(){ 
    listCall(showPage);

    // 최신순 버튼 클릭 시
    $('#latestBtn').click(function() {
        listCall(showPage, 'latest');
    });

    // 인기도순 버튼 클릭 시
    $('#popularityBtn').click(function() {
        listCall(showPage,'popularity');
    });

    // 검색 버튼 클릭 시
    $('#searchBtn').click(function() {
        var searchKeyword = $('#searchInput').val();
        // 검색 기능을 위한 listCall 함수 호출
        listCall(showPage, 'search', searchKeyword);
    });
});

function listCall(page, filterType, searchKeyword){
    $.ajax({
       type:'get',
       url:'./crewList.ajax',
       data:{
           'page':page,
           'cnt':10,
           'filterType': filterType,         // 필터 타입 전달
           'searchKeyword': searchKeyword    // 검색어 전달
       },
       dataType:'json',
       success:function(data){
          drawList(data.crewList);
          console.log(data);          
          
          
          var startPage = data.currentPage >data.totalPages ? data.totalPages : data.currentPage;
          
          $('#pagination').twbsPagination({
              startPage:startPage,    // 시작페이지
              totalPages:data.totalPages,   // 총 페이지 갯수
              visiblePages:5,   // 보여줄 페이지 수 [1][2][3][4][5]
              onPageClick:function(evt, pg){ // 페이지 클릭시 실행 함수
                  console.log(evt);//이벤트 객체
                  console.log(pg);//클릭한 페이지 번호
                  showPage = pg;
                  listCall(pg);
              }
          });
       },
       error:function(error){
          console.log(error);
       }
    });
}


function drawList(list){
    
var content = '';

for(item of list){
   content += '<div class="crew-item">';
   // content += '<img src="/Users/ku-ilseung/Desktop/C/upload/crew_logo" path="/photo">';
   content += '<img src="/photo/'+item.crew_logo+'"class="listLogo_img">';
   content += '<h2>' + item.crew_name + '</h2>';
   content += '<input type="hidden" value="${crew.crew_idx}" name="crew_idx" class="crew_idx">';
   content += '<p>' + item.crew_exp + '</p>';
   content += '<p>' + item.crew_num + '</p>';
   content += '<p>' + item.crew_cool_cnt + '</p>';
   content += '<button class="btn" onclick="location.href=\'/main/crew/crewCreate.go\'">크루 정보</button>';
   content += '<button class="btn-apply" data-crew_idx="' + item.crew_idx + '">신청하기</button>';
   content += '</div>';
}

$('#list').html(content);
}

$(document).on('click', '.btn-apply', function() {
    var mem_idx = $('input[type="hidden"].mem_idx').val();
    var crew_idx = $(this).data('crew_idx');

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
});

</script>
</html>