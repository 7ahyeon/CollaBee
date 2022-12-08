<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/emoney.css">
 
</head>

<script>
$(function(){
	
	var mvo = { memberNum : ${loginMember.getMemberNum()} };
	console.log(mvo); 
	alert("JSON.stringify(mvo) : " + JSON.stringify(mvo)); 
 	
	$.ajax("emoneyAjax.do",{ //emoney 히스토리가져오기
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			alert("성공"); 
			console.log(data);
			//console.log(data[0].issueDate);
			
			let htmlTag = "";
			let emoneyUsage = data.Array;
			$.each(data, function(index, emoneyUsage){ 			
				htmlTag += '<li class="d-flex emoney-row">';				
				htmlTag += '<div class="reg-date">' + emoneyUsage.saveDate.substring(0,10) + '</div>';
				htmlTag += '<div class="detail" style="letter-spacing: -0.5px;">' + emoneyUsage.emoneyHistory + '</div>';
				htmlTag += '<div class="validity">' + emoneyUsage.validity+ '</div>';
				htmlTag += '<div class="point">' + emoneyUsage.amount + '</div>';
				htmlTag += '</li>';				
				
			});
			$("#ul").html(htmlTag);
			
		},
		erroer: function(){
			alert("실패");
		}
	}); //ajax끝 
	
	$.ajax("getTotEmoneyAjax.do",{ //COUPONBOX 뷰에서 가져오기
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(emoneyUsage){
			//alert("성공> 받은 데이터 : " + emoneyUsage); 		
			console.log(emoneyUsage);
			if(emoneyUsage == ""){
				$('#totEmoney').val('0');					
			} else {
				$('#totEmoney').val(emoneyUsage);					
			}
		},
		error: function(){
			alert("getTotEmoneyAjax 실패")
		}
	});
	
});

</script>


 <body style="width: 1900px;">
 
   <header>
     	 <%@ include file= "../common/header.jspf" %>
     <%--  <jsp:include page="../common/header.jspf" flush="true" /> --%>
   </header>
   
    <div id="container">
     
        <div class="row" id="mypage-top">
            <div class="col-sm-2" style="background-color:#F7F7F7;"></div> 
            
            <div class="col-sm-8" style="background-color:#F7F7F7;">
	             <!-- 마이페이지 상단 --> 
	               <jsp:include page="../common/mypage/mypageTop.jsp" flush="true" />
            </div> 

            <div class="col-sm-2" style="background-color: #F7F7F7;"></div>
        </div>

        <div class="blank"></div>
       
		<div class="row" id="mypage-bottom">
			<div class="col-sm-2"></div>
			
			<!-- 마이페이지네비메뉴 -->
			<jsp:include page="../common/mypage/mypageSide.jsp" flush="true" />
			
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
                  <dd class="price plusPoint"><input type="text" id="totEmoney" style="width: 100px"></span><span class="unit">원</span></dd>
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
                <ul id ="ul" style="padding: 0px;">
                  <!-- 데이터 있는만큼 반복 페이지당 10개   
                  		emoney 내역 
                 반복 끝-->
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
    	<jsp:include page="../common/footer.jspf" flush="true" />
    </footer>
    
 </body>
</html>