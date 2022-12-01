<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage - 마켓콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/emoney.css">
   	
<script>
    function emoneyload() {
        alert("적립금 페이지로 이동");
    }
    function couponload() {
        alert("쿠폰 페이지로 이동");
    }
    function inquiry() {
        alert("1:1문의  페이지로 이동");
	}
</script>
</head>
 <body style="width: 1900px;">
 
   <header>
      <%@ include file= "../common/header.jspf"%>
   </header>
   
    <div id="container">
     
        <div class="row" id="mypage-top">
            <div class="col-sm-2" style="background-color:#F7F7F7;"></div> 
            
            <div class="col-sm-8" style="background-color:#F7F7F7;">
	             <!-- 마이페이지 상단 --> 
	               <%@ include file="../common/mypage/mypageTop.jsp" %>
            </div> 

            <div class="col-sm-2" style="background-color: #F7F7F7;"></div>
        </div>

        <div class="blank"></div>
       
		<div class="row" id="mypage-bottom">
			<div class="col-sm-2"></div>
			
			<!-- 마이페이지네비메뉴 -->
			<%@ include file="../common/mypage/mypageSide.jsp" %>
			
			<!-- 마이페이지 콘텐츠 영역 -->
			<div class="col-sm-6"> 
			
			<div class="mypage-top3">
               	<div style="width: 100%; height: 50px;">
                  <div id="category-name" style="display: inline-block;">
                    <h4 style="margin-right: 20px;">적립금</h4>
                  </div>
                  <div style="display: inline; line-height: 38px; vertical-align: bottom;"><small>보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</small></div>
              	</div>
           	</div>
				
			<div class="mypage-top4" style="padding: 15px;">
               
              <section class="d-flex">
                <dl class="d-flex">
                  <dt class="label plusPoint">현재 적립금</dt>
                  <dd class="price plusPoint">1,497<span class="unit">원</span></dd>
                </dl>
                <dl class="d-flex">
                  <dt class="label">소멸예정 적립금</dt>
                  <dd class="price minusPoint font-weight-bold">1,497<span class="unit">원</span></dd>
                </dl>
              </section>
              <section>
                <div class="d-flex emoney-col">
                  <div class="reg-date">날짜</div>
                  <div class="detail">내용</div>
                  <div class="expire-date">유효기간</div>
                  <div class="point">금액</div>
                </div>
                <ul style="padding: 0px;">
                  <!-- 데이터 있는만큼 반복 페이지당 10개-->     
                  <li class="d-flex emoney-row">
                    <div class="reg-date">22.09.28</div>
                    <div class="detail" style="letter-spacing: -0.5px;">[구매적립] 주문(2282501150018) 7% 적립</div>
                    <div class="expire-date">23.09.30</div>
                    <div class="point">+1,497 원</div>
                  </li>
                  <!-- 반복 끝-->
                </ul>
                
                <!--페이징처리-->
                  <ul class="pagination" style="margin-left: 300px">
                    <li class="pagination-first">
                      <button class="paginationBtn"><i class="bi bi-chevron-double-left"></i></button>
                    </li>
                    <li class="pagination-prev">
                        <button class="paginationBtn"><i class="bi bi-chevron-left"></i></button>
                    </li>
                    <li class="pagnation-pageNum">
                      <button class="paginationBtn"><div>1</div></button>
                    </li>
                    <li class="pagnation-pageNum">
                      <button class="paginationBtn"><div>2</div></button>
                    </li>
                    <li class="pagination-next">
                      <button class="paginationBtn"><i class="bi bi-chevron-right"></i></button>
                    </li>
                    <li class="pagination-last">
                      <button class="paginationBtn"><i class="bi bi-chevron-double-right"></i></button>
                    </li>
                  </ul>
              </section>

            </div> <!-- mypage-top4 -->
               
			</div> <!-- col-sm-6 -->
		   
		    <div class="col-sm-2"></div>
		    
		</div>
          
		<div class="blank"></div>
		
	</div>

    <footer>
    	<%@ include file= "../common/footer.jspf"%>
    </footer>
    
 </body>
</html>