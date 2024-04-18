<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style> 
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    div.div_main{
        display: flex;   
    }
    div.div_right{
        width: 500px;
        height: 700px;
    }
    div.div_left{
        width: 1000px;
    }
    .top{
        font-size: 12;
        display: flex;   
        margin-top: 10;
        margin-left: 5;
    }
    .top_middle,.bottom_top,.bottom{
        margin-left: 5;
    }
    .top_middle>div,.bottom_top>div,.bottom>div{
        padding-top: 10;
    }
    .top>div{
        margin-right: 10;
    }
    .userID{
        margin-left : 5;
        width: 115;
    }
    .project_bookmark{
        margin-left: 60;
        right: 0;
    }
    .project_good{
        margin-left: 5;
    }
    .project_title{
        font-size: 20px;
        font-weight: 600;
        width: 220;
    }
    .middle_top,.middle_middle,.middle_bottom,.money,.buy_reword,.total_price,.mileage{
        display: flex;
    }
    .date{
        font-size: 15px;
    }
    .report,.buy_but,.delete{
        width: 73;
        font-size: 9;
        margin-left: 5;
        border: 1px solid white;
        background-color: whitesmoke;
    }
    .report:hover{
        background-color: red;
    }
    hr{
        margin: 0;
        margin-top: 5;
    }
    .quantity{
        margin-left: 300;
    }
    input[type=number]{
        width: 50;
        height: 30;
    }
    .reword_price{
        width: 130;
        font-size: 20;
    }
    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
        -webkit-appearance: inner-spin-button;
        opacity: 1;
    }
    .path{
        width: 500;
        margin-bottom: 0;
    }
    .mileage_form{
        background-color: beige;
        padding: 10;
    }
    .mileage_form>div{
        padding: 7;
    }
    .mileage_value,.use_mileage_value{
        margin-left: 330;
    }
    .use_mileage_value{
        width: 95;
        text-align: right;
        height: 25;
        font-size: 15;
    }
    .funding_button{
        margin-left:0;
    }
    #fund_apply{
        border: 3px solid yellow;
        color: gray;
        background-color: yellow;
        width: 500;
        height: 30;
    }
    #fund_apply:hover {
        background-color: fce205;
        color: gray;
    }
    #fund_update{
        background-color: C2C3CB;
        color: gray;
        border: 0;
        width: 500;
        height: 30;
    }
    #fund_update:hover {
        background-color: gray;
        color: gray;
    }
    .final_price{
        margin-left: 240;
        text-align: right;
        width: 140;
        font-size: 20;
    }
    .detail_img{
    	width: 900;
    	margin-left: 30;
    	margin-top: 10;
    }
    .pro_content{
    	display: block;
    	text-align: center;
    	margin-top: 20;
    	width: 900;
    	margin-left: 60;
    }
    
</style>
</head>
<body>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	    <div class="div_main">
	        <div class="div_left">
	        	<div class="pro_content">
	        	​	${project.pro_content }
	        	</div>
	            <div class="detail_img">
	            	<img src="/photo/${project.pro_img_name}" class="detail_img">
	            </div>
	        </div>
	        <div class="div_right">
	            <div>
	                <div class="top">
	                    <div class="category" style="width: 210;">
	                        카테고리 >  ${project.category}
	                    </div>
	                    <div class="project_report" style="width: 100;">
	                    	<input type="button" class="report" value="프로젝트 신고" onclick="location.href='pro_update.go?pro_idx=${project.pro_idx }'">
	                    </div>
	                    <div class="userID">
	                           ${project.userId}
	                    </div>
	                    <div class="lisk_cnt" style="width: 30px;">
	                           ${project.like_cnt}
	                    </div>
	                </div>
	                <div><hr></div>
	                <div class="top_middle">
	                    <div class="middle_top">
	                        <div class="project_title">
	                            ${project.pro_title}
	                        </div>
	                        <div class="project_delete">
	                            <button class="delete">프로젝트 삭제</button>
	                        </div>
	                        <div class="buy_list">
	                            <button class="buy_but">구매자 리스트</button>
	                        </div>
	                        <div class="project_bookmark">
	                            ⭐
	                        </div>
	                        <div class="project_good">
	                            ❤
	                        </div>
	                    </div>
	                    <div class="middle_middle">
	                        <div class="project_progress">
	                            ${project.progress}% 진행
	                        </div>
	                    </div>
	                    <div class="progress_bar">
	                        <progress value="${project.progress}" max="100"></progress>
	                    </div>
	                    <div class="date" id="end_date">
	                        마감기한 : ${project.pro_deadline}
	                    </div>
	                    <div class="date">
	                        공연 시작일 : ${project.pro_startdate}
	                    </div>
	                    <div class="money">
	                        <div class="now_money">
	                            ${project.now_price}
	                        </div>
	                        <div class="target_money" style="font-size: 12;">
	                            /  ${project.target_price}
	                        </div>
	                    </div>
	                </div>
	                <div><hr></div>
	                <div class="bottom_top">
	                    <div class="reword_name">
	                        ${project.rew_name}
	                    </div>
	                    <div class="ori_price">
	                        ${project.ori_price}
	                    </div>
	                    <div class="buy_reword">
	                        <div class="reword_price">
	                           >> ${project.rew_price}
	                        </div>
	                        <div class="quantity">
	                            <input type="number" value="1" class = "quan" onclick="click_price()" onkeyup="click_price()" min="1">
	                        </div>
	                    </div>
	                </div>
	                <div><hr></div>
	                <div class="bottom">
	                    <div class="total_price">
	                        <div>
	                            총 리워드 금액
	                        </div>
	                        <div class="final_price">
	                     	   ${project.rew_price}
	                        </div>
	                    </div>
	                    <div>
	                        마일리지
	                    </div>
	                    <div class="mileage_form">
	                        <div class="mileage">
	                            <div>
	                                보유
	                            </div>
	                            <div class="mileage_value">
	                                 ${project.mileage} 마일리지
	                            </div>
	                        </div>
	                        <div class="mileage">
	                            <div>
	                                사용
	                            </div>
	                            <div class="use_mileage" >
	                                <input type="text" name="mileage" class="use_mileage_value">
	                            </div>
	                        </div>
	                    </div>
	                    <div>
	                        우편번호
	                    </div>
	                    <div>
	                        <input type="text" class="path" value=" ${project.mem_post}">
	                    </div>
	                    <div>
	                        주소
	                    </div>
	                    <div>
	                        <input type="text" class="path" value="${project.mem_addr}">
	                    </div>
	                    <div>
	                        상세주소
	                    </div>
	                    <div>
	                        <input type="text" class="path" value="${project.mem_detail}">
	                    </div>
	                    <div>
	                        <input type="button" value="펀딩 신청하기" class="funding_button" id="fund_apply" onclick="apply()">
	                    </div>
	                    <div>
	                        <input type="button" value="펀딩 수정하기" class="funding_button" id="fund_update" onclick="location.href='pro_update.go?pro_idx=${project.pro_idx }'">
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</body>
<script>
	function click_price(){
		var quantitys = $('.quan').val();
		var price = '${project.rew_price}' *quantitys;
		$('.final_price').html(price);
	}
	
	function apply() {
		var quantitys = $('.quan').val();
		var cash = '${project.cash}' + $('.use_mileage_value').val();
		var price = '${project.rew_price}' *quantitys;
		if ($('.use_mileage_value').val() < 500) {
			alert('마일리지는 500이상부터 사용 가능합니다.');
		}
		if (cash < price) {
			alert('캐시+마일리지가 구매가격보다 낮습니다.');
		}else {
			
		}
		
	}

</script>
</html>