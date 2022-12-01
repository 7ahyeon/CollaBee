<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%> 

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/orderDetail.css">

	<script src="${pageContext.request.contextPath }/resources/js/mypageScript.js"></script>

<script>
	function reAdd() {
		alert("장바구니 담기 클릭");
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
                    <h4 style="margin-right: 20px; margin-bottom: 35px; ">주문 내역 상세</h4>
                  </div>
                  <div class="orderNumArea"><h5 class="font-weight-bold">주문번호 2282501150018</h5><a id="inquiryLink" onclick="inquiry()">1:1문의 하기 ></a></div>
              </div>
            </div>
				
			<div class="mypage-top4">
<!-- DB 에서 LIST 불러와서 반복문 적용 -->
              <div class="order-list-continer d-flex align-content-between">
                    <div class="order-item">
                      <img src="https://img-cf.kurly.com/shop/data/goods/1605164418732l0.jpg" alt="[요플레] ONLY 3 플레인 요거트 대용량 1800mL 상품 이미지" class="order-item-thumb">
                      <dl class="order-item-info">
                        <dt class="order-item-name">[요플레] ONLY 3 플레인 요거트 대용량 1800mL 외 2건</dt>
                      </dl>
                      <dl class="order-item-info">
                        <dt class="order-item-price">24,380원 | 8개</dt>
                      </dl>
                    </div>
                    <div class="order-item-status">배송완료</div>
                    <div class="order-item-addCart">
                        <button type="button" class="btn purpleBtn" onclick="reAdd()"><span>장바구니 담기</span></button>
                   </div>
              </div>  
              <!-- DB 에서 LIST 불러와서 반복문 적용끝 -->

              <!-- DB 에서 LIST 불러와서 반복문 적용 (테스트)-->
              <div class="order-list-continer d-flex align-content-between">
                    <div class="order-item">
                      <img src="https://img-cf.kurly.com/shop/data/goods/1605164418732l0.jpg" alt="[요플레] ONLY 3 플레인 요거트 대용량 1800mL 상품 이미지" class="order-item-thumb">
                      <dl class="order-item-info">
                        <dt class="order-item-name">[요플레] ONLY 3 플레인 요거트 대용량 1800mL 외 2건</dt>
                      </dl>
                      <dl class="order-item-info">
                        <dt class="order-item-price">24,380원 | 8개</dt>
                      </dl>
                    </div>
                    <div class="order-item-status">배송완료</div>
                    <div class="order-item-addCart">
                        <button type="button" class="btn purpleBtn" onclick="reAdd()"><span>장바구니 담기</span></button>
                   </div>
              </div>  
              <!-- DB 에서 LIST 불러와서 반복문 적용(테스트) 끝-->
                  
              <!-- 장바구니에 담기 버튼영역 -->
              <div class="allAddCancle">
                <button class="btn whiteBtn" type="button" width="200" height="56" radius="3" onclick="allReAdd()"><span>전체 상품 다시 담기</span></button>
                <button class="btn greyBtn" type="button" width="200" height="56" radius="3" onclick="orderCancel()"><span>전체 상품 주문 취소</span></button>
              </div>

              <!-- 안내 -->
              <div class="notice"><span>주문취소는 [주문완료] 상태일 경우에만 가능합니다.</span></div>

              <!-- 결제정보 / 금액, 적립금, 결제방법 -->
              <div><h5 class="infoTitle">결제정보</h5></div>
              <ul class="infoContent">
                  <li>
                    <span class="title1">상품금액</span>
                    <span class="content">21,380
                      <span class="content">원</span>
                    </span>
                  </li>
                  <li><span class="title1">배송비</span>
                    <span class="content">3,000
                      <span class="content">원</span>
                    </span>
                  </li>
                  <li><span class="title1">결제금액</span>
                    <span class="content">24,380
                      <span class="content">원</span>
                    </span>
                  </li>
                  <li>
                    <span class="title1">적립금액</span>
                    <span class="content">1,497
                      <span class="content">원</span>
                    </span>
                  </li>
                  <li>
                      <span class="title1">결제방법</span>
                      <span class="content">네이버페이(신용카드)</span>
                  </li>
                </ul>

              <!-- 주문정보 / 주문번호, 주문자, 결제 일시 -->
              <div><h5 class="infoTitle">주문정보</h5></div>
              <ul class="infoContent">
                <li>
                  <span class="title2">주문번호</span>
                  <span class="content">2282501150018</span>
                  </li>
                  <li>
                    <span class="title2">보내는 분</span>
                    <span class="content">임수진</span>
                  </li>
                  <li>
                    <span class="title2">결제일시</span>
                    <span class="content">2022-09-26 01:16:05</span>
                </li>
              </ul>

              <!-- 배송정보 / 받는사람, 연락처 주소, 장소 포장?-->
              <div class="css-1bsokvi e1jm6dy15"><h5 class="infoTitle">배송정보</h5></div>
             
              <ul class="infoContent">
                <li>
                  <span class="title2">받는분</span>
                  <span class="content">ddu</span>
                </li>
                <li>
                  <span class="title2">핸드폰</span>
                  <span class="content">010-4144-****</span>
                </li>
                <li>
                  <span class="title2">주소</span>
                  <span class="content">(02063) 서울 우리집</span>
                </li>
                <li>
                  <span class="title2">받으실 장소</span>
                  <span class="content">문 앞</span>
                </li>
                <li>
                  <span class="title2">공동현관 출입방법</span>
                  <span class="content">공동현관 비밀번호 (************)</span>
                </li>
                <li>
                  <span class="title2">포장 방법</span>
                  <span class="content">종이 포장재</span>
                  </li>
              </ul>
					
			</div><!-- mypage-top4 -->	   
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