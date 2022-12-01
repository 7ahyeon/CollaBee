<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage - 마켓콜라비</title>
  	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/modify.css">

	<script src="${pageContext.request.contextPath }/resources/js/mypageScript.js"></script>
</head>
 <body style="width: 1800px;">
 
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
                    <h4 style="margin-right: 20px;">개인 정보 수정</h4>
                  </div>
	            </div>
            </div>
				
			<!-- 개인정보 수정 폼 -->	
			<div class="mypage-top4"> 
			 <div class="modifyForm"> 
                <form name="modifyForm" action="" method="get"> <!--signup.do-->
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>아이디</b></small><span class="text-danger">*</span></div>
                      <div class="form2">
                          <div class="input-area">
                              <input type="text" readonly class="form-control-plaintext purple-border" id="id" name="id" value="사용자 아이디" style="width: 333px; padding: 9px 0px 6px 0px; font-weight: bold;">
                          </div>
                      </div>
                      <div class="form3"></div>
                  </div>
                  <div class="form-group form-inline">
                    <div class="form1"><small><b>현재 비밀번호</small><span class="text-danger">*</span></div>                                
                    <div class="form2">
                        <input type="password" class="form-control purple-border" id="password" name="password" required="required" placeholder="비밀번호를 입력해주세요" style="width: 333px;">
                    </div>
                    <div class="form3"></div>    	
                </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>새 비밀번호</small><span class="text-danger">*</span></div>                                
                      <div class="form2">
                          <input type="password" class="form-control" id="password2" name="password2" required="required" placeholder="비밀번호를 입력해주세요" style="width: 333px;">
                      </div>
                      <div class="form3"></div>    	
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>새 비밀번호확인</b></small><span class="text-danger">*</span></div>                                
                      <div class="form2">
                          <div>
                              <input type="password" class="form-control" id="password3" name="password3" required="required" placeholder="비밀번호를 한번 더 입력해주세요" style="width: 333px;">
                          </div>
                          <div>
                              <div class="mismatch-message hide red-message">비밀번호가 일치하지 않습니다</div>
                              <div class="match-message hide" style="font-size: small; color: purple;">비밀번호가 일치합니다 ♡</div>
                          </div>                                
                      </div>	
                      <div class="form3"></div> 
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>이름</b></small><span class="text-danger">*</span></div>
                      <div class="form2"><input type="text" class="form-control" id="name" name="name" required="required" placeholder="이름을 입력해주세요" style="width: 333px;"></div>
                      <div class="form3"></div> 
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>이메일</b></small><span class="text-danger">*</span></div>
                      <div class="form2"><input type="text" class="form-control" id="email" name="email" required="required" placeholder="예:marketCollabee@collabee.com" style="width: 333px;"></div>
                      <div class="form3" onclick="confirmEmail()"><button class="chk-button"><small><b>중복확인</b></small></button></div>
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>휴대폰</b></small><span class="text-danger">*</span></div>
                      <div class="form2">
                          <div>
                              <input type="text" class="form-control" id="phone" name="phone" required="required" placeholder="숫자만 입력해주세요"  style="width: 333px;" onlyNumber>
                          </div>
                          <div>
                              <div class="numberchk-message hide">휴대폰 번호를 입력해주세요</div>
                          </div>
                      </div>
                      <div class="form3"></div> 
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>주소</b></small><span class="text-danger">*</span></div>
                      <div class="form2"><input type="text" class="form-control" id="address" name="address" required="required" placeholder="" style="width: 333px;"></div>
                      <div class="form3"></div> 
                  </div>
                  <div class="">
                      <div class="form-group form-inline">
                      <div class="form1"><small><b>성별</b></small></div>
                          <div class="form2">
                              <label class="form-check-label" style="width: 333px;">
                                  <div class="genchk"><input type="radio" class="form-check-input" name="gender" value="male">남 자</div>
                                  <div class="genchk"><input type="radio" class="form-check-input" name="gender" value="female">여 자</div>
                                  <div class="genchk"><input type="radio" class="form-check-input" name="gender" value="no_select" checked>선택안함</div>
                              </label>
                          </div>
                      </div>
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>생년월일</b></small></label></div>
                      <div class="form2" style="border: 1px solid lightgray; border-radius: 5px;">

                        <div class="d-flex align-content-between">
                          <div class="">
                            <div>
                              <input data-testid="input-box" name="birthYear" placeholder="YYYY" type="text" class="birthFrmGroup" value="">
                            </div>
                          </div>
                          <div><span class="bi-slash-lg"></span></div>
                          <div class="d-flex align-content-between">
                            <div>
                              <input data-testid="input-box" name="birthMonth" placeholder="MM" type="text" class="birthFrmGroup" value="">
                            </div>
                          </div>
                            <div><span class="bi-slash-lg"></span></div>
                            <div class="css-1dkwuq4 e1uzxhvi6">
                              <div>
                                <input data-testid="input-box" name="birthDay" placeholder="DD" type="text" class="birthFrmGroup" value="">
                              </div>
                            </div>
                        </div>

                      </div>
                      <div class="form3"></div>
                  </div>
                  <hr>

                  <div class="form-group">
                      <div class="col-xs-8 col-xs-offset-4 text-center">
                          <button type="button" onclick="requestLeave()" class="btn text-center" id="whiteBtn"><small><b>탈퇴하기</b></small></button>
                          <button type="button" onclick="mdfyMember()" class="btn text-center" id="purpleBtn"><small><b>회원정보수정</b></small></button>
                        </div>  
                  </div>

              </form>
              </div>              
				
			</div>	<!-- mypage-top4" -->   
			
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