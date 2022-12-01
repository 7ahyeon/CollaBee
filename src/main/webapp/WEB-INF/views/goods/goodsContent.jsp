<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
<%@ include file= "../common/bootstrap.jspf"%>
<%@ include file= "../common/modal/insertQnA.jspf"%>
<%@ include file= "../common/modal/insertReview.jspf"%>

</head>
<body>
<style>
    .border {
        display: inline-block;
        width: 400px;
        height: 70px;
        margin: 6px;
        padding: 11px 10px 11px 15px;
    }
    .col-3 img{
        width: 450px;
        height: 608px;
        margin-left: 50px;
    }
    .de_img img{
        width: 100%;
    }
    .col-3, .col-5 {
        margin-top: 10px; 
    }
    .sec {
        width: 560px;
    }
    #delivery{
        font-weight: 700;
        line-height: 1.36;
        letter-spacing: -0.5px;
        margin-bottom: 6px;
        width: 500px;
    }
    .name {
        display: flex;
        flex-direction: column;
    }
    .name2{
        display: flex;
        flex: 1 1 0%;
        /*box-pack: justify;*/
        justify-content: space-between;
    }
    .name2 h1 {
        width: 500px;
        font-weight: 500;
        font-size: 24px;
        color: rgb(51, 51, 51);
        line-height: 34px;
        letter-spacing: -0.5px;
        word-break: keep-all;
        margin-right: 20px;
    }
    .name h2 {
        padding-top: 5px;
        font-size: 16px;
        font-weight: 400;
        color: rgb(181, 181, 181);
        line-height: 19px;
        letter-spacing: -0.5px;
    }
    .price {
        display: flex;
        flex-direction: row;
        align-items: flex-end;
        padding-top: 19px;
        font-weight: bold;
        line-height: 30px;
        letter-spacing: -0.5px;
    }
    .pr {
        padding-right: 4px;
        font-size: 28px;
        color: rgb(51, 51, 51);
    }
    .ice {
        display: inline-block;
        position: relative;
        top: 3px;
        font-size: 18px;
        color: rgb(51, 51, 51);
        vertical-align: top;
    }
    .bo {
        display: flex;
        flex-direction: row;
        /*box-align: center;*/
        align-items: center;
        margin-top: 14px;
    }
    #bo1 {
        font-weight: 500;
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    .bo2 {
        color: rgb(51, 51, 51);
        letter-spacing: -0.5px;
        font-weight: 500;
        font-size: 14px;
    }
    .con {
        margin-top: 20px;
    }
    .deli {
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        padding: 17px 0px 18px;
        border-top: 1px solid rgb(244, 244, 244);
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    .deli dt {
        position: relative;
        top: 1px;
        width: 128px;
        height: 100%;
        color: rgb(102, 102, 102);
        line-height: 19px;
    }
    .deli dd {
            display: flex;
        flex: 1 1 0%;
        flex-direction: column;
    }
    .p1 {
        color: rgb(51, 51, 51);
        line-height: 19px;
        white-space: pre-line;
        word-break: break-all;
        overflow: hidden;
    }
    .p2 {
        display: block;
        font-size: 12px;
        color: rgb(102, 102, 102);
        padding-top: 4px;
        line-height: 16px;
        white-space: pre-line;
    }
    .seller {
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        padding: 17px 0px 18px;
        border-top: 1px solid rgb(244, 244, 244);
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    #dt1 {
        position: relative;
        top: 1px;
        width: 128px;
        height: 100%;
        line-height: 19px;
    }
    .dd1{
        display: flex;
        flex: 1 1 0%;
        flex-direction: column;
        color: rgb(51, 51, 51);
        line-height: 19px;
        white-space: pre-line;
        word-break: break-all;
        overflow: hidden;
    }
    .package{
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        padding: 17px 0px 18px;
        border-top: 1px solid rgb(244, 244, 244);
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    #dt2{
        position: relative;
        top: 1px;
        width: 128px;
        height: 100%;
        line-height: 19px;
    }
    .dd2 {
        display: flex;
        flex: 1 1 0%;
        flex-direction: column;
    }
    .p3{
        color: rgb(51, 51, 51);
        line-height: 19px;
        white-space: pre-line;
        word-break: break-all;
        overflow: hidden;
    }
    .p4 {
        display: block;
        font-size: 12px;
        color: rgb(102, 102, 102);
        padding-top: 4px;
        line-height: 16px;
        white-space: pre-line;
    }
    .sel {
        padding-bottom: 40px;
        border-bottom: 1px solid rgb(244, 244, 244);
    }
    .dl {
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        padding: 17px 0px 18px;
        border-top: 1px solid rgb(244, 244, 244);
        font-size: 14px;
        letter-spacing: -0.5px;
    }
    #dt3 {
        position: relative;
        top: 1px;
        width: 128px;
        height: 100%;
        line-height: 19px;
    }
    
    .btn1 {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-top: 12px;
        
    }
    .button {
        display: inline-flex;
        flex-direction: row;
        align-items: center;
        border: 1px solid rgb(221, 223, 225);
        width: 88px;
        border-radius: 3px;
        margin-left: 10px;
    }
    .minus{
        background-color: white;
        border: 1px solid white;
    }
    .plus{
        background-color: white;
        border: 1px solid white;
    }
    .btn btn-primary {
        background-color: #9A30AE;
    }
    
    #su{
        display: inline-flex;
        overflow: hidden;
        white-space: nowrap;
        justify-content: center;
        font-size: 14px;
        font-weight: 600;
        color: rgb(51, 51, 51);
        text-align: center;
        width: 31px;
        height: 28px;
        line-height: 28px;
    }
    
    .price2 {
        font-weight: bold;
        font-size: 12px;
        color: rgb(51, 51, 51);
        padding-right: 5px;
        margin-right: 20px;
    }
    .box1{
        padding-top: 30px;
    }
    .box2{
        letter-spacing: -0.5px;    
    }
    .box3{
        display: flex;
        /*box-pack: end;*/
        justify-content: flex-end;
        align-items: flex-end;
        margin-right: 20px;
    }
    .sp1{
        padding-right: 12px;
        font-size: 13px;
        font-weight: 500;
        color: rgb(51, 51, 51);
        line-height: 20px;
    }
    .sp2{
        font-weight: bold;
        font-size: 32px;
        color: rgb(51, 51, 51);
        line-height: 36px;
    }
    .sp3{
        padding-left: 5px;
        font-size: 20px;
        font-weight: 600;
        color: rgb(51, 51, 51);
        line-height: 30px;
    }
    .box4{
        display: flex;
        justify-content: flex-end;
        padding-top: 10px;
        margin-right: 20px;
    }
    .sp4{
        background-color: #FFCD4A;
        margin: 1px 6px;
        padding: 0px 7px;
        border-radius: 8px;
        font-size: 12px;
        font-weight: 800;
        color: white;
        line-height: 20px;
    }
    #sp5{
        line-height: 1.5;
        font-size: 1em;
    }
    .str{
        font-weight: 650;
        font-size: 17px;
    }
    .box5{
        display: flex;
    }
    .bu1{
        display: block;
        margin: 5px;
        width: 56px;
        height: 56px;
        border-radius: 3px;
        background-color: white;
        border: 1px solid lightgray;
    }
    .bi bi-heart {
        font-size: 20px;
        color: #9A30AE;
    }

    .bi bi-bell {
        font-size: 20px;
    }
    .bu2{
        width: 56px;
        height: 56px;
        background-color: white;
        border: 1px solid lightgray;
        border-radius: 3px;
        margin: 5px;
    }
    .box6{
        display: inline-block;
        font-size: 16px;
        font-weight: 500;
    }
    .sp8{
        margin: 5px;
    }
    .menu{
        width: 800px;
        height: 35px;
        /*text-align: center;*/
        z-index: 20;
        position: sticky;
        top: 56px;
        width: 100%;
        margin-top: 20px;
        margin-bottom: 20px;
        color: black;
        margin-left: 10px;
    }
    .menu ul {
        display: flex;
        flex-wrap: wrap;
        height: 60px;
        /*text-align: center;*/
        background-color:  #FEF7FF;
        background-position: 10px;;
    }
    .menu ul li {
        list-style: none;
        float: left;
        text-align: center;
        line-height: 30px;
        vertical-align: middle;
        display: flex;
    }
    .menu .link {
        width: 190px;
        text-decoration: none;
        display: flex;
        font-weight: bold;
        justify-content: center;
        align-items: center;
        height: 100%;
        text-align: center;
    }
    #demo {
        margin-left: 20px;
    }
    .review {
        margin-left: 70px;
        /*border-bottom: 1px solid rgb(244, 244, 244);*/
    }
    .qna {
        margin-left: 70px;
    }
    .sec2 ul li {
        list-style: disc;
    }
    .re_sp {
        position: absolute;
        margin-left:  left: 20px;
        font-weight: 500;
    }
    .re_bu {
        margin-right: 70px;
        justify-content: flex-end;
        font-weight: 400;
        display: flex;
        font-size: 14px;
    }
    .re_bu button {
        border: none;
        background-color: transparent;
        position: relative;
        font-size: 14px;
    }
    .notice {
        background-color: #E0E0E0;
        margin: 0;
        padding: 5px 7px;
        border-radius: 3px;
        font-size: 15px;
        font-weight: 800;
        color: dimgray;
    }
    .grade {
        border: 1px solid #692498;
        margin: 0;
        padding: 0px 3px;
        border-radius: 5px;
        font-size: 11px;
        font-weight: 800;
        color: #692498;
    }
    .review2 {
        border: none;
        margin-left: 200px;
        margin-right: 50px;
    }
    .rec_btn {
        background-color: transparent;
        border: 1px solid darkgray;
        margin: 0;
        padding: 3px 7px;
        border-radius: 15px;
        font-size: 13px;
        font-weight: 500;
        color: dimgray;
        
    }
    .thum {
        float: right;
    }
    .div_re {
        /*border-bottom: 1px solid rgb(244, 244, 244);*/
        margin-top: 20px;
        margin-bottom: 20px;
    }
    .find-btn{
        text-align: center;
        padding-top: 15px;
    }
    .find-btn1 {
        display :inline-block;
        border: black;
        width: 44px;
        height: 44px;
        border-radius: 0.5em;
    }
    .find-btn1 {
        border: solid 1px darkgray;
    }
    .find-btn2 {
        display: inline-block;
        border: 1px solid dimgray;
        width: 44px;
        height: 44px;
        border-radius: 0.5em;
    }
    .find-btn2:hover {
        border: solid 1px darkgray;
    }
    table {
        border: 1px solid black;
        width: 95%;
    }
    .card{
        border: white;
       }

      .card-header{
        background-color: white;
        height: 55px;
        padding-top: 13px;
      }
      .card-header a{
        color: black;
        text-decoration: none;
        vertical-align: middle;
      }
      .card-header div{
        text-align: center;
        font-size: 10.5pt;
      }
    .card-body{
        border-top-color: white;
      }
    .clicked {
        font-weight: 900;
      }
    .panel-faq-container {
      margin-bottom: -16px;
    }
    .panel-faq-title {
      color: black;
      cursor: pointer;
    }
    .panel-faq-answer {
      height: 0;
      overflow: hidden;
      /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
      왜? 닫기 버튼을 누를 때 변화가 티남 */
      transition: all 1s;
    }
    #btn-all-close {
      margin-bottom: 10px;
      background-color: white;
      border: none;
      cursor: pointer;
      padding: 10px 25px;
      float: right;
    }
    #btn-all-close:hover {
        transition: all 0.35s;
    }
    .active {
      display: block;
      /* 높이를 정해줘야지만 transition이 적용됨 */
      height: 300px;
    }
    tbody tr {
        border-bottom-color: lightgray;
        border-bottom-width: 2px;;
    }
    .table {
        text-align: center;
    }
    .i-heart {
        font-size: 25px;
    }
    .i-bell {
        font-size: 25px;
    }
    .main {
        color: #9A30AE;
        font-weight: bold;
    }
    .main2{
        color: #9A30AE;
        font-weight: bold;
    }
    .main3 {
        color: #9A30AE;
    }

</style>  
  
<script>
    
    //후기 추천순/최근등록순
    $(function(){
            $(".review-opt").click(function(){
                changeFontWeight();
                console.log(event.target);
                event.target.style.fontWeight = '900';
            });
        });
    
    function changeFontWeight(){
        $(".review-opt").each(function(){
            $(this).css('fontWeight', '200');
        })
    }

    //클릭시 찜하기/알람버튼 색 변경
    $(document).ready(function(){
      $(".bu1").click(function(){
        $(".i-heart").toggleClass("main");
      });
    });
    
    $(document).ready(function(){
        $(".bu2").click(function(){
            $(".i-bell").toggleClass("main2");
        });
    });
    
    //클릭시 추천수 색 변경
    $(document).ready(function(){
        $(".rec_btn").click(function(){
            $(this).toggleClass("main3");
        });
    });
    
    function recBtn () {
        var tmp = document.getElementById("thumbsup").toggleClass;
        tmp++;
        
        document.getElementById("thumbsup").value = tmp;
    }
    
    
    //닫기/자세히보기
    $(function(){
        $(".btn-primary").click(function(){
            if ($(this).html() == '자세히보기') {
                $(this).html('닫기');
            } else {
                $(this).html('자세히보기');
            }
        });
    });
    
    
    //수량증가
    function minus(){
        var tmp = document.getElementById("su").value;
        
        if(document.getElementById("su").value == 1) {
            $(".minus").prop('disabled', true);
        } else {
            $(".minus").prop('disabled', false);
            tmp--;
            document.getElementById("su").value = tmp;
        }  
    };
    
    function plus(){
        var tmp2 = document.getElementById("su").value;
        tmp2++;
        
        document.getElementById("su").value = tmp2;
    }
    
    // 수량에 따른 총 가격 증가/감소
    $().ready(function(){
        $(".amount").change(changePrice);
    });
    
    function changePrice() {
        let totalValue = parseInt($("#total").val());
        
        if(this.onclick == plus) {
            totalValue += parseInt(this.value);
        } else if (this.onclick == minus) {
            totalValue -= parseInt($(this).val());
        }
        //최종 금액
        $("#total").val(totalValue);
    }
    
    //아코디언
    window.onload = function () {
      // panel-faq-container
      const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체

      // panel-faq-answer
      let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

      // btn-all-close
      const btnAllClose = document.querySelector("#btn-all-close");

      // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
      for( let i=0; i < panelFaqContainer.length; i++ ) {
        panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
          // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
          panelFaqAnswer[i].classList.toggle('active');
        });
      };

      btnAllClose.addEventListener('click', function() {
        // 버튼 클릭시 처리할 일  
        for(let i=0; i < panelFaqAnswer.length; i++) {
            panelFaqAnswer[i].classList.remove('active');
        };
      });
    }
    
</script>    
</head>
<body style="width: 1900px; margin: auto;">
	<header>
		<%@ include file= "../common/header.jspf"%>
	</header>

<!-- main -->
<div class="container-fluid">
  <div class="row" style="padding-top: 50px; padding-bottom: 50px;">
    <div class="col-2" style="background-color:white;">왼</div>
	    <!-- 상세 메인 -->  
	    <div class="col-3" style="width: 550px; height: 708px;">
	        <img src="image/1.jpg" alt="크림파스타">  
	    </div>
	    
    	<div class="col-1"></div>
    	
    	<div class="col-4">
	    	<section class="sec">
	        <div id="delivery" class="text-secondary">샛별배송</div>
	        <div class="name">
	            <div class="name2">
	                <h1>[최현석의 쵸이닷] 트러플 크림 뇨끼</h1>
	            </div>    
	                <h2 class="text-secondary">부드럽고도 강렬한 풍미</h2>    
	        </div>
	            <h2 class="price">
	                <span style="color: red; margin-right: 10px;">10%</span>
	                <span class="pr">6,750</span>
	                <span class="ice">원</span>
	            </h2> 
	            <span style="text-decoration:line-through">7,500원</span>
	        <div class="bo">
	            <span id="bo1" class="text-secondary"> 일반 0.1% &nbsp;|&nbsp; </span>
	            <span class="bo2">개당
	                <strong> 8원 적립</strong>
	            </span>
	        </div>
	    <div class="con">
	            <dl class="deli">
	                <dt class="text-dark">배송</dt>
	                <dd>
	                    <p class="p1">샛별배송</p>
	                    <p class="p2">23시 전 주문~~~~`</p>
	                </dd>
	            </dl>
	            <dl class="seller">
	                <dt id="dt1" class="text-dark">판매자</dt>
	                <dd class="dd1">컬리</dd>
	            </dl>
	            <dl class="package">
	                <dt id="dt2" class="text-dark">포장타입</dt>
	                <dd class="dd2">
	                    <p class="p3">냉동(종이포장)</p>
	                    <p class="p4">택배배송 ~~~~</p>
	                </dd>
	            </dl>
	    </div>
	        <div class="sel">
	            <dl class="dl">
	                <dt id="dt3" class="text-dark">상품선택</dt>
	                <div class="container">
	                    <span class="border">[최현석어쩌구]</span>
	                    <div class="btn1">
	                    <div class="button">
	                        <button type="button" class="minus amount" onclick="minus()">
	                            <i class="bi bi-dash"></i>
	                        </button>
	                        <input type="text" id="su" value="1" style="border: none;" />
	                        <button type="button" class="plus amount" onclick="plus()">
	                            <i class="bi bi-plus"></i>
	                        </button>
	                    </div>
	                    <div>
	                        <span style="text-decoration:line-through; font-size:14px;">7,500원</span>
	                        <span class="price2" style="font-size:14px;">6,750원</span>
	                    </div>
	                    </div>    
	                </div>    
	            </dl>    
	        </div>    
	         <!-- 상세 메인 상품 선택 (장바구니넣기) -->
	        <div class="box1">
	            <div class="box2">
	                <div class="box3">
	                    <span class="sp1">총 상품금액 : </span>
	                    <span class="sp2" id="total">6,750</span>
	                    <span class="sp3">원</span>
	                </div>
	                <div class="box4">
	                    <span class="sp4">적립</span>
	                    <span id="sp5" class="text-dark">구매 시
	                        <strong class="str">8원 적립</strong>
	                    </span>
	                </div>
	            </div>
	        </div>
	        
	        <div class="box5">
	            <button class="bu1" id="heart" onclick="vio()">
	                <div class="i-heart">
	                    <i id="heart " class="bi bi-heart"></i>
	                </div>
	            </button>
	            <button class="bu2" disabled>
	                <div class="i-bell">
	                <i id="bell" class="bi bi-bell"></i>
	                </div>    
	            </button>
	            <div class="btn">
	                <button class="btn btn-primary3 active" style="width: 400px; height: 55px; color: white; 
	                background-color: #692498; border: #692498; text-align: center">장바구니 담기
	                </button>
	            </div>
	        </div>
	        
	    </section>
    	</div>
    
    <div class="col-2" style="background-color:white;">오</div>
  </div>
    
  <div class="row">
    <div class="col-2" style="background-color:white;">왼</div>
    <div class="col-8">
    <br><br><br>
        <!-- 상품 설명 -->
        <nav class="menu">
            <ul style="margin-right: 20px; background-color: #DCDCDC;  text-align: center;">
                <li>
                    <a class="link" href="#pro-de" style="color: black; font-weight: bold; margin-left: 250px;">상품 설명 </a>
                </li>
                <li style="margin-right: 20px; margin-left: 30px;">
                    <a class="link" href="#pro-re" style="color: black; font-weight: bold; ">
                        후기(9999+)
                    </a>
                </li>
                <li>
                    <a class="link" href="#pro-q" style="color: black; font-weight: bold;">
                        문의
                    </a>
                </li>
            </ul>  
        </nav>    

        <!-- 상품 설명 (교환 / 배송 / 취소) -->
        <div>
            <a id="pro-de"></a>
            <div style="text-align: center;" class="de_img">
                
                <img src="image/de.jpeg" alt="상세이미지">
                    
            </div>
            <hr>
            <div class="container">
                
                <div class="border" style="width: 950px; height: 55px;">
                  <strong style="color: #692498; float: left; margin-right: 30px;">교환 및 환불 안내</strong>
                  <p style="float: left;">교환 및 환불이 필요하신 경우 고객행복센터로 문의해주세요.</p>
                   
	                <div class="close-btn">
		                <button type="button" class="btn btn-primary" data-toggle="collapse" 
		                data-target="#demo" style="background-color: transparent; border: none; color: #9A30AE; 
		                float: right;" onclick="changeName()" id="close">닫기</button>
	                </div>
                </div>     
                <br>
               
              <div id="demo" class="collapse show">
                <div>
                        <strong style="font-size: 16px;">01. 상품에 문제가 있는 경우</strong>
                        <div style="font-size: 14px; color: dimgray;">
                            <p> - 받으신 상품이 표시&#183;광고 또는 계약 내용과 다른 경우에는 상품을 받은 날부터 3개월 이내, <br>
                            그 사실을 알게 된 날부터 30일 이내에 교환 및 환불을 요청하실 수 있습니다.</p>
                            <span> &#8251; 배송 상품에 문제가 있는 것으로 확인되면 배송비는 콜라비가 부담합니다.</span>
                        </div>    
                    </div>
                  <br>
                        <div>
                            <strong style="font-size: 16px;">02. 단순변심, 주문 착오</strong>
                            <div style="font-size: 14px; color: dimgray;">
                                <strong> - 신선/냉장 / 냉동 식품</strong>
                                <p>재판매가 불가한 상품의 특성상, 단순 변심, 주문 착오 시 교환 및 반품이 어려운 점 양해 부탁드립니다.<br>
                                상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느끼실 수 있습니다.</p>
                                <strong> - 유통기한 30일 이상 식품(신선 / 냉장 / 냉동 제외) &amp; 기타상품</strong>
                                <p>상품을 받은 날부터 7일 이내에 고객행복센터로 문의해주세요.</p>
                                <span> &#8251; 단순 변심으로 인한 배송 상품 교환 또는 환불의 경우 고객님께서 배송시 6,000원을 부담하셔야 합니다. <br> (주문건 배송비를 결제하셨을 경우 3,000원)
                                </span> 
                                </div><br>    
                        </div>
                  <br>
                        <div>
                            <strong style="font-size: 16px;">03. 교환/반품 불가</strong>
                            <p style="font-size: 14px; color: dimgray;"> - 다음에 해당하는 교환&#183;환불 신청은 처리가 어려울 수 있으니 양해 부탁드립니다.</p>
                                <div style="font-size: 14px; color: dimgray;">
                                <ul>
                                    <li>고객님의 책임 있는 사유로 상품이 멸실되거나 훼손된 경우<br>(단, 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외)</li>
                                    <li>고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우</li>
                                    <li>시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한 경우</li>
                                    <li>복제가 가능한 상품의 포장이 훼손된 경우</li>
                                    <li>고객님의 주문에 따라 개별적으로 생산되는 상품의 제작이 이미 진행된 경우</li>
                                </ul>
                                </div>    
                        </div>
              </div>
            </div>
            <hr>

            <div class="container">
                <div class="border" style="width: 950px; height: 75px;">
              <strong style="color: #692498; float: left; margin-right: 30px;">주문취소안내</strong>
              <p style="float: left;">
                <strong>- [주문완료] 상태일 경우에만 주문 취소 가능합니다. <br>
                        - [마이컬리 > 주문내역 상세페이지] 에서 직접 취소하실 수 있습니다.
                </strong>
              </p>
                
                <div class="close-btn">
              <button type="button" class="btn btn-primary" id="close" data-toggle="collapse" 
              data-target="#demo2" style="background-color: transparent; border: none; color: #9A30AE; 
              float: right;" onclick="changeName()"> 닫기  
              </button>
                </div> 
                </div>
              <div id="demo2" class="collapse show" style="margin-left: 20px;">
                <div>
                      <strong style="line-height: 25px; font-size: 16px;">주문취소관련</strong>
                            <p style="padding: 2px 20px 0px 0px; line-height: 22px; font-size: 14px; color: dimgray;">
                                - [배송준비중] 부터는 취소가 불가하니, 반품으로 진행해주세요. (상품에 따라 반품이 불가할 수 있습니다.) <br>
                                - 주문마감 시간에 임박할수록 취소 가능 시간이 짧아질 수 있습니다. <br>
                                - 비회원은 app 또는 모바일 웹사이트에서 [마이컬리 > 비회원 주문조회 페이지] 에서 취소가 가능합니다. <br>
                                - 일부 예약상품은 배송 3~4일 전에만 취소 가능합니다. <br> 
                                - 주문상품의 부분취소는 불가능합니다. 전체 주문 취소 후 다시 구매해 주세요. 
                            </p>
                        </div>
                  <br>
                        <div>
                            <strong style="font-size: 16px;">결제 승인 취소 / 환불 관련</strong>
                            <p style="font-size: 14px; color: dimgray;">
                                - 카드 환불은 카드사 정책에 따르며, 자세한 사항은 카드사에 문의해주세요. <br>
                                - 결제 취소시, 사용하신 적립금과 쿠폰도 모두 복원됩니다.
                            </p>
                        </div>
              </div>
            </div>
            <hr>

            <div class="container">
                <div class="border" style="width: 950px; height: 55px;">
                  <strong style="color: #692498; float: left; margin-right: 30px;">배송관련 안내</strong>
                  <p style="float: left;">
                    배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.
                  </p>
                </div>
            </div>    
        </div>
    
    <!-- 상품 리뷰 -->
        <br><br><br><br><br>
    <div class="review">
        <a id="pro-re"></a>
        <div>
            <button type="button" class="btn btn-primary2" data-toggle="modal" data-target="#myModal" 
            style="float: right; margin-right: 70px; background-color: #692498; border: 1px solid #692498; 
            color: white; font-weight: 700; width: 130px; height: 40px; border-radius: 0;">
            <span>리뷰작성</span></button>
            
        </div>
        <section class="sec2">
            <header style="margin-bottom: 10px;">
                <strong style="font-size: 20px;">상품후기</strong>
            </header>
                <strong style="margin-top: 20px; color: dimgray;">사진후기 100원, 글후기 50원 적립금 혜택이 있어요.</strong>
            <ul class="text-secondary" style="margin-top: 5px;">
                <li>퍼플, 더퍼플은 2배 적립 (사진 200원, 글 100원)</li>
                <li>후기 작성은 배송완료일로부터 30일 이내 가능합니다.</li>
                <li>작성하신 후기는 바로 적립금이 지급됩니다.</li>
            </ul>
            <div style="margin-top: 25px; margin-bottom: 20px;">
                <span class="re_sp">총 14,646개</span>
                <div id="review-re" class="re_bu">
                    <button class="review-opt">추천순</button> | 
                    <button class="review-opt">최근등록순</button>
                </div>
            </div>    
            <div class="container" style="width: 100%; margin-left: -20px;">

                <tr>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">
                        <span class="notice">공지</span> &nbsp;&nbsp;&nbsp;
                        금주의 베스트 후기 안내
                        </p>
                      <div class="panel-faq-answer">
                        <p>* 베스트 후기 당첨자 안내
                            안녕하세요~~ <br></p>
                      </div>
                    </div>
                  </td>
                </tr>
            </div><br>
                <div class="container" style="margin-left: -20px;">
                <tr>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">
                        <span class="notice">공지</span> &nbsp;&nbsp;&nbsp;
                        상품 후기 적립금 정책 안내
                        </p>
                      <div class="panel-faq-answer">
                        <p> [금주의 Best 후기 및 상품 후기 적립금 정책 변경 안내]
                            고객님 안녕하세요~~<br></p>
                      </div>
                    </div>
                  </td>
                </tr>      
                </div>
                
            <div class="div_re">
                <div>
                    <div>
                        <span class="grade">등급</span>
                        <span>홍길동</span>
                    </div>
                </div>
                <article>
                    <div class="review2">
                        <div>
                            <h3 style="font-size: 1em; color: darkgray">[최현석의 어쩌구]</h3>
                        </div>
                        <p style="margin-top: 15px;">
                            맛있어요 어쩌구구구구ㅜ국ㄱㄱ~~~ <br>
                            존맛존맛존맛챙애챙태애태애태ㅐ앵ㅇ<br>
                            ㅎ우와웅오아ㅜ오아ㅜ아와오아<br>
                            와아와와오아<br>
                        </p>
                        <div>
                            후기사진(버튼태그-누르면 알림창)
                        </div>
                        <footer style="margin-top: 15px;">
                            <div>
                                <span>2022-11-18</span>
                            </div>
                            <!--<div class="form-thumb" style="inline-block;">
                                <input class="form-thumb-input" type="button" value="" id="thumbs-up">
                                <label id="bb" class="form-thumb-label" for="thumbs-up">
                                    도움돼요
                                </label>
                                <input type="text" value="1" style="border: none; background-color: transparent;">
                            </div>-->
                            <button class="rec_btn" style="float: right;" onclick="recBtn">
                                <div class="thumbs-up">
                                <i class="bi bi-hand-thumbs-up"></i>
                                <span class="thum">도움돼요</span>
                                <input type="text" value="1" id="thumbsup" style="border: none; background-color: transparent; width: 20px;">    
                                <!--<span>0</span>-->
                                </div>    
                            </button>
                        </footer>
                    </div>
                </article>
            </div>
            <div class="find-btn" style="margin-right: 70px;">
                <button class="find-btn1" disabled>
                    <i class="bi bi-chevron-left"></i>
                </button>
                <button class="find-btn1">
                    <i class="bi bi-chevron-right"></i>
                </button>
            </div>
        </section>  
    </div>
      <br><br><br>
      
    <!-- 상품 문의 -->    
    <div class="qna" style="margin-bottom: 20px;">
        <a id="pro-q"></a>
        <div>
            <div>
                <button type="button" class="btn btn-primary2" data-toggle="modal" data-target="#myModal2" 
                id="promptStart" style="float: right; margin-right: 70px; background-color: #692498; 
                border: 1px solid #692498; color: white; font-weight: 700; width: 130px; height: 40px; border-radius: 0;">
                <span>문의하기</span>
                </button>
 
            </div>
            <div>
                <strong style="font-size: 20px;">상품 문의</strong>
                <ul class="text-secondary" style="margin-top: 10px;">
                    <li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
                    <li>배송관련, 주문(취소/교환/환불) 관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.</li>
                </ul>
            </div>
            
            <div class="container" style="margin-right: 70px; margin-left: -20px; background-color: white;">
            <br>
            <table class="table table-white" style="border: none;">

              <thead class="thead-white text-center">
                <tr>

                  <th width="55%">제목</th>
                  <th width="15%">작성자</th>
                  <th width="15%">작성일</th>
                  <th width="15%">답변상태</th>
                </tr>
              </thead>
              <tbody class="text-center">
                <tr>
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">
                        <span class="notice">공지</span>
                        판매(일시) 중단 제품 안내
                        </p>
                      <div class="panel-faq-answer">
                        <p>안녕하세요 컬리입니다 ~ <br>
                            하기와 같은 사유로 판매 중단 ~~~</p>
                        <p>~~~ㄹㅇ너롸너ㅘㅈㄷ</p>
                        <p>ㄴ~~니ㅏ러니ㅏㅇㄹ</p>
                      </div>
                    </div>
                  </td>
                  <td>컬리</td>
                  <td>2022-11-17</td>
                  <td>-</td>
                </tr>
                <tr>

                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">유통기한 언제까지 인가요</p>
                      <div class="panel-faq-answer">
                        <p>지금 주문해서 수령하는 상품 유통기한이 ~~</p>
                        <p>유이라너이ㅏㅈ</p>
                        <p>언제엊ㄴ젱언제</p>
                      </div>
                    </div>
                  </td>
                  <td>홍길동</td>
                  <td>2022-11-22</td>
                  <td>답변대기</td>
                </tr>
                <tr>

                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">비밀글입니다
                      <i class="bi bi-lock"></i></p>
                      <div class="panel-faq-answer">
                        <p>Answer (3) ... ↓</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                          et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                          aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                          dolore eu fugiat nulla pariatur.</p>
                        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                          laborum.</p>
                      </div>
                    </div>
                  </td>
                  <td>아무개</td>
                  <td>2022-11-19</td>
                  <td>답변완료</td>
                </tr>
                <tr>

              </tbody>
            </table>
          </div>
            
            <div class="find-btn" style="margin-right: 50px;">
                <button class="find-btn1" disabled>
                    <i class="bi bi-chevron-left"></i>
                </button>
                <button class="find-btn2">
                    <i class="bi bi-chevron-right"></i>
                </button>
            </div>
        </div>        
    </div>
    </div>
    
    
    <div class="col-sm-2" style="background-color:white;"></div>

</div>  
</div>

	<footer>
		<%@ include file= "../common/footer.jspf"%>
	</footer>

</body>
</html>