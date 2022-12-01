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
<!-- 카카오지도 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	//카카오 지도
   document.getElementById("address_kakao").addEventListener("click", function(){ 
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
                document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
            }
        }).open();
    });

   
	var name = document.getElementById("name");	
	var email = document.getElementById("email");	
	var phone = document.getElementById("phone");	
	var oldPassword= document.getElementById("oldPassword");
	var newPassword= document.getElementById("newPassword");
	var newPassword2= document.getElementById("newPassword2");

    
    // 비밀번호 일치 불일치 체크
    let mismatchmessage = document.querySelector('.mismatch-message');
    let matchmessage = document.querySelector('.match-message');

    newPassword2.onkeyup = function () {
	    if (isMatch(newPassword.value, newPassword2.value) ) {
	        mismatchmessage.classList.add('hide')
	        matchmessage.classList.remove('hide')
	    }
	    else {
	        mismatchmessage.classList.remove('hide')
	        matchmessage.classList.add('hide')
	    }
    }

    //비밀번호 값과 비밀번호 확인값 일치 확인
    function isMatch (newPassword, newPassword2) {
        if ( newPassword === newPassword2 ) {
            return true;
       	} else {
            return false;
        }
    }

    // 휴대폰 번호만 입력
    let numberchkmessage = document.querySelector('.numberchk-message');

    $("input[onlyNumber]").on('keyup', function(){
        $(this).val($(this).val().replace(/[^0-9]/g, ""));
    });
});

function confirmEmail () {
	var email = document.getElementById("email");	
	var phone = document.getElementById("phone");	

	if (email.value == ""){
		alert("이메일을 입력하세요");
		email.focus(); 
		return false;
	} else if (email.value == email.value){
		console.log("기존이메일사용");
		phone.focus();
	} else {
		let mvo = { email: email.value }   
		console.log("mvo : " + mvo.email)

		$.ajax("../member/confirmEmailAjax.do",{
			type: "post",
			data: JSON.stringify(mvo),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
					alert("성공"); 
					console.log("data: " +data);
					
					//중복확인결과
				    let duplicateMsg = document.querySelector('.duplicateEmail-message');
				    let availableMsg = document.querySelector('.availableEmail-message');
	
				    if(data == false){
						console.log("이메일 중복");
						email.value = "";
						email.focus();
						return false;
					}
					if(data == true){
						console.log("사용가능 이메일");
						availableMsg.classList.remove('hide');
						duplicateMsg.classList.add('hide');
						return false;
					}
			},
			erroer: function(){
				alert("실패");
			}
		}); //ajax끝
	}// else 끝
}

function mdfyMember() {
	alert("mdfyMember()실행");
	var id = document.getElementById("id");	
	var name = document.getElementById("name");	
	console.log("name :  " + name.value);
	
	var email = document.getElementById("email");	
	console.log("email :  " + email.value);
	
	var phone = document.getElementById("phone");	
	console.log("phone :  " + phone.value);
	
	var gender = document.querySelector("input[name=gender]").value;	
	console.log("gender :  " + gender);
	
	var newPassword= document.getElementById("newPassword");
	console.log("newPassword :  " + newPassword.value);
    
	var address = document.getElementById("address");
    var addressDetail = document.getElementById("addressDetail");
	
	var year= document.getElementById("birthYear");
	var month= document.getElementById("birthMonth");
	var day= document.getElementById("birthDay");
	var birthday = year.value + month.value + day.value;
	console.log("birth :  " + birthday);
	
	var oldPassword= document.getElementById("oldPassword");

	
	const modifyForm = document.modifyForm;


	var mvo = { id: id.value,  email: email.value , password: oldPassword.value };
	console.log(mvo);
	console.log(JSON.stringify(mvo)); // JS객체를 JSON 문자열로 바꿔줄 수 있음
	
	$.ajax("oldPwChkAjax.do", {
		type: "post",
		data: JSON.stringify(mvo), // 서버쪽으로 JSON 문자열 전달 
		contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
		dataType: "json", //서버로부터 응답받는 데이터형식
		success: function(data) {
				alert("정보 수정 시도");
			console.log(data);
			console.log("data.password : " + data.password);
			console.log("mvo.password : " + mvo.password);
			
			/* 	if (data.password  == false) {
				alert("정보 수정 실패");
				modifyForm.reset();
				oldPassword.focus();
				return false;
			} 
			if(data == true) {
				alert("정보 수정 가능");
				var mvo = { password: newPassword.value, name: name.value,  email: email.value, phone: phone.value, gender: gender, birth: birthday  }; 	
			
				$.ajax("modifyAjax.do", {
					type: "post",
					data: JSON.stringify(mvo), // 서버쪽으로 JSON 문자열 전달 
					contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
					dataType: "json", //서버로부터 응답받는 데이터형식
					success: function(data) {
						console.log(data);
						
						if (data == false) {
							alert("정보 수정 실패");
							modifyForm.reset();
							oldPassword.focus();
							return false;
						} else {
							alert("정보 수정 성공");
							loacation.href ="info.do";
						}

					},
					error: function() {
						alert("Ajax실패");
					}
					
				}); 
		
			}*/

		},
		error: function() {
			alert("Ajax실패");
		}
		
	});
	

	
} //mdfyMember()
</script>

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
                    <h4 style="margin-right: 20px;">개인 정보 수정</h4>
                  </div>
	            </div>
            </div>
				
			<!-- 개인정보 수정 폼 -->	
			<div class="mypage-top4"> 
			
			 <div class="modifyForm"> 
                <form name="modifyForm" method="post"> <!--signup.do-->
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>아이디</b></small><span class="text-danger">*</span></div>
                      <div class="form2">
                          <div class="input-area">
                              <input type="text" readonly class="form-control-plaintext purple-border" id="id" name="id" value="${loginMember.id }" style="width: 333px; padding: 9px 0px 6px 0px; font-weight: bold;">
                          </div>
                      </div>
                      <div class="form3"></div>
                  </div>
                  <div class="form-group form-inline">
                    <div class="form1"><small><b>현재 비밀번호</small><span class="text-danger">*</span></div>                                
                    <div class="form2">
                        <input type="password" class="form-control purple-border" id="oldPassword" name="oldPassword" placeholder="비밀번호를 입력해주세요" style="width: 333px;">
                    </div>
                    <div class="form3"></div>    	
                </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>새 비밀번호</small><span class="text-danger">*</span></div>                                
                      <div class="form2">
                          <input type="password" class="form-control" id="newPassword" name="password" placeholder="비밀번호를 입력해주세요" style="width: 333px;">
                      </div>
                      <div class="form3"></div>    	
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>새 비밀번호확인</b></small><span class="text-danger">*</span></div>                                
                      <div class="form2">
                          <div>
                              <input type="password" class="form-control" id="newPassword2" name="password2"  placeholder="비밀번호를 한번 더 입력해주세요" style="width: 333px;">
                          </div>
                          <div>
                              <div class="mismatch-message hide red-message">비밀번호가 일치하지 않습니다</div>
                              <div class="match-message hide purple-message">비밀번호가 일치합니다 ♡</div>
                          </div>                                
                      </div>	
                      <div class="form3"></div> 
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>이름</b></small><span class="text-danger">*</span></div>
                      <div class="form2"><input type="text" class="form-control" id="name" name="name"  value="${loginMember.name }" required="required" placeholder="이름을 입력해주세요" style="width: 333px;"></div>
                      <div class="form3"></div> 
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>이메일</b></small><span class="text-danger">*</span></div>
                      <div class="form2">
                      	<div>
	                      	<input type="text" class="form-control" id="email" name="email"  value="${loginMember.email }" required="required" placeholder="예:marketCollabee@collabee.com" style="width: 333px;"></div>
                      	</div>
                      	<div>
                      		<div class="failure-message hide red-message">이메일 형식에 맞춰주세요</div>
                           	<div class="duplicateEamil-message hide red-message">이미 사용중인 이메일입니다</div>
                            <div class="availableEmail-message hide purple-message">사용 가능한 이메일입니다♡</div>
                      	</div>
                      <div class="form3" onclick="confirmEmail()"><button class="chk-button"><small><b>중복확인</b></small></button></div>
                  </div>
                  <div class="form-group form-inline">
                      <div class="form1"><small><b>휴대폰</b></small><span class="text-danger">*</span></div>
                      <div class="form2">
                          <div>
                              <input type="text" class="form-control" id="phone" name="phone"  value="${loginMember.phone }" required="required" placeholder="숫자만 입력해주세요"  style="width: 333px;" onlyNumber>
                          </div>
                          <div>
                              <div class="numberchk-message hide">휴대폰 번호를 입력해주세요</div>
                          </div>
                      </div>
                      <div class="form3"></div> 
                  </div>
                   <div class="form-group form-inline" style="height: 150px">
                       <div class="form1"><small><b>주소</b></small><span class="text-danger">*</span></div>
                       <div class="form2">
                       	<input type="text" readonly class="form-control"  id="address" name="address"  value="${loginMember.address }" style="background-color: white; width: 333px; margin-bottom: 20px">
                       	<input type="text" class="form-control" id="addressDetail" name="addressDetail"  value="${loginMember.addressDetail }" required="required" placeholder="" style="width: 333px;">
                       </div>
                       <div class="form3" id="address_kakao"><button type="button" class="chk-button"><small><b>주소찾기</b></small></button></div>
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
                              <input data-testid="input-box" name="birthYear" id="birthYear"  value="${loginMember.birth.substring(0,4) }" placeholder="YYYY" type="text" class="birthFrmGroup" value="">
                            </div>
                          </div>
                          <div><span class="bi-slash-lg"></span></div>
                          <div class="d-flex align-content-between">
                            <div>
                              <input data-testid="input-box" name="birthMonth" id="birthMonth"  value="${loginMember.birth.substring(5,7) }" placeholder="MM" type="text" class="birthFrmGroup" value="">
                            </div>
                          </div>
                            <div><span class="bi-slash-lg"></span></div>
                            <div class="css-1dkwuq4 e1uzxhvi6">
                              <div>
                                <input data-testid="input-box" name="birthDay" id="birthDay"  value="${loginMember.birth.substring(8,10) }" placeholder="DD" type="text" class="birthFrmGroup" value="">
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
              <div>
              	
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