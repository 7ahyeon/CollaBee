<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage - 마켓콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/inquiryProduct.css">

	<script src="${pageContext.request.contextPath }/resources/js/mypageScript.js"></script>
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
                <div>
                  <div id="category-name" style="display: inline-block; margin-bottom: 9px;">
                    <h4 style="margin-right: 20px;">상품문의</h4>
                  </div>
                  <div>
                    <ul class="menuInfoList">
                      <li class="menuInfo">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
                      <li class="menuInfo">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <span class="highlight" href="/mypage/inquiry/list">1:1 문의</span>에 남겨주세요.</li>
                    </ul>
                  </div>
              </div>
            </div>
				
				<div class="mypage-top4">
					
					<section>
                <div class="d-flex inquiryPro-col">
                  <div class="Q_titleWrap">제목</div>
                  <div class="Q_date">작성일</div>
                  <div class="Q_state">답변상태</div>
                </div>
                
                <ul style="padding: 0px;">
                 
                  <!-- 데이터 있는 만큼 반복 -->     
                 <section class="inquiryRow">                                                                   <!--여기 바뀌어야함-->
                    <button type="button" class="btn" data-toggle="collapse" data-target="#demo" style="width: 860px;">
                      <li class="d-flex inquiryPro-row" onclick="showAnswer()">
                        <div class="Q_proImg"><img src=""></div>
                        <div class="Q_titleWrapCon">
                          <div class="pro_name">[맨날먹는] 맛있는 반나나나 </div>
                          <div class="Q_title">바나나 안익은거도 보내주시나요?</div>
                        </div>
                        <div class="Q_date minusPoint" style="padding-top: 20px;">22.11.23</div>
                        <!-- 답변여부에 따라 변경-->
                        <div class="Q_state plusPoint" style="padding-top: 20px;">답변완료</div>
                        <!-- <div class="Q_state minusPoint">답변대기</div> -->
                      </li>
                    </button>

                    <li class="answerPro">
                      <div class="collapse answerPro-row" id="demo">
                        <div class="inquiryPro-Area d-flex">
                          <div class="iconArea">
                            <span class="icon"><i class="bi bi-question-circle"></i></span>
                          </div>
                          <div class="content">바나나 안 익어야지 맛있는데 ㅋ</div>
                        </div>

                        <div class="answerPro-Area d-flex hide">
                            <div class="iconArea">
                              <span class="icon"><img  class="iconArea"></span>
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
                  <!-- 반복 끝-->
                  <!-- 테스트 시작-->
                  <section>
                    <button type="button" class="btn" data-toggle="collapse" data-target="#demo2" style="width: 860px;">
                      <li class="d-flex inquiryPro-row" onclick="showAnswer()">
                          <div class="Q_proImg"><img src=""></div>
                          <div class="Q_titleWrapCon">
                            <div class="pro_name">[맨날먹는] 맛있는 반나나나 </div>
                            <div class="Q_title">바나나 안익은거도 보내주시나요?</div>
                          </div>
                          <div class="Q_date minusPoint" style="padding-top: 20px;">22.11.23</div>
                          <!-- 답변여부에 따라 변경-->
                          <div class="Q_state plusPoint" style="padding-top: 20px;">답변완료</div>
                          <!-- <div class="Q_state minusPoint">미답변</div> -->
                      </li>
                    </button>

                    <li class="answerPro">
                      <div class="collapse answerPro-row" id="demo2">
                        <div class="inquiryPro-Area d-flex">
                          <div class="iconArea">
                            <span class="icon"><i class="bi bi-question-circle"></i></span>
                          </div>
                          <div class="content">바나나 안 익어야지 맛있는데 ㅋ</div>
                        </div>

                        <div class="answerPro-Area d-flex hide">
                            <div class="iconArea">
                              <span class="icon"><img  class="iconArea"></span>
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
                  <!-- 테스트 끝 -->
            
                </ul>
                
                <!--페이징처리-->
  
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