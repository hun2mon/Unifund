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
    div{
    }   
    div.div_main{
        display: flex;   
    }
    div.div_right{
        width: 500px;
        height: 700px;
        display: flex;
    }
    div.div_left{
        width: 1000px;
        height: 700px;
        background-color: yellow;
        display: flex;
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
    button{
        width: 73;
        font-size: 9;
        margin-left: 5;
        border: 1px solid white;
        background-color: whitesmoke;
    }
    button:hover{
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
</style>
</head>
<body>
    <div class="div_main">
        <div class="div_left">
            <div>

            </div>
        </div>
        <div class="div_right">
            <div>
                <div class="top">
                    <div class="category" style="width: 210;">
                        카테고리 > 공
                    </div>
                    <div class="project_report" style="width: 100;">
                        <button>프로젝트 신고</button>
                    </div>
                    <div class="userID">
                        ddddddddddddddd
                    </div>
                    <div class="lisk_cnt" style="width: 30px;">
                        3333
                    </div>
                </div>
                <div><hr></div>
                <div class="top_middle">
                    <div class="middle_top">
                        <div class="project_title">
                            ${project.pro_title}
                        </div>
                        <div class="project_delete">
                            <button>프로젝트 삭제</button>
                        </div>
                        <div class="buy_list">
                            <button>구매자 리스트</button>
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
                            진행률
                        </div>
                    </div>
                    <div class="progress_bar">
                        <progress value="20"></progress>
                    </div>
                    <div class="date" id="end_date">
                        마감기한 : 2024/05/30
                    </div>
                    <div class="date">
                        공연 시작일 : 2023/05/12
                    </div>
                    <div class="money">
                        <div class="now_money">
                            현재 펀딩 모집금액
                        </div>
                        <div class="target_money" style="font-size: 12;">
                            /목표 금액
                        </div>
                    </div>
                </div>
                <div><hr></div>
                <div class="bottom_top">
                    <div class="reword_name">
                        리워드 이름
                    </div>
                    <div class="ori_price">
                        원래가격
                    </div>
                    <div class="buy_reword">
                        <div class="reword_price">
                           >> 10000원
                        </div>
                        <div class="quantity">
                            <input type="number" value="1">
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
                            1,020,000원
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
                                445 마일리지
                            </div>
                        </div>
                        <div class="mileage">
                            <div>
                                사용
                            </div>
                            <div class="use_mileage">
                                <input type="text" class="use_mileage_value">
                            </div>
                        </div>
                    </div>
                    <div>
                        우편번호
                    </div>
                    <div>
                        <input type="text" class="path">
                    </div>
                    <div>
                        주소
                    </div>
                    <div>
                        <input type="text" class="path">
                    </div>
                    <div>
                        상세주소
                    </div>
                    <div>
                        <input type="text" class="path">
                    </div>
                    <div>
                        <input type="button" value="펀딩 신청하기" class="funding_button" id="fund_apply">
                    </div>
                    <div>
                        <input type="button" value="펀딩 수정하기" class="funding_button" id="fund_update">
                    </div>
                </div>
            </div>
        </div>
    </div>
	</body>
<script>

</script>
</html>