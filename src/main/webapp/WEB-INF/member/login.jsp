<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - 마켓콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%>
	
	<script src="${pageContext.request.contextPath }/resources/js/mypageScript.js"></script>

<style>
  .col-sm-8{
          padding-top: 50px;
          padding-bottom: 50px;
      }
      input{
        width: 340px;
        height: 54px;
        padding: 0px 11px 1px 15px;
        margin-bottom: 10px;
      }
      .text-center{
        margin: 3px;
      }
      .text-right{
        width: 340px;
        text-align: right; 
        margin: auto;
      }

      form {
        margin: auto;
        width: 640px;
      }
      #fillbtn {
        background-color: #692498; 
        color: white; 
        width: 240px; 
        height: 56px;
      }
      #borderbtn {
        background-color: white; 
        color: #692498; 
        border:0.5px solid #692498; 
        width: 240px; 
        height: 56px;
      }
      a{
        text-decoration: none;
      }

</style>
<% String findIdLocation = "findId.do";  %>
<% String findPwLocation = "findPw.do";  %>

<script>
$(function(){
	var id = document.getElementById("id");
	var password = document.getElementById("password");	
    var loginFrm = document.getElementsByName("loginFrm");
    
    var mvo = $("#mvo").val();
	console.log('${mvo.memberState }');
/* 		
	if('${mvo.memberState }'=="실패"){
		alert("로그인실패");
		id.focus();
	} */
    
});

	/* function login() {
  		//alert("> [로그인] 버튼 클릭 메인페이지로 이동");
  		console.log("id : " + id.value + ", pw : " + password.value);
		location.href = "login.do";
		loginFrm.submit();
	} */
	
	function login() {
		var id = document.getElementById("id");
		var password = document.getElementById("password");	
		
		let mvo = { id : id.value , password : password.value }; 
		console.log(mvo);
		console.log(JSON.stringify(mvo)); // JS객체를 JSON 문자열로 바꿔줄 수 있음
		
		$.ajax("loginAjax.do", {
			type: "post",
			data: JSON.stringify(mvo), // 서버쪽으로 JSON 문자열 전달 
			contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
			dataType: "json", //서버로부터 응답받는 데이터형식
			success: function(data) {
				console.log(data);
				
				if (data.memberState == null) {
					alert("로그인실패");
					loginFrm.reset();
					id.focus();
					return false;
				} else {
					loginFrm.action = "login.do";
					loginFrm.submit();
					return false;
				}

			},
			error: function() {
				alert("실패");
			}
			
		});
	}
	
	function signup() {
	  location.href = "../member/signup.do";
	}
	
		
</script>

</head>
<body>
  	<header>
      <%@ include file= "../common/header.jspf"%>
    </header>
<b>Session에 저장된 \${loginMember } : ${loginMember }</b>
	
    
    <div id="container">
    
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
              <div id="container">
                  <h4 class="text-center" style="padding-bottom: 50px; color: #666666;">로그인</h4>
              </div>

                <div class="form-group">
                  <form name="loginFrm" method="post">
                    <div class="col-xs-8 col-xs-offset-4 text-center">
	                   <div><input type="hidden" id="mvo" value="${mvo}"></div>
                      <div><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"></div>
                      <div><input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요"></div>
                    </div>
                    <div id="findArea" class="text-right" style="margin-bottom: 20px;">
                      <a href="<%= findIdLocation %>" class="text-dark"><small>아이디 찾기</small></a>
                      <span class="text-dark"><small>|</small></span>
                      <a href="<%= findPwLocation %>" class="text-dark"><small>비밀번호 찾기</small></a>
                    </div>
                    <div class="form-group">
                      <div class="text-center">
                          <button type="button" class="btn text-center" id="fillbtn" style="width: 340px; height: 54px;" onclick="login()"><b>로그인</b></button>
                      </div>  
                      <div class="text-center">
                          <button type="button" class="btn text-center" id="borderbtn" style="width: 340px; height: 54px;" onclick="signup()"><b>회원가입</b></button>
                      </div>  
                    </div>

                  </form>
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