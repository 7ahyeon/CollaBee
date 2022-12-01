<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage 회원 탈퇴 - 마켓콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	
	<script src="${pageContext.request.contextPath }/resources/js/mypageScript.js"></script>
<script>
  function leaveCollabee () {
    alert("탈퇴 회원 상태 변경 및 탈퇴일자 체크");
    document.leaveFrm.action= "leaveCollabee.do";
    document.leaveFrm.submit();
  }

  function cancellation () {
    alert("탈퇴취소 회원정보수정[modify.html] 페이지 이동 ");
    location.href="/info/modify.html";
  }

</script> 
<style>
	.btn:active, .btn:focus {
	  outline:none !important;
	  box-shadow:none !important;
	}
	
	.blank{
	    height: 30px;
	}
	h3 {
	  padding: 50px 0px;
	  border-bottom: 2px solid black;
	}
	.leaveRow { 
	  padding-bottom: 30px;
	}
	.leaveInfoContainer {
	  width: 680px;
	  padding: 30px 20px 20px 20px;
	  margin: auto;
	}
	.title {
	  width: 140px;
	  text-align: left;
	  font-size: small;
	  font-weight: bold;
	  margin-right: 30px;
	  padding-top: 10px;
	}
	.content {
	  width: 481px;
	  font-size: small;
	  color: grey;
	  text-align: left;
	}
	ul, ul {
	  padding: 0%;
	  list-style: none;
	  text-align: left;
	}
	.mypage-top2 div {
	    margin-bottom: 10px;
	}
	
	.btn{
	  padding: 0px;
	}
	
	/* 버튼 */
	#purpleBtn {
	  background-color: #692498; 
	  color: white; 
	  width: 120px; 
	  height: 44px;
	}
	#whiteBtn {
	  background-color: white; 
	  border: 1px solid #692498;
	  color: #692498; 
	  width: 120px; 
	  height: 44px;
	}
	.purple-bold {
	    color: #B03FE3;
	    font-size: x-large;
	    font-weight: bold;
	}
	
	.col-sm-8 {
	  text-align: center;
	}
	
	textarea {
	  width: 479px;
	  height: 157px;
	  resize: none;
	  padding: 15px 16px;
	
	}
	
	.mypage-top4{
	  padding: 50px 15px 15px 15px;
	}
</style>
  
</head>
  
<body style="width: 1800px">
    <header>
      <%@ include file= "../common/header.jspf"%>
    </header>
   
    <div id="container">
        <div class="row" id="mypage-top">
            <div class="col-sm-2"></div> 
            
            <div class="col-sm-8">
              <div><h3>회원탈퇴안내</h3></div>

              <div class="leaveInfoContainer">
                
                <div class="d-flex leaveRow" style="padding-bottom: 10px;">
                  <div class="title" style="padding: 0px;">회원탈퇴안내</div>
                    <div class="content">고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다. 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
                      <strong class="content"><br>아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.</strong>
                      <ul class="content" style="width: 100%;">
                        <li class="">1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라 관리 됩니다.</li>
                        <li class="">2. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제 됩니다.</li>
                        <li class="">3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.</li>
                        <li class="">4. 회원 탈퇴 시 컬리패스 해지는 별도로 고객행복센터(1644-1107)를 통해서 가능합니다. 직접 해지를 요청하지 않으면 해지 처리가 되지 않습니다.</li>
                      </ul>
                    </div>
                </div>

                <form name="leaveFrm">

                  <div class="form-group">
                    <div class="d-flex leaveRow">
                      <div class="title"><label for="password">비밀번호 입력</label></div>
                      <div class="content"><input type="password" placeholder="현재 비밀번호를 입력해주세요" style="width: 332px; height: 46px; padding: 10px"></div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="d-flex leaveRow">
                      <div class="title">무엇이 불편하셨나요?</div>
                      <div class="content"><textarea placeholder="고객님의 진심어린 충고? 지적? 부탁드립니다?"></textarea></div>
                    </div>
                  </div>          
                  <div class="form-group">
                    <div class="col-xs-8 col-xs-offset-4 text-center">
                        <button type="button" onclick="cancellation()" class="btn text-center" id="whiteBtn"><small><b>취소</b></small></button>
                        <button type="button" onclick="leaveCollabee()" class="btn text-center" id="purpleBtn"><small><b>탈퇴</b></small></button>
                      </div>  
                  </div>

                </form>
              
              </div>
            </div> 

            <div class="col-sm-2"></div>
        </div>
      </div>

        
    </div>    
    
    
    <footer>
    	<%@ include file= "../common/footer.jspf"%>
    </footer>
  </body>
</html>