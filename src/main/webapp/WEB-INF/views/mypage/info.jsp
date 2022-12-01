<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage 비밀번호 재확인 - 마켓콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%> 

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/picklist.css">
   	
<script>

</script>
<style>
    #purpleBtn {
      background-color: #692498; 
      color: white; 
      width: 240px; 
      height: 56px;
    }
    
    .form-group div {
      display: inline-block;
    }

    .form-group .title {
      text-align: left;
      width: 139px;
      height: 48px;
    }
    .form-group input {
      width: 333px;
      height: 46px;
    }

    .underline {
      border-bottom: 0.5px solid grey;
      margin-bottom: 7px;
    }
</style>
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
                <div style="width: 100%;">
                  <div id="category-name">
                    <h4 style="margin: 0px; padding-bottom: 27px;">개인 정보 수정</h4>
                  </div>
                  <h4 style="margin: 0px; padding-bottom: 8px;"><small><b>비밀번호 재확인</b></small></h4>
                  <div style="padding-bottom: 10px;"><small>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요</small></div>
              </div>
            </div>
				
				
 			<div class="mypage-top4" style="padding: 15px;">
             <form action="" name="infoUserChkFrm" style="text-align: center;">
                <div class="form-group">
                  <div class="title"><label for="id">아이디</label></div>
                  <div class="content"><input type="text" class="form-control" id="id" name="id" value="사용자아이디" disabled style="background-color: white;"></div>
                </div>
                <div class="form-group">
                  <div class="title"><label for="password">비밀번호<span class="text-danger font-weight-bold">*</span></label></div>
                  <div class="content"><input type="password" class="form-control" id="password" name="password"></div>
                </div>
                <div class="underline"></div>
                <div class="text-center" style="margin-top: 40px;">
                  <div style="padding-left: 80px;"><button type="button" onclick="infoUserChk()" class="btn text-center" id="#purpleBtn"><b>확인</b></button></div>
                </div> 
              </form>
            
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