<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
	<%@ include file= "../common/bootstrap.jspf"%>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberCSS/findPw.css">

<script>
$(function(){ //document load
    var id = document.getElementById("id");
    var email = document.getElementById("email");
    
    // 아아디, 이메일 확인메시지
    let failid =  document.querySelector('.idmismatch-message');
    let failemail =  document.querySelector('.emailmismatch-message');

    id.onkeyup = function () {
      if (isMoreThan4Length(id.value)){
        failid.classList.add('hide')
      } else {
        failid.classList.remove('hide')
      }
    }
    function isMoreThan4Length(value) {
        return value.length >= 4
    }

    email.onkeyup = function () {
      if (email_check(email.value)) {
        failemail.classList.add('hide')
      } else {
        failemail.classList.remove('hide')
      }
    }  
    //이메일 정규식
    function email_check(email) {
      var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      return (email != '' && email != 'undefined' && regex.test(email));
    }

  });

  function emailAuth () {
    alert("이메일 인증");

    if (id.value == "") {
      alert("아이디 입력하세요.");
      id.focus();
      return false;
    }

    if (email.value == "") {
        alert("이메일 주소를 입력하세요.");
        email.focus();
        return false;
    }

    let emailFrm = document.emailAuthFrm;
    //전달 데이터확인
    console.log("아이디 : -" + document.emailAuthFrm.id.value + "-");
    console.log("이메일 : -" + document.emailAuthFrm.email.value + "-");

    //emailFrm.action = "pwdEmailAuth.do"; //랜덤번호 만들기
    //emailFrm.submit();
  }
  
</script>

</head>
<body>
   <header>
      <%@ include file= "../common/header.jspf"%>
    </header>
    <div id="container">
        <div class="row">
            <div class="col-sm-2"></div>
            
            <div class="col-sm-8">

              <div>
                  <h4 class="text-center" style="font-weight: bold; padding-bottom: 50px;">비밀번호 찾기</h4>
              </div>
              <div id="authBox" style="width: 400px; margin: auto;">
                <!-- <div class="menuBox text-center" style="text-align: center; margin: auto;">
                    <div class="menu" id="emailAuth"><button type="button" class="btn text-center emainAuth"><b>이메일 인증</b></button></div>
                </div>   
              -->
      
                <div class="emailAuthArea" id="emailAuthArea">
                  <form name="emailAuthFrm">

                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요">
                        <div class="idmismatch-message hide">가입시 등록한 아이디를 기입해주세요</div>
                    </div>
                    <div class="form-group">
                      <label for="phone">이메일</label>
                      <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요">
                      <div class="emailmismatch-message hide">가입시 등록한 이메일을 기입해주세요</div>
                    </div>

                    <div class="text-center">
                      <div><button type="button" id="authbtn" onclick="emailAuth()">확인</button></div>
                    </div>

                  </form>
                </div>


              </div>
            </div>
            
            <div class="col-sm-2"></div>
        </div>
        
    </div>    
    
    
    <footer>
    <%@ include file= "../common/footer.jspf"%>
    </footer>
</body>
</html>