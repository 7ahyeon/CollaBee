<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓콜라비</title>
	<%@ include file="/WEB-INF/common/bootstrap.jspf" %> 

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberCSS/signup.css">

	<script src="${pageContext.request.contextPath }/resources/js/signupScript.js"></script>

</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
<script>

	function confirmId () {
		if (id.value == ""){ //script 파일에 있는 jquery 객체임
			alert("아이디를 입력하세요");
			id.focus(); 
			return false;
		} else {
			var getId = ("#id").val();
			location.href="corfirmId.do?id=getId";
		}
		
	}

	function confirmEmail () {
		if (email.value == ""){ //script 파일에 있는 jquery 객체임
			alert("이메일을를 입력하세요");
			id.focus(); 
			return false;
		}
	}
	
	function findAddress() {
		
	}
	
</script>

<body>
	<header>
        <%@ include file= "../common/header.jspf"%> 
    </header>
    
    <div id="container">
       
        <div class="row">
            <div class="col-2"></div>
            
            <div class="col-8">
                <div id="container">
                    
                   <div id="container">
                        <h4 class="text-center" style="padding-bottom: 50px; color: #666666; font-weight: bold;">회원가입</h4>
                    </div>
                    
                    <div id="text-right" style="border-bottom: 2px solid #666666; padding-bottom: 10px;">
                        <span class="text-danger">*</span><small>필수입력사항</small>
                    </div>

                    <div class="d-flex align-items-stretch justify-content-center">
                        <form name="signupfrm" action="" method="get"> <!--signup.do-->
                            <div class="form-group form-inline">
                                <div class="form1"><small><b>아이디</b></small><span class="text-danger">*</span></div>
                                <div class="form2">
                                    <div class="input-area">
                                        <input type="text" class="form-control" id="id" name="id" required="required" placeholder="아이디를 입력해주세요" style="width: 333px;">
                                    </div>
                                    <div>
                                        <div class="failure-message hide red-message">아이디는 네글자 이상이여야 합니다</div>
                                    </div>

                                </div>
                                <div class="form3" onclick="confirmId()"><button type="button" class="chk-button"><small><b>중복확인</b></small></button></div>
                            </div>
                            <div class="form-group form-inline">
                                <div class="form1"><small><b>비밀번호</small><span class="text-danger">*</span></div>                                
                                <div class="form2">
                                    <input type="password" class="form-control" id="password" name="password" required="required" placeholder="비밀번호를 입력해주세요" style="width: 333px;">
                                </div>
                                <div class="form3"></div>    	
                            </div>
                            <div class="form-group form-inline">
                                <div class="form1"><small><b>비밀번호확인</b></small><span class="text-danger">*</span></div>                                
                                <div class="form2">
                                    <div>
                                        <input type="password" class="form-control" id="password2" name="password2" required="required" placeholder="비밀번호를 한번 더 입력해주세요" style="width: 333px;">
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
                                <div class="form2">
                                	<input type="text" class="form-control"  id="address" name="address" style="width: 333px;">
                                	<input type="text" class="form-control"  name="address_detail" required="required" placeholder="" style="width: 333px;">
                                </div>
                                <div class="form3" onclick="findAddress()" id="address_kakao"><button type="button" class="chk-button"><small><b>주소찾기</b></small></button></div>
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
                                <div class="form2"><input type="date" class="form-control" id="birth" name="birth" style="width: 333px;"></div>
                                <div class="form3"></div>
                            </div>
                            <hr>

                            <div class="form-group d-flex align-content-between" >
                                <div class="form1" style="margin-left: 20px;">
                                    <small><b>이용약관동의</b></small>
                                </div>
                                
                                <div class="form-group" style="width: 80%;">
                                    <div class="form-check">
                                        <label for="allchk">
                                            <div class="agreeleft" style="margin-top: 0px;">
                                                <input type="checkbox" class="allchk" id="allchk" name="allchk">
                                                <i class="circle"></i>
                                                <span class="agreeleft">전체동의합니다</span>
                                            </div>
                                        </label>
                                        <p class="text-left"><small style="font-weight: lighter; letter-spacing: -1px;">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</small></p>
                                    </div>
                                    <div class="form-check">
                                        <label for="agree1">
                                            <div class="agreeleft">
                                            <input type="checkbox" class="chk" name="agree1" id="agree1">
                                                <i class="circle"></i>
                                                <span class="agreetext">이용약관 동의</span><span class="text-secondary agreetext font-weight-bold">(필수)</span>
                                                <button type="button" class="btn agreetext font-weight-bold" data-toggle="modal" data-target="#agreeModal1">약관보기></button>
                                                <div class="modal fade" id="agreeModal1">
                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                      <div class="modal-content">
                                                      
                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">이용약관(필수)</h4>
                                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                                        </div>
                                                        
                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                          Modal body.. <!-- 내용불러오기 -->
                                                        </div>
                                                        
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer"  style="text-align: center;">
                                                            <div class="modalBtn"><button type="button" class="btn" data-dismiss="modal" style="color:purple;">확인</button></div>
                                                        </div>
                                                        
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label for="agree2">
                                            <div class="agreeleft">
                                                <input type="checkbox" class="chk" name="agree2" required="required" id="agree2">
                                                <i class="circle"></i>
                                                <span class="agreetext">개인정보 수집.이용 동의</span><span class="text-secondary agreetext font-weight-bold">(필수)</span>
                                                <button type="button" class="btn agreetext font-weight-bold" data-toggle="modal" data-target="#agreeModal2">약관보기></button>
                                                <div class="modal fade" id="agreeModal2">
                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                      <div class="modal-content">
                                                      
                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">개인정보 수집.이용 동의(필수)</h4>
                                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                                        </div>
                                                        
                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                          Modal body.. <!-- 내용불러오기 -->
                                                        </div>
                                                        
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer"  style="text-align: center;">
                                                            <div class="modalBtn"><button type="button" class="btn" data-dismiss="modal" style="color:purple;">확인</button></div>
                                                        </div>
                                                        
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </label>
                                    </div> 
                                    <div class="form-check">
                                        <label for="agree3">
                                            <div class="agreeleft">
                                                <input type="checkbox" class="chk" name="agree3" id="agree3">
                                                <i class="circle"></i>
                                                <span class="agreetext">개인정보 수집.이용 동의</span><span class="text-secondary agreetext">(선택)</span>
                                                <button type="button" class="btn agreetext font-weight-bold" data-toggle="modal" data-target="#agreeModal1">약관보기></button>
                                                <div class="modal fade" id="agreeModal1">
                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                      <div class="modal-content">
                                                      
                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">이용약관(선택)</h4>
                                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                                        </div>
                                                        
                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                          Modal body.. <!-- 내용불러오기 -->
                                                        </div>
                                                        
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer"  style="text-align: center;">
                                                            <div class="modalBtn"><button type="button" class="btn" data-dismiss="modal" style="color:purple;">확인</button></div>
                                                        </div>
                                                        
                                                      </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </label>
                                    </div> 
                                    <div class="form-check">
                                        <label for="agree4">
                                            <div class="agreeleft">
                                                <input type="checkbox" class="chk" name="agree4" id="agree4">
                                                <i class="circle"></i>
                                                <span class="agreetext">본인은 만14세 이상입니다.</span><span class="text-secondary agreetext font-weight-bold">(필수)</span>
                                            </div>
                                        </label>
                                    </div> 
                                
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-8 col-xs-offset-4 text-center">
                                    <button type="button" onclick="signupChk()" class="btn text-center" style="background-color: #692498; color: white; width: 240px; height: 56px;"><b>가입하기</b></button>
                                </div>  
                            </div>

                        </form>
                    </div>

                </div>    
            </div>
            
            <div class="col-2"></div>
          
        </div>

    </div>
    
    <footer>
	    <%@ include file= "../common/footer.jspf"%>
    </footer>
    
</body>
</html>