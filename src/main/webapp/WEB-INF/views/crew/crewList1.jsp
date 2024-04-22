<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
  background-color: #f0f0f0;
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
.crew-list {
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
</style>
</head>
<body>
  <div class="header">
    <button class="btn">최신순</button>
    <button class="btn">인기도순</button>
    <input type="text" placeholder="검색어를 입력하세요">
    <button class="btn">검색</button>
  </div>

  <div class="crew-list">
    <!-- 10개의 리스트 칸 -->
    <div class="crew-item">
      <img src="대표사진.jpg" alt="대표 사진">
      <h2>크루명</h2>
      <p>주분야</p>
      <p>크루원 수</p>
      <p>인기도</p>
      <button class="btn">크루 정보</button>
      <button class="btn">신청하기</button>
    </div>
    <!-- 나머지 리스트 칸들도 유사한 형태로 작성 -->
  </div>

  <div class="paging">
    <!-- 페이징 버튼들 -->
    <button class="btn">1</button>
    <button class="btn">2</button>
    <!-- 나머지 페이징 버튼들도 유사한 형태로 작성 -->
  </div>

  <button class="register-btn">크루 등록</button>
</body>

</html>