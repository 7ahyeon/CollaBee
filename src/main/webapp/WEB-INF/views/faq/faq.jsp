<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:scriptlet> pageContext.setAttribute("newline", "\n"); </jsp:scriptlet>        
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
      word-spacing: 1px;
      vertical-align: middle;
      font-size: small;
      color: gray;
    }

    .main {
      padding-bottom: 24px;
      padding-top: 10px;
    }

    .faq {
      display: flex;
      width: 100%;
      border-bottom: 1px solid rgb(51, 51, 51);
      text-align: center;
      height: 61px;
    }

    .faq_top {
      padding: 10px;
      font-size: 11pt;
      vertical-align: middle;
      font-weight: bolder;
    }

    .card {
      border: white;
    }

    .card-header {
      background-color: white;
      height: 55px;
      padding-top: 13px;
    }

    .card-header a {
      color: black;
      text-decoration: none;
      vertical-align: middle;
    }

    .card-header span {
      text-align: center;
      font-size: 10.5pt;
    }

    .card-header:hover {
      color: black;
      text-decoration: none;
      background-color: white;
    }

    .card-body {
      border-top-color: white;
    }

    .card_answer {
      padding: 30px 30px 30px 70px;
      font-size: 14px;
    }

    .btn_list {
      padding-top: 45px;
    }

    .btn1 {
      display: inline-block;
      border: black;
      width: 44px;
      height: 44px;
      border-radius: 0.5em;
    }

    .btn1:hover {
      border: solid 1px darkgray;
    }

    .btn2 {
      display: inline-block;
      border: black;
      width: 44px;
      height: 44px;
      border-radius: 0.5em;
    }

    .btn2:hover {
      border: solid 1px darkgray;
    }

    .btns {
      text-align: center;
    }

    .faq_btn {
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
      float: right;
    }
  </style>
<script>
    function faq_delete(faqNum) {
      if (confirm("정말 삭제하시겠습니까??") == true) { 
		location.href="deletefaq.do?faqNum="+faqNum
      } else { 
        return false;
      }
    }
    
    $(document).ready(function() {
    	  $('#selectBox').change(function() {
    	    var result = $('#selectBox option:selected').val();
    	    if (result == '전체') {
    	      $('.faq_a').show();
    	    } else if (result == '회원') {
    	      $('.faq_a').show();
    	    } else if (result == '상품') {
    	      $('.faq_a').hide();
    	    } else if (result == '주문/결제') {
    	      $('.faq_a').hide();
    	    } else if (result == '배송') {
    	      $('.faq_a').hide();
    	    } else if (result == '쿠폰/적립금') {
      	      $('.faq_a').show();
    	    }
    	  }); 
    	}); 
  </script>

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
       <!-- 회원일때 -->
        <h2>고객센터</h2>
        <br>
        <div>
          <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
              <a href="../board/notice.do" width="100%">공지사항</a>
              <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              <a href="faq.do">자주하는 질문</a>
              <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              <a href="../inquiry/inquiry.do">1:1 문의</a>
              <span>></span>
            </li>
          </ul>
        </div>
        <!-- 관리자일때 -->
        <!-- 
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
                <a href="notice.jsp">공지사항</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="faq.jsp">자주하는 질문</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="inquiry.jsp">1:1문의</a>
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
        </div>-->
      </div>
      <div class="col-sm-6">
        <div class="main" style="border-bottom:2px solid black">
          <h4>자주하는 질문<span> 고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>
             <div class="dropdown" style="width: 180px; border-radius: 0; float: right; padding-bottom: 0.5cm;">
              <select id="selectBox" name="selectBox" class="form-control">
                <option value="전체" selected="selected">전체</option>
                <option value="회원">회원</option>
                <option value="상품">상품</option>
                <option value="주문/결제">주문/결제</option>
                <option value="배송">배송</option>
                <option value="쿠폰/적립금">쿠폰/적립금</option>
              </select>
            </div> 
          </h4>
        </div>
          <div class="faq">
            <div class="faq_top" style="padding-top: 19px; width: 100%;">
              <div style="width: 75px; display: inline-block;">번호</div>
              <div style="width: 150px; display: inline-block;">카테고리</div>
              <div style="width: 650px; display: inline-block;">제목</div>
            </div>
          </div>
          <div class="faq_a">
		      <div id="accordion">
	           <c:if test="${not empty faqList }"> 
	           <c:forEach varStatus="status" var="faq" items="${faqList }">
              <div class="card">
                <div class="card-header">
                  <a class="card-link" data-toggle="collapse" href="#collapseOne${status.index }">
					<span style="width: 75px; display: inline-block;">${faq.faqNum }</span>
					<span style="width: 150px; display: inline-block;" vaule="${faq.faqType }">${faq.faqType }</span>
                    <span style="width: 630px; display: inline-block;">${faq.faqTitle }</span>
                  </a>
                </div>
                <div id="collapseOne${status.index }" class="collapse" data-parent="#accordion">
                  <div class="card-body">
	                    <div class="card_answer">
	                  	<c:out value="${fn:replace(faq.faqContent, newline, '<br>')}" escapeXml="false"/>
	                    </div>
	                    <!--관리자일때만-->
	                    <div style="text-align: right;">
	                      <a href="faq_modify.do?faqNum=${faq.faqNum }" style="font-size:9pt; color: darkgray; text-decoration: none;">수정</a>
	                      <a onclick="faq_delete(${faq.faqNum })" style="font-size:9pt; color: darkgray; text-decoration: none;">삭제</a>
	                    </div>
	                    <!---->
                    </div>
                  </div>
                </div>
             </c:forEach>
	        </c:if>
          </div>
         </div>

          <div class="btn_list">
            <div class="btns">
              <button class="btn1" disabled>
                <i class="bi bi-chevron-left"></i>
              </button>
              <button class="btn2">
                <i class="bi bi-chevron-right"></i>
              </button>
              <button class="faq_btn" type="button" onclick="location.href='faq_write.do'">등록하기</button>
            </div>
          </div>
        </div>
        <div class="col-sm-2"></div>
      </div>
    </div>
<!-- footer-->
     <footer>
       <%@ include file = "../common/footer.jspf" %>	
     </footer>           
</body>
</html>