<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:scriptlet> pageContext.setAttribute("newline", "\n"); </jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
<%@ include file= "../common/bootstrap.jspf"%>
<%@ include file= "../common/modal/insertQnA.jspf"%>
<%@ include file= "../common/modal/insertReview.jspf"%>
<%@ include file= "../common/modal/answer.jspf"%>
<%@ include file= "../common/modal/updateQnA.jspf"%>
<%@ include file= "../common/modal/updateReview.jspf"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
        .mypage-top4{
      padding: 20px 0px 15px 0px;
    }
    .inquiryPro-col {
      text-align: center; 
      padding: 20px 0px; 
      border-top: 2px solid black;
      border-bottom: 1px solid black;
    }
    .inquiryPro-row {
      text-align: center; 
      padding: 20px 0px; 
      border-bottom: 1px solid lightgray;
      font-size: small;
    }
    .inquiryPro-Area {
      padding: 20px 26px 0px 100px;
    }
    
    .inquiryPro-col> div {
      font-weight: bold;
      font-size: small;
      letter-spacing: -1px;   
    }
    .answerPro {
      list-style-type: none;
    }
    .answerPro-row {
      padding: 20px 0px;
    }
    .answerPro-Area {  
      padding: 20px 26px 30px 100px;
    }
    
        /* 상품문의 썸네일 */
    .Q_proImg {
      border: 1px solid slateblue;
      width: 60px;
      height: 60px;
      margin-left: 20px;
    }
    
    /* 문의글 메뉴(제목) */
    .Q_titleWrap { 
      width: 640px; 
      text-align: center;
    }
    
    /* 문의글 제목 */
    .Q_titleWrapCon {
      width: 640px; 
      text-align: left; 
      margin-left: 20px;
    }
    
    .pro_name {
      margin-top: 10px;
    }
    /* 작성일 */
    .Q_date {
      width: 220px;
    }
    .Q_writer {
        width: 220px;
    }
    /* 답변상태 */
    .Q_state {
      width: 220px;
    }
    
    .category > span {
      font-size: small;
      color: #666666;
    }

    .category {
      margin-bottom: 20px;
    }
    
    .inquiryPro-Area {
      margin-bottom: 40px;
    }
    .answerPro-Area {
      margin-bottom: 40px;
      background-color: #FEF7FF;
    }
    .iconArea {
      border: 1px solid slateblue;
      width: 24px;
      height: 24px;
    }
    .content {
      margin-left: 10px;
      font-size: small;
      font-weight: lighter;
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

    //찜하기
     /* $(document).on("click", "#btn-heart", function(){
    	if (${member.id} == null || ${member.id == ""}) {
    		href = "/login.do";
    	} else if (${member.id} != null || ${memeber.id != ""}) {
	    	$.ajax({
	    		url : "../mypage/picklist.do",
	    		type : "GET",
	    		data : JSON.stringify({memberNum : ${memberVO.memberNum}, productNum : productNum}),
	    		contentType: "application/json",
	            dataType: "json",
	    		success : function(selectHeart){
	    			let html = '';
	    			html += '<span>';
	    			if(buttonHeart == "clicked") {
	    				html += '<i class="bi bi-heart" style="color:#9A30AE"></i>'
	    			} else {
	    				html += '<i class="bi bi-heart"></i>'
	    			}
	    			html += '</span>'
	    		}
	    	})
	    })
    		
    	}  */
    
$(function(){
    	
     function getJsonHeart(memberId, goodsNum) {
    	var sendData = {
    			id : memberId,
    			productNum : goodsNum
    	};
    	
    	$.ajax({
    		type: "POST",
    		url: "picklist.do",
    		data: JSON.stringify(sendData),
    		contentType: "application/json",
    		dataType: "json",
    		success: function(data){
    			alert("성공");
    		},
    		error: function() {
    			alert("실패");
    		}
    	});
    } 	
  });
    		
    	/* alert("getJsonHeart() 실행 ~");
    	
    	$.ajax("../mypage/picklist.do"), {
    		type: "get",
    		data: $(frm).serialize(),
    		contentType: "application/json",
    		dataType: "json",
    		success: function(data){
    			alert("성공 ~~");
    			console.log(data);
    			
    			let dispHtml = "";
    			dispHtml += '<span>'
    			if()
    		}
    	}
    }  */
    	
    //문의 비밀글
    $(document).on("click", "#btn-secret", function(){
    	
    })
    
    //클릭시 찜하기/알람버튼 색 변경
    /* $(document).ready(function(){
      $(".bu1").click(function(){
        $(".i-heart").toggleClass("main");
      });
    }); */
    
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
    
    //리뷰 삭제
     /* $(".re-delete").click(function(){
    	var reviewNum = $(this).prop('value');
    	var productName = $(this).prop('name');
    	if (productName.length > 22) {
    		var productName1 = productName.substring(0, 22);
    		var productName2 = productName.substring(22, productName.length+1);
    		var productN = productName1 + '<br/>' + productName2;
    	} else {
    		var productN = productName;
    	}
	    	Swal.fire({
	            title: '삭제하시겠습니까?',
	            text: "삭제하시면 다시 복구시킬 수 없습니다.",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#9A30AE',
	            cancelButtonColor: '#FFCD4A',
	            confirmButtonText: 'YES',    
	          }).then((result) => {
	            if (result.isConfirmed) {
	            	delete_one(reviewNum);
	              Swal.fire(
	            		  icon: 'success',
	            		  title:'삭제되었습니다.',
	            		  showConfirmButton: false,
	            		  timer: 1500
	              )
	            }
	          });
    	
    	
    });
    
    function delete_one(reviewNum) {
    	var del = new Array();
    	$.ajax({
    		type: "POST",
    		url: "deleteReview.do",
    		success: function(result){
    			alert("성공");
    			if (result == 1) {
    				location.reload();
    			}
    		},
    		error: function(){
    			alert("실패";)
    		}
    	})
    }  */
    
    
    //insertReview
    function insertReview(){
		var frm = document.getElementById('frm2');
		alert("후기 작성");
		console.log(frm);
		frm.action="insertReview.do";
		frm.submit();
	}
    
    //updateReview
     function updateReivew(){
    	var frm = document.getElementById('updateR');
    	console.log(frm);
    	frm.action ="updateReview.do";
    	frm.submit();
    } 

	//파일명가져오기
	

	/* function insertQuestion() {
		var frm = document.frm;
		console.log(frm);
		if (frm.qTitle.value == "" || frm.qContent.value == ""){
			if(frm.qTitle.value == ""){
				alert("제목을 입력해 주세요.")
			} else if(frm.qContent == ""){
				alert("내용을 입력해 주세요.");
			}
			return false;
		} else {
			frm.action = "insertQnA.do"
			frm.submit();
			alert("문의 등록 완료 ~");
		}
	} */
	
	//insertQnA
	function insertQuestion(){
		var frm = document.getElementById('frm');
		console.log(frm);
		frm.action = "insertQnA.do";
		frm.submit();
	}
	
	/* $(".updateQna").click(function(){
		var data = $(this).data('num');
		$("#text-title.text").val(data);
		$("#comment.textarea").html(data);
	}) */
	
	
	 /* function updateQuestion(){
		var frm = document.getElementById('updateQ');
		console.log(frm);
		frm.action ="updateQnA.do";
		frm.submit();
	}  */
	
	
	
	
	//문의 삭제
	
	/*  $(".q-delete").click(function(){
    	var qnaNum = $(this).prop('value');
    	var productName = $(this).prop('name');
    	if (productName.length > 22) {
    		var productName1 = productName.substring(0, 22);
    		var productName2 = productName.substring(22, productName.length+1);
    		var productN = productName1 + '<br/>' + productName2;
    	} else {
    		var productN = productName;
    	}
	    	Swal.fire({
	            title: '삭제하시겠습니까?',
	            text: "삭제하시면 다시 복구시킬 수 없습니다.",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#9A30AE',
	            cancelButtonColor: '#FFCD4A',
	            confirmButtonText: 'YES',    
	          }).then((result) => {
	            if (result.isConfirmed) {
	            	delete_qna(qnaNum);
	              Swal.fire(
	            		  icon: 'success',
	            		  title:'삭제되었습니다.',
	            		  showConfirmButton: false,
	            		  timer: 1500
	              )
	            }
	          });
    	
    	
    });
    
    function delete_qna(qnaNum) {
    	var del = new Array();
    	$.ajax({
    		type: "GET",
    		url: "deleteReview.do",
    		success: function(result){
    			alert("성공");
    			if (result == 1) {
    				location.reload();
    			}
    		},
    		error: function(){
    			alert("실패";)
    		}
    	})
    }  */
	
	
    
</script>    
</head>
<body style="width: 1900px; margin: auto;">
	<header>
		<%@ include file= "../common/header.jspf"%>
	</header>

<!-- main -->
<div class="container-fluid">
  <div class="row" style="padding-top: 50px; padding-bottom: 50px;">
    <div class="col-2" style="background-color:white;"></div>
	    <!-- 상세 메인 -->  
	    <div class="col-3" style="width: 550px; height: 708px;">
	        <img src="../resources/imgs/goods/${goods.thumSysFilename }" alt="크림파스타">  
	    </div>
	    
    	<div class="col-1"></div>
    	
    	<div class="col-4">
	    	<section class="sec">
	        <div id="delivery" class="text-secondary">${goods.deliveryType }</div>
	        <div class="name">
	            <div class="name2">
	                <h1>${goods.productName }</h1>
	            </div>    
	                <h2 class="text-secondary">${goods.pDescription }</h2>    
	        </div>
	            <h2 class="price">
		            <c:if test="${not empty goods.disRate }">
		            <div style="display: flex; flex-direction: column; justify-content: center; float: left; margin-right: 10px;">	
		            	<div>
		                <span style="color: red; margin-right: 10px;">${goods.disRate }%</span>
		                <span class="pr"><fmt:formatNumber value="${goods.saleprice }" pattern="#,###" /></span>
		                <span class="ice">원</span>
		                </div>
		                <div>
				            <span style="text-decoration:line-through; font-size: 18px;" class="text-secondary"><fmt:formatNumber value="${goods.price }" pattern="#,###" />원</span>
		                </div>
		            </div>  
		            </c:if>
		            <c:if test="${empty goods.disRate }">
		            	<span><fmt:formatNumber value="${goods.price }" pattern="#,###" />원</span>
		            </c:if>
	            </h2> 
	        <div class="bo">
	        	<c:if test="${not empty login.id }">
		            <span id="bo1" class="text-secondary"> ${member.grade } ${membership.saverate }일반 0.1% &nbsp;|&nbsp; </span>
		            <span class="bo2">개당
		                <strong> 8원 적립</strong>
		            </span>	
	        	</c:if>
	        	<c:if test="${empty login.id }">
	        		<span id="bo1" class="text-secondary">로그인 후, 적립 혜택이 제공됩니다.</span>
	        	</c:if>
	        </div>
	    <div class="con">
	            <dl class="deli">
	                <dt class="text-dark">배송</dt>
	                <dd>
	                    <p class="p1">${goods.deliveryType }</p>
	                    <p class="p2">${goods.pDescription }</p>
	                </dd>
	            </dl>
	            <dl class="seller">
	                <dt id="dt1" class="text-dark">판매자</dt>
	                <dd class="dd1">${goods.seller }</dd>
	            </dl>
	            <dl class="package">
	                <dt id="dt2" class="text-dark">포장타입</dt>
	                <dd class="dd2">
	                    <p class="p3">${goods.condition }</p>
	                    <p class="p4">택배배송 ~~~~</p>
	                </dd>
	            </dl>
	    </div>
	    
	            <form action="cart.do" method="POST" enctype="multipart/form-data">
	        <div class="sel">
	            <dl class="dl">
	                <dt id="dt3" class="text-dark">상품선택</dt>
	                <div class="container">
	                    <span class="border">${goods.productName }</span>
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
	                        <span style="text-decoration:line-through; font-size:14px;"><fmt:formatNumber value="${goods.price }" pattern="#,###" />원</span>
	                        <span class="price2" style="font-size:14px;"><fmt:formatNumber value="${goods.saleprice }" pattern="#,###" />원</span>
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
	                    <c:if test="${not empty goods.disRate }">
	                    <span class="sp2" id="total"><fmt:formatNumber value="${goods.saleprice }" pattern="#,###" /></span>
	                    <span class="sp3">원</span>
	                    </c:if>
	                    <c:if test="${empty goods.disRate }">
		            	<span><fmt:formatNumber value="${goods.price }" pattern="#,###" />원</span>
		            	</c:if>
	                </div>
	                <c:if test="${not empty login.id }">
	                <div class="box4">
	                    <span class="sp4">적립</span>
	                    <span id="sp5" class="text-dark">구매 시
	                        <strong class="str">8원 적립</strong>
	                    </span>
	                </div>
	                </c:if>
	                <c:if test="${empty login.id }">
	                	<span id="bo1" class="text-secondary" style="margin-left: 335px;">로그인 후, 적립 혜택이 제공됩니다.</span>
	                </c:if>
	            </div>
	        </div>
	        
	        <div class="box5">
	            <button class="bu1" id="btn-heart" type="button" 
	            onclick="getJsonHeart('${memberVO.id}','${goods.productNum}')">
	                <div class="i-heart">
	                    <i id="heart " class="bi bi-heart"></i>
	                </div>
	            </button>
	            <c:if test="${goods.stock != 0 }">
	            <button class="bu2" disabled type="button" disabled>
	                <div class="i-bell">
	                <i id="bell" class="bi bi-bell"></i>
	                </div>    
	            </button>
	            </c:if>
	            <c:if test="${goods.stock == 0 }">
	            <button class="bu2" disabled type="button">
	                <div class="i-bell">
	                <i id="bell" class="bi bi-bell"></i>
	                </div>    
	            </button>
	            </c:if>
	            <div class="btn">
	                <input class="btn btn-primary3 active" type="button" style="width: 400px; height: 55px; 
	                color: white; background-color: #692498; border: #692498; text-align: center" value="장바구니 담기">
	                <input type="hidden" name="id" value="${member.id}">
	            </div>
	       		</form> 
	        </div>
	    </section>
    	</div>
    
    <div class="col-2" style="background-color:white;"></div>
  </div>
    
  <div class="row">
    <div class="col-2" style="background-color:white;"></div>
    <div class="col-8">
    <br><br><br>
        <!-- 상품 설명 -->
        <nav class="menu">
            <ul style="margin-right: 20px; background-color: #DCDCDC;  text-align: center;">
                <li>
                    <a class="link" href="#pro-de" style="color: black; font-weight: bold; margin-left: 250px;">상품 설명 </a>
                </li>
                <li style="margin-right: 20px; margin-left: 30px;">
                    <a class="link" href="#pro-re" style="color: black; font-weight: bold; ">후기</a>
                </li>
                <li>
                    <a class="link" href="#pro-q" style="color: black; font-weight: bold;">문의</a>
                </li>
            </ul>  
        </nav>    

        <!-- 상품 설명 (교환 / 배송 / 취소) -->
        <div>
            <a id="pro-de"></a>
            <div style="text-align: center;" class="de_img">
                
                <img src="../resources/imgs/goods/${goods.detaileSysFilename }" alt="상세이미지">
                    
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
                  <p style="float: left;">배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.</p>
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
                <li>콜라비는 2배 적립 (사진 200원, 글 100원)</li>
                <li>후기 작성은 배송완료일로부터 30일 이내 가능합니다.</li>
                <li>작성하신 후기는 바로 적립금이 지급됩니다.</li>
            </ul>
            <div style="margin-top: 25px; margin-bottom: 20px;">
                <span class="re_sp">총 14,646개</span>
                <div id="review-re" class="re_bu">
                    <button class="review-opt recommend" onclick="window.open('getRecommend.do')">추천순</button> | 
                    <button class="review-opt recent" onclick="window.open('getRecent.do')">최근등록순</button>
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
             
             <div class="reviewLoad">  
              <c:if test="${not empty rlist }">  
              <c:forEach var="goodsReview" items="${rlist }">
            <div class="div_re">
                <div>
                    <div>
                        <span class="grade">${memberVO.grade }</span>
                        <span>${memberVO.name }</span>
                    </div>
                </div>
                <article>
                    <div class="review2">
                        <div>
                            <h3 style="font-size: 1em; color: darkgray">${goods.productName }</h3>
                        </div>
                        <p style="margin-top: 15px;">
			              ${goodsReview.rContent }
                        </p>
                        <div>
                        <c:if test="${goodsReview.rSysFilename != null}">
                           	<button style="width: 75px; height: 75px;">${goodsReview.rSysFilename }</button>
                        </c:if>
                        <c:if test="${goodsReview.rSysFilename == null}"></c:if>
                        </div>
                        <footer style="margin-top: 15px;">
                            <div>
                                <span>${goodsReview.rDate }</span>
                                <div style="float: right;">
                                <div style="margin-right: 30px; font-size: 14px;">
                                    <button type="button" class="btn btn-primary2" data-toggle="modal" data-target="#myModal4" 
                                    class="update" style="border: none; background-color: transparent; font-size: 14px;">수정</button> |
                                    <button class="re-delete" name="${goods.productName }" value="${goodsReview.reviewNum }" 
                                    style="border: none; background-color: transparent; 
                                    font-size: 14px;">삭제</button>
                                    <a href="deleteReview.do?reviewNum=${goodsReview.reviewNum }">삭제</a>
                                </div>
                                <div>
                            <button class="rec_btn" style="float: right; margin-right:30px;" onclick="recBtn">
                                <div class="thumbs-up">
                                <i class="bi bi-hand-thumbs-up"></i>
                                <span class="thum">도움돼요</span>
                                <input type="text" value="1" id="thumbsup" style="border: none; 
                                background-color: transparent; width: 20px;">    
                                <!--<span>0</span>-->
                                </div>    
                            </button>
                            </div>
                            </div>
                            </div>

                        </footer>
                    </div>
                </article>
            </div>
            </c:forEach>
            </c:if>
            
            <!-- 상품 후기 없을 때 -->
            <c:if test="${empty rlist }">
            	<div class="div_re" style="text-align: center; vertical-align: middle; font-size: 25px;">
            		<p><i class="bi bi-exclamation-circle"></i></p>
            		<p style="text-align: center; vertical-align: middle; font-size: 15px;">등록된 후기가 없습니다</p>
            	</div>
            </c:if>
           </div> 
           
            <div class="find-btn" style="margin-left:100px; margin-right: 50px;">
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
            
            <div class="mypage-top4" style="margin-right: 70px; margin-left: -20px;">
 
              <section>
                <div class="d-flex inquiryPro-col">
                  <div class="Q_titleWrap">제목</div>
                  <div class="Q_writer">작성자</div>       
                  <div class="Q_date">작성일</div>
                  <div class="Q_state">답변상태</div>
                </div>
                
                <ul style="padding: 0px;">
                

                 <!-- 상품 문의 있을 때 -->
                 <div class="qnaLoad">
                 <c:if test="${not empty qlist }">
                  <!-- 데이터 있는 만큼 반복 -->    
                  <c:forEach var="goodsQnA" items="${qlist }">
                  <section class="inquiryRow${goodsQnA.proQnaNum }">  
                    <button type="button" class="btn" data-toggle="collapse" data-target="#demo${goodsQnA.proQnaNum }" style="width: 1100px;">
                      <li class="d-flex inquiryPro-row" onclick="showAnswer()">
                        
                        <div class="Q_titleWrapCon" style="width: 600px;">
                          <div class="pro_name">${goods.productName } </div><br>
                          <div class="Q_title" style="font-weight: bold;">${goodsQnA.qTitle }</div>
                        </div>
                          <div class="Q_writer" style="padding-top: 20px; margin-left: -20px; width: 180px;">${memberVO.name }</div>
                        <div class="Q_date minusPoint" style="padding-top: 20px; width: 180px; margin-left: 20px;">${goodsQnA.qDate }</div>
                        <!-- 답변여부에 따라 변경-->
                        <div class="Q_state plusPoint" style="padding-top: 20px; width: 180px; margin-left: 0px;">
                        	<c:choose>
                        	<c:when test="${member.grade == 0 }">
                        		<button type="button" class="btn btn-primary2" data-toggle="modal" data-target="#myModal3">답변하기</button>
                        	</c:when>
                        	<c:otherwise>
                        	<c:if test="${goodsQnA.qStatus != null }">답변완료</c:if>
                        	<c:if test="${goodsQnA.qStatus == null }">답변대기</c:if>
                        	</c:otherwise>
                        	</c:choose>
                        </div>
                      </li>
                    </button>

                    <li class="answerPro">
                      <div class="collapse answerPro-row" id="demo${goodsQnA.proQnaNum }">
					<c:if test="${goodsQnA.qStatus != null }">
                        <div class="inquiryPro-Area d-flex">
                          <div>
                            <span class="icon"><img src="image/icons8-%EB%8F%99%EA%B7%B8%EB%9D%BC%EB%AF%B8-q-48.png" style="width: 25px;"></span>
                          </div>
                          <div class="content">
                          	<c:out value="${fn:replace(goodsQnA.qContent, newline, '<br>')}" escapeXml="false"/>
                          </div>
                          <c:if test="${goodsQnA.memberNum == memberVO.memberNum }">
                            <div style="margin-left: 50px; text-align: right;">
                        <span style="text-align: right; margin-right: 30px; font-size: 14px;">
                            <button type="button" class="btn btn-primary2 updateQnA" data-toggle="modal" data-target="#myModal5" 
                            data-proqnanum="${goodsQnA.proQnaNum }" data-qtitle="${goodsQnA.qTitle }" data-qContent="${goodsQnA.qContent }"
                            style="border: none;  background-color: transparent; font-size: 14px;">수정</button> |
                            <a class="q-delete" style="border: none; background-color: transparent;" 
                            href="deleteQnA.do?proQnaNum=${goodsQnA.proQnaNum }">삭제</a>
                            <button class="q-delete" style="border: none; background-color: transparent;" onclick="q_delete()">삭제</button>
                        </span>
                        </div>
                        </c:if>
                        </div>

                        <div class="answerPro-Area d-flex hide">
                            <div>
                              <span class="icon"><img src="../resources/imgs/goods/${goods.thumSysFilename }" style="width: 25px; float: left; margin-right: 5px;"></span>
                            </div>
                            <div class="content">
                            	${proComment.aContent }
                              	안녕하세요 고객님, 먼저 저희 콜라비를 이용해 주셔서 감사합니다.
                              <br> 품절된 또는 판매가 종료된 상품의 경우 협력사 협의 하에 따라 입고 여부 및 일정 등 결정 되고 있어, 별도 확인이 어려워 안내드리기 어려운 점 너른 양해 부탁드립니다.
                              <br> 암튼 죄송합니당 
                            <div class="css-1kna94k etpoi031">2022.11.23</div>
                            </div>
                        </div>

                    </c:if>
                    <c:if test="${goodsQnA.qStatus == null }">
                    	<div class="inquiryPro-Area d-flex">
                          <div>
                            <span class="icon"><img src="image/icons8-%EB%8F%99%EA%B7%B8%EB%9D%BC%EB%AF%B8-q-48.png" style="width: 25px;"></span>
                          </div>
                          <div class="content">
                          	<c:out value="${fn:replace(goodsQnA.qContent, newline, '<br>')}" escapeXml="false"/>
                          </div>
                            <div style="margin-left: 50px; text-align: right;">
                        <span style="text-align: right; margin-right: 30px; font-size: 14px;">
                            <button type="button" class="btn btn-primary2 updateQnA" data-toggle="modal" data-target="#myModal5" 
                            data-proqnanum="${goodsQnA.proQnaNum }" data-qtitle="${goodsQnA.qTitle }" data-qContent="${goodsQnA.qContent }"
                            style="border: none;  background-color: transparent; font-size: 14px;">수정</button> |
                            <a class="q-delete" style="border: none; background-color: transparent;" 
                            href="deleteQnA.do?proQnaNum=${goodsQnA.proQnaNum }">삭제</a>
                            <button class="q-delete" style="border: none; background-color: transparent;" onclick="q_delete()">삭제</button>
                        </span>
                        </div>
                        </div>
                        
                    	<div class="answerPro-Area d-flex hide">
                            <div>
                              <span class="icon"><img src="../resources/imgs/goods/${goods.thumSysFilename }" style="width: 25px; float: left; margin-right: 5px;"></span>
                            </div>
                            <div class="content">
                            	<p>등록된 답변이 없습니다.</p>
                            <div class="css-1kna94k etpoi031">2022.11.23</div>
                            </div>
                        </div>
                    </c:if>
                      </div>
                    </li>
                  </section>
                  
                  </c:forEach> 
                  
                  
                  
            <!-- 비밀글일 때 -->
          	<c:if test="${goodsQnA.qSecret == 1 }">
          		<section class="inquiryRow">                                                                   <!--여기 바뀌어야함-->
                    <button type="button" class="btn" id="btn-secret" data-toggle="collapse" data-target="#demo" style="width: 1100px;">
                      <li class="d-flex inquiryPro-row" onclick="showAnswer()">
                        
                        <div class="Q_titleWrapCon" style="width: 600px;">
                          <div class="pro_name">[맨날먹는] 맛있는 반나나나 </div>
                          <div class="Q_title">비밀글 입니다</div>
                        </div>
                          <div class="Q_writer" style="padding-top: 20px; margin-left: -20px; width: 180px;">홍길동</div>
                        <div class="Q_date minusPoint" style="padding-top: 20px; width: 180px; margin-left: 20px;">22.11.23</div>
                        <!-- 답변여부에 따라 변경-->
                        <div class="Q_state plusPoint" style="padding-top: 20px; width: 180px; margin-left: 0px;">
                        	<c:choose>
                        	<c:when test="${member.grade == 0 }">
                        		<button type="button" class="btn btn-primary2" data-toggle="modal" data-target="#myModal3">답변하기</button>
                        	</c:when>
                        	<c:otherwise>
                        	<c:if test="${goodsQnA.qStatus != null }">답변완료</c:if>
                        	<c:if test="${goodsQnA.qStatus == null }">답변대기</c:if>
                        	</c:otherwise>
                        	</c:choose>
                        </div>
                      </li>
                    </button>
                    <fieldset>
                    <!-- 회원은 비밀번호 입력시 보여짐 -->
                    <c:if test="${member.id && member.grade != 0 }">
                    	<legend>비밀글보기</legend>
                    	<p class="password"><label for="secure_password">비밀번호</label> {$form.secure_password}</p>
		                <p class="button">
		                    <a href="#none" onclick="{$action_secure}"><p style="border: ">확인</p></a>
		                </p>
		            </c:if>    
		            <!-- 관리자는 그냥 보여짐 -->
		            <c:if test="${member.grade == 0 }">
		            	
		            </c:if>
                    </fieldset>

                    <li class="answerPro">
                      <div class="collapse answerPro-row" id="demo">
                        <div class="inquiryPro-Area d-flex">
                          <div>
                            <span class="icon"><img src="image/icons8-%EB%8F%99%EA%B7%B8%EB%9D%BC%EB%AF%B8-q-48.png" style="width: 25px;"></span>
                          </div>
                          <div class="content">바나나 안 익어야지 맛있는데 ㅋ</div>
                            <div style="margin-left: 50px; text-align: right;">
                        <span style="text-align: right; margin-right: 30px; font-size: 14px;">
                            <button type="button" class="btn btn-primary2" data-toggle="modal" data-target="#myModal5" 
                            class="update" style="border: none; background-color: transparent; font-size: 14px;">수정</button> |
                            <a class="q-delete" style="border: none; background-color: transparent;" 
                            href="deleteQnA.do?proQnaNum=${goodsQnA.proQnaNum }">삭제</a>
                            <button class="q-delete" style="border: none; background-color: transparent;">삭제</button>
                        </span>
                        </div>
                        </div>
  
                        <div class="answerPro-Area d-flex hide">
                            <div>
                              <span class="icon"><img src="../resources/imgs/goods/${goods.thumSysFilename }" style="width: 25px; float: left; margin-right: 5px;"></span>
                            </div>
                            <div class="content">
                              	안녕하세요 고객님, 먼저 저희 콜라비를 이용해 주셔서 감사합니다.
                              <br> 품절된 또는 판매가 종료된 상품의 경우 협력사 협의 하에 따라 입고 여부 및 일정 등 결정 되고 있어, 별도 확인이 어려워 안내드리기 어려운 점 너른 양해 부탁드립니다.
                              <br> 암튼 죄송합니당 
                            <div class="css-1kna94k etpoi031">2022.11.23</div>
                            </div>
                        </div>

                      </div>
                    </li>
                  </section>
          	</c:if>
            
            
           
            <div class="find-btn" style="margin-right: 50px;">
                <button class="find-btn1" disabled>
                    <i class="bi bi-chevron-left"></i>
                </button>
                <button class="find-btn2">
                    <i class="bi bi-chevron-right"></i>
                </button>
            </div>
             </c:if>
            
            <!-- 상품 문의 없을 때 -->
            <c:if test="${empty qlist }">
            	     
            </c:if> 
            </div>
          </ul>  
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