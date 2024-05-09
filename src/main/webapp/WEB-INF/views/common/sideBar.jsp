<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap')
	;


.side_bar {
	z-index: 4;
	position: absolute;
	top: 40px;
	left: -100%;
	width: 300px;
	height: 1200px;
	background: #ecf0f3;
	padding: 12px;
	box-shadow: -3px -3px 7px #ffffff, 3px 3px 5px #ceced1, inset -3px -3px
		7px #ffffff, inset 3px 3px 5px #ceced1;
	transition: all 0.3s ease;
	margin-top: 32px;
}

.side_bar .title {
	display: flex;
	justify-content: space-evenly;
}

.side_bar .title .logo {
	font-size: 27px;
	font-weight: 600;
	color: #31344b;
}

.side_bar ul {
	margin-top: 35px;
	list-style: none;
}

.side_bar ul a {
	color: #31344b;
	text-decoration: none;
	display: block;
	margin-top: 12px;
	font-size: 18px;
	font-weight: 400;
	padding: 10px 25px;
	border-radius: 6px;
	box-shadow: -3px -3px 7px #ffffff, 3px 3px 5px #ceced1;
	position: relative;
	transition: all 0.2s ease;
}

.side_bar ul i {
	margin-right: 10px;
}

.media_icons {
	margin-top: 50px;
	display: flex;
	justify-content: center;
}

.media_icons a {
	position: relative;
	margin: 0 4px;
	font-size: 17px;
	cursor: pointer;
	height: 40px;
	width: 40px;
	border-radius: 50%;
	text-align: center;
	line-height: 40px;
	text-decoration: none;
	box-shadow: -3px -3px 7px #ffffff, 3px 3px 5px #ceced1;
	transition: all 0.3s ease;
}

.side_bar ul a:hover:before, .media_icons a:hover:before {
	position: absolute;
	content: '';
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	box-shadow: inset -3px -3px 7px #ffffff, inset 3px 3px 5px #ceced1;
}

.side_bar ul a:hover:before {
	border-radius: 6px;
}

.media_icons a:hover:before {
	border-radius: 50%;
}

.side_bar ul a:hover {
	color: #3498db;
}

.media_icons a:nth-child(1) {
	color: #4267b2;
}

.media_icons a:nth-child(2) {
	color: #1da1f2;
}

.media_icons a:nth-child(3) {
	color: #e1306c;
}

.media_icons a:nth-child(4) {
	color: #ff0000;
}

label {
	font-size: 17px;
	color: #31344b;
	box-shadow: -3px -3px 7px #ffffff, 3px 3px 5px #ceced1;
	height: 37px;
	width: 37px;
	border-radius: 50%;
	text-align: center;
	line-height: 37px;
	cursor: pointer;
	transition: all 0.3s ease;
}

label:hover {
	box-shadow: inset -3px -3px 7px #ffffff, inset 3px 3px 5px #ceced1;
	color: #3498db;
}

#check {
	display: none;
}

.bars {
	position: absolute;
	left: 15px;
	top: 90px;
}

#check:checked ~ .side_bar {
	left: 0;
}
</style>
</head>
<body>
	<input type="checkbox" id="check">
	<label class="button bars" for="check"></label>
	<div class="side_bar">
		<div class="title">
			<div class="logo">UNIFUND</div>
			<label class=" button cancel" for="check"></label>
		</div>
		<ul>
			<li><a href="/main/user/adminList.go"><i class="fa-solid fa-user"></i>회원관리</a></li>
			<li><a href="/main/project/adminList.go"><i class="fa-solid fa-diagram-project"></i>프로젝트 관리</a></li>
			<li><a href="/main/crew/adminList.go"><i class="fa-solid fa-people-roof"></i>크루관리</a></li>
			<li><a href="/main/report/adminList.go"><i class="fa-solid fa-circle-exclamation"></i>신고 관리</a></li>
			<li><a href="/main/money/adminCashList.go"><i class="fa-solid fa-sack-dollar"></i>재화 관리</a></li>
			<li><a href="/main/announcement/adminList.go"><i class="fa-solid fa-chalkboard-user"></i>공지사항</a></li>
			<li><a href="/main/qna/adminQnaList.go"><i class="fa-solid fa-circle-question"></i>Q&A 관리</a></li>
		</ul>
	</div>
</body>
<script>
  const navBar = document.querySelector(".side_bar");
       menuBtns = document.querySelectorAll(".button.bars");
       overlay = document.querySelector(".button.cancel");

     menuBtns.forEach((menuBtn) => {
       menuBtn.addEventListener("click", () => {
         navBar.classList.toggle("open");
       });
     });

     overlay.addEventListener("click", () => {
       navBar.classList.remove("open");
     });
</script>
</html>