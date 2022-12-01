<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage 쿠폰- 마켓콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/coupon.css">
   	
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
	                <div style="width: 100%; height: 35px;">
	                  <div id="category-name" style="display: inline-block;">
	                    <h4 style="margin-right: 20px;">쿠폰</h4>
	                  </div>
	                  <div style="display: inline; line-height: 38px; vertical-align: bottom;"><small>적용가능한 쿠폰을 확인해보세요</small></div>
	              	</div>
            	</div>
				
			<div class="mypage-top4">
              <section>
                <div class="d-flex emoney-col">
                  <div class="coupon-num">쿠폰번호</div>
                  <div class="coupon-name">쿠폰명</div>
                  <div class="dis-price">할인금액</div>
                  <div class="coupon-date">사용기간</div>
                  <div class="usage-state">사용여부</div>
                </div>
                <ul style="padding: 0px;">
                  <!-- 데이터 있는만큼 반복 페이지당 10개-->     
                  <li class="d-flex emoney-row">
                    <div class="coupon-num">cpu221123-zkwi-09</div>
                    <div class="coupon-name">[블랙위크]롯데카드 10% 쿠폰(최대 10만원)</div>
                    <div class="dis-price">5000</div>
                    <div class="coupon-date">22.11.25 24시까지</div>
                    <div class="usage-state plusPoint">미사용</div>
                    <!-- <div class="usage-state minusPoint">사용</div> -->
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