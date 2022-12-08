<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%> 

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/picklist.css">
   	
</head>

<script>
$(function(){
	
	var mvo = { memberNum : ${loginMember.getMemberNum()} };
	console.log(mvo); 
	alert("JSON.stringify(mvo) : " + JSON.stringify(mvo)); 
 	
	$.ajax("getPickListAjax.do",{ 
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(data){
			//alert("성공"); 
			console.log(data);
			//console.log(data[0].issueDate);
			
			let htmlTag = "";
			let pick = data.Array;
			console.log("pick : " + pick);
			
			$.each(data, function(index, pick){ 
				htmlTag += '<div class="d-flex align-content-between pick-item-container" style="padding: 20px 0px;">';
				htmlTag += '<div class="item-col1">';
				htmlTag += '<div class="pick-item-img"><img src="'+ pick.thumSysFilename + '" style="width: 60px; height: 78px;"></div>';
				htmlTag += '</div>';
				htmlTag += '<div class="item-col2" style="width:600px; height: 79px; margin-left: 20px; margin-right: 100px; border: 2px soild #B03FE3;">';
				htmlTag += '<div class="pick-item-info-proname">'+ pick.productName +'</b></div>';
				htmlTag += '<div class="pick-item-info-price">' + pick.price + ' 원</div>';
				htmlTag += '</div>';
				htmlTag += '<div class="item-col3" style="width: 104px;">';
				htmlTag += '<div class="pick-item-del"><button type="button" class="btn btn-outline-del" style="margin-bottom: 10px;" onclick="delFromPick()">삭제</button></div>';
				htmlTag += '<div class="pick-item-del"><button type="button" class="btn btn-outline-add" onclick="addCart()"><i class="bi bi-cart4"></i>담기</button></div>';
				htmlTag += '</div>';
				htmlTag += '</div>';
				htmlTag += '<div class="item-col4" style="border-bottom: 0.5px solid grey;"></div>';
				
			});
			$("#pickList").html(htmlTag);
		
		},
		erroer: function(){
			alert("쿠폰 목록 불러오기 실패");
		}
	}); //ajax끝 
	
});

</script>
<script>
	function addCart() {
		alert("카트에 담기!"); //카트에담으면 찜목록에서 사라짐!
	}
	
	function delFromPick() {
		alert("찜목록에서 삭제");
	}

</script>



 <body style="width: 1900px;">
 
   <header>
     <!--  <jsp:include page="../common/header.jspf" flush="true" /> -->
     <%@ include file= "../common/header.jspf"%> 
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
                    <h4 style="margin-right: 20px;">찜한상품(<span><input type="text" id="pickCnt" value=""></span>개)</h4>
                  </div>
                  <div style="display: inline; line-height: 38px; vertical-align: bottom; "><small>찜한상품은 최대 100개까지 저장됩니다.</small></div>
              </div>
            </div>
				
				
 			<div class="mypage-top4" style="padding: 15px;">
             
              <!--반복-->
              <div class="content-container" id ="pickList">
<!-- 
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
 -->

              </div>
              <!--반복 끝-->
            
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