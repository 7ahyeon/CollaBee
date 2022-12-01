<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage 찜한상품 - 마켓콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%> 

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/picklist.css">
   	
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
                    <h4 style="margin-right: 20px;">찜한상품(n개)</h4>
                  </div>
                  <div style="display: inline; line-height: 38px; vertical-align: bottom; "><small>찜한상품은 최대 100개까지 저장됩니다.</small></div>
              </div>
            </div>
				
				
 			<div class="mypage-top4" style="padding: 15px;">
             
              <!--반복-->
              <div class="content-container">

                <div class="d-flex align-content-between pick-item-container" style="padding: 20px 0px;">
                  <div class="item-col1">
                    <div class="pick-item-img"><img src="" style="width: 60px; height: 78px;"></div>
                  </div>
                  <div class="item-col2" style="width:600px; height: 79px; margin-left: 20px; margin-right: 100px; border: 2px soild #B03FE3;">
                    <div class="pick-item-info-proname"><b>[블루보틀: 홀리데이]윈터 싱글 오리진 300g</b></div>
                    <div class="pick-item-info-price">36,000원</div>
                  </div>  
                  <div class="item-col3" style="width: 104px;">
                    <div class="pick-item-del"><button type="button" class="btn btn-outline-del" style="margin-bottom: 10px;" onclick="delFromPick()">삭제</button></div>
                    <div class="pick-item-del"><button type="button" class="btn btn-outline-add" onclick="addCart()"><i class="bi bi-cart4"></i>담기</button></div>
                  </div>  
                </div>
                <div class="item-col4" style="border-bottom: 0.5px solid grey;"></div>

              </div>
              <!--반복 끝-->

              <!--테스트영역 시작 -->
              <div class="content-container">
                <div class="d-flex align-content-between pick-item-container" style="padding: 20px 0px;">
                  <div class="item-col1">
                    <div class="pick-item-img"><img src="" style="width: 60px; height: 78px;"></div>
                  </div>
                  <div class="item-col2" style="width:600px; height: 79px; margin-left: 20px; margin-right: 100px; border: 2px soild #B03FE3;">
                    <div class="pick-item-info-proname"><b>[블루보틀: 홀리데이]윈터 싱글 오리진 300g</b></div>
                    <div class="pick-item-info-price">36,000원</div>
                  </div>  
                  <div class="item-col3" style="width: 104px;">
                    <div class="pick-item-del"><button type="button" class="btn btn-outline-del" style="margin-bottom: 10px;">삭제</button></div>
                    <div class="pick-item-del"><button type="button" class="btn btn-outline-add"><i class="bi bi-cart4"></i>담기</button></div>
                  </div>  
                </div>
                <div class="item-col4" style="border-bottom: 0.5px solid grey;"></div>
              </div>
              <div class="content-container">
                <div class="d-flex align-content-between pick-item-container" style="padding: 20px 0px;">
                  <div class="item-col1">
                    <div class="pick-item-img"><img src="" style="width: 60px; height: 78px;"></div>
                  </div>
                  <div class="item-col2" style="width:600px; height: 79px; margin-left: 20px; margin-right: 100px; border: 2px soild #B03FE3;">
                    <div class="pick-item-info-proname"><b>[블루보틀: 홀리데이]윈터 싱글 오리진 300g</b></div>
                    <div class="pick-item-info-price">36,000원</div>
                  </div>  
                  <div class="item-col3" style="width: 104px;">
                    <div class="pick-item-del"><button type="button" class="btn btn-outline-del" style="margin-bottom: 10px;">삭제</button></div>
                    <div class="pick-item-del"><button type="button" class="btn btn-outline-add"><i class="bi bi-cart4"></i>담기</button></div>
                  </div>  
                </div>
                <div class="item-col4" style="border-bottom: 0.5px solid grey;"></div>
              </div>
              <!--테스트영역 끝 -->

            
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