<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <title>콜라비</title>
  <%@ include file="../common/bootstrap.jspf" %>
  <style>
    .list-group-item a {
      letter-spacing: -2px;
      text-decoration: none;
      color: black;
    }

    .list-group-item:hover {
      background-color: #FEF7FF;
    }

    .list-group-item:hover>a {
      font-weight: bold;
      text-decoration: none;
      color: #B03FE3;
    }

    .list-group-item:hover>span {
      font-weight: bold;
      text-decoration: none;
      color: #B03FE3;
    }

    .list-group-item a {
      width: 100%;
      display: block;
    }

    li span {
      font-size: large;
      font-weight: bold;
      color: black;
    }

    h2 {
      font-weight: bold;
      letter-spacing: -2.5px;
    }

    h4 {
      font-weight: bolder;
      letter-spacing: -3px;
      word-spacing: 5px;
    }

    h4 span {
      letter-spacing: -1px;
      word-spacing: 2px;
      vertical-align: middle;
      font-size: small;
      color: gray;
    }

    .main {
      padding-bottom: 24px;
      padding-top: 10px;
    }

    .table {
      width: 100%;
      text-align: center;
    }

    .title {
      width: 100%;
      vertical-align: middle;
      padding-bottom: 9px;
      border-color: lightgray;
      border-width: 1px;
    }

    .btn_list {
      padding-top: 45px;
    }

    .back_btn {
      padding: 0px 10px;
      text-align: center;
      overflow: hidden;
      width: 120px;
      height: 44px;
      border-radius: 3px;
      color: rgb(255, 255, 255);
      background-color: #9A30AE;
      border: 0px none;
      font-size: small;
    }

    .answer_btn {
      padding: 0px 10px;
      text-align: center;
      overflow: hidden;
      width: 120px;
      height: 44px;
      border-radius: 3px;
      color: rgb(255, 255, 255);
      background-color: #9A30AE;
      border: 0px none;
      font-size: small;
    }
  </style>
</head>

<body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
  <div class="container-fluid">
 <!-- header -->
    <header>
      <%@ include file = "../common/header.jspf" %>
    </header>
    
	<!--유정-->
    <div class="row" style="padding-top:50px; padding-bottom: 50px">
      <div class="col-sm-2"></div>
      <div class="col-sm-2">
      	<h2>관리자센터</h2>
        <br>
		<div>
            <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="">상품등록</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="">상품목록</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="../board/notice.do">공지사항</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="../faq/faq.do">자주하는 질문</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="inquiry.do">1:1문의</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="">쿠폰발행</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="">배송관리</a>
                <span>></span>
            </li>
            </ul>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="main" style="border-bottom:2px solid black">
          <h4>1:1 문의 답변 수정</h4>
        </div>
<div>
         <form name="frm" method="post" enctype="multipart/form-data">
          <table class="table">
            <tbody>
              <tr style="height: 60px;">
                <td style="width: 10%; vertical-align: middle; border-top-color: black; border-bottom-color: white;">제목</td>
                <td style="vertical-align: middle; border-color: gray; text-align: left;">
 					${inquiry.inquiryTitle }
                </td>
              </tr>
              <tr style="height: 60px;">
                <td style="width: 10%; vertical-align: middle;">내용</td>
                <td style="text-align:left; border-bottom-color: gray; vertical-align: middle">
					${inquiry.inquiryContent }
                </td>
              </tr>
              <tr>
                <td style="font-weight: bolder;">답변</td>
                <td>
                  <textarea class="form-control" rows="18" id="comment" name="inquiryAnswer"
                    placeholder="답변 내용을 입력하세요.">${inquiry.inquiryAnswer }</textarea>
                  <span style="color:#aaa; float: right;" id="counter">(0 /2000자)</span>
                </td>
              </tr>
            </tbody>
          	</table>
          	<div style="text-align: right;">
            <button class="back_btn" type="button" onclick="location.href='inquiry.do'"
              style="width: 120; height: 44; border-radius: 3;">취소</button>
            <button class="answer_btn" type="button" onclick="check_answer(${inquiry.inquiryNum })" style="width: 120; height: 44; border-radius: 3;">등록</button>
          </div>
          </form>
        </div>
      </div>
    </div>
    <div class="col-sm-2"></div>
  </div>
</body>
<!-- footer-->
 <footer>
   <%@ include file = "../common/footer.jspf" %>	
 </footer>
<script>
  //textarea 글자수 제한
  $('.form-control').keyup(function (e) {
    var content = $(this).val();
    $('#counter').html("(" + content.length + "자 / 2000자)");    //글자수 실시간 카운팅

    if (content.length > 2000) {
      alert("최대 2000자까지 입력 가능합니다.");
      $(this).val(content.substring(0, 2000));
      $('#counter').html("(2000 / 2000자)");
    }
  });
  
  
  
  function check_answer(inquiryNum) {
	    var frm = document.frm;
	    console.log(frm);
	    if (frm.inquiryAnswer.value == "") {
	        alert("답변을 입력해주세요.");
	      return false;
	    } else {
	    	alert(inquiryNum)
	      	frm.action="answerInquiry.do?inquiryNum="+inquiryNum;
	      	frm.submit();
	      alert("1:1 문의 답변 등록 완료 !");
	    }
	  }
</script>
</html>