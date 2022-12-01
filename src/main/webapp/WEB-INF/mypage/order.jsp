<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">

	<script src="${pageContext.request.contextPath }/resources/js/mypageScript.js"></script>

<style type="text/css">
 /* 기존거 가져옴 */

    .order-item-col2 .order-item {
      line-height: 150px;
      vertical-align: middle;
    }
    .order-item-col2 .button-cover {
      margin-top: -60px;
    }
    
 
 /* 마이페이지 컨텐츠 css*/
	
	.order-list-continer {
		width: 960px;
		height: 210px;
		padding: 16px 0px;
		border: 14px 0px 16px;
		margin-bottom: 14px;
		display: flex;
	}
    .bold {
    	font-weight: bold;
    }
    
    img {
	    width: 60px;
	    height: 78px;
	    margin : 10px 10px 50px 10px ;
    }
    .order-item-thumb {
	    float: left;
    }


    /* 주문일자 + 상세내역 */
    .order-item-date {
		width: 930px;
		border-bottom: 0.5px solid grey;
		padding: 8px 0px 13px;
    }
    .order-item-date a{
      font-size: small;
      color: grey;
      font-weight: bold;
      text-decoration: none;
    }
    dl {
      width: 620px;
    }
    dt {
      font-size: small;
      float: left;
      padding: 5px;
      width: 80px;
    }
    dd {
      font-size: 0.9em;
    }

    .order-data {
      width: 520px;
      padding: 5px;
      margin-bottom: 0px;
    }
    .order-item-info {
      text-align: left;
      margin-bottom: 0px;
    }

    .order-item-status { 
      width: 100px;
      margin-top:50px;
    }

    .borderbtn {
      background-color: white; 
      color: #692498; 
      border:0.5px solid #692498; 
      width: 100px; 
      height: 36px;
    }

</style>

</head>
<script>
	function orderDetail() {
		alret("orderDetail.do 요청")
	}
</script>

<body>
Session에 저장된 \${loginMember } : ${loginMember }
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
                    <h4 style="margin-right: 20px;">주문내역</h4>
                  </div>
                  <div style="display: inline; line-height: 38px; vertical-align: bottom;"><small>최대 지난 1개월간의 주문 내역까지 확인할 수 있어요</small></div>
                  <div class="dropdown" style="float: right; margin-top: 5px; margin-left: 180px;">
                    <button type="button" class="btn btn-outline dropdown-toggle" data-toggle="dropdown" style="color: #B03FE3; border-radius: 0; width: 150px;">1주일</button>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="#">1주일</a>
                      <a class="dropdown-item" href="#">1개월</a>
                      <a class="dropdown-item" href="#">1년</a>
                    </div>
                  </div>
              </div>
            </div>

            <div class="mypage-top4">
               
              <div class="order-list-continer">
                <!-- DB 에서 LIST 불러와서 반복문 적용 -->

                <div class="">
                  <div class="order-item-row1">
                      <div class="order-item-date">
                        <span class="order-data bold">2022.09.26 (01시 15분)</span><a  href="orderDetail.do" style="float: right;">주문내역 상세보기 ></a>
                      </div>
                  </div>

                  <div class="d-flex align-content-between order-item-row2">
                    <div class="order-item">
                      <img src="https://img-cf.kurly.com/shop/data/goods/1605164418732l0.jpg" alt="[요플레] ONLY 3 플레인 요거트 대용량 1800mL 상품 이미지" class="order-item-thumb">
                      <dl class="order-item-info">
                        <dt class="order-item">상품명</dt>
                        <dd class="order-data">[요플레] ONLY 3 플레인 요거트 대용량 1800mL 외 2건</dd>
                      </dl>
                      <dl class="order-item-info">
                        <dt class="order-item">주문번호</dt>
                        <dd class="order-data">2282501150018</dd>
                      </dl>
                      <dl class="order-item-info">
                        <dt class="order-item">결제방법</dt>
                        <dd class="order-data">네이버페이</dd>
                      </dl>
                      <dl class="order-item-info">
                        <dt class="order-item">결제금액</dt>
                        <dd class="order-data">24,380원</dd>
                      </dl>
                    </div>
                    <div style="width: 150px;"></div>
                    <div class="order-item-status">
                      <div style="width: 100px; text-align: center;" >배송완료</div>
                      <div class="button-cover">
                        <button type="button" class="btn text-center borderbtn" onclick="inquiry()"><span>1:1 문의</span></button>
                      </div>
                   </div>
                  </div>
                </div>  
                  
                </div>
              </div>
              
            </div>
            
          	<div class="col-sm-2"></div>
          </div>
          
          </div>
          <div class="blank"></div>
      </div>

        
    </div>    
    
    
    <footer>
      <%@ include file= "../common/footer.jspf"%>
    </footer>
    </body>
</html>