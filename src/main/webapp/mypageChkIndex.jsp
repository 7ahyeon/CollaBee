<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	// Ajax 요청처리로 데이터 가져와서 화면 표시 
	//BoardAjaxController 사용
	function getJsonBoardListData() {
		alert("getJsonBoardListData() 실행");
		$.ajax("getJsonBoardList.do",{
			type: "get",
			dataType: "json",
			success: function(data){				
				alert("성공~~");
				console.log(data);
				
				let dispHtml ="<ul>";
				$.each(data, function(index, obj){ 
											//obj 현재 처리중인 데이터
					dispHtml += "<li>";
					dispHtml += this.seq + ", ";					
					dispHtml += this.title + ", ";					
					dispHtml += this["writer"] + ", ";					
					dispHtml += obj.content + ", ";					
					dispHtml += obj.regdate + ", ";					
					dispHtml += obj["cnt"];					
					dispHtml += "</li>";
				});
				dispHtml +="</ul>";
				
				$("#listDisp").html(dispHtml); //#listDip 안에 붙임
			},
			erro: function(){
				alert("실패~~");
			}
		})
	}
</script>
</head>
<body>

<div id="container">

	<h1>/member 진입용</h1>
	<hr>
	<p>
		<a href="member/signup.do">회원가입(GET)</a><br>
		<a href="member/findId.do">아이디 찾기(GET)</a><br>
		<a href="member/findPw.do">비밀번호 찾기(GET)</a><br>
		<a href="member/login.do">로그인</a><br>
	</p>
	<hr><hr>

	<h1>/mypage 진입용</h1>
	<hr>
	<p>	
		<a href="mypage/coupon.do">쿠폰페이지 (GET)</a><br>
		<a href="mypage/emoney.do">적립금 (GET)</a><br>
		<a href="mypage/info.do">개인정보수정 - 비밀번호 재확인(GET)</a><br>
		<a href="mypage/inquiryProduct.do">상품문의(GET)</a><br>
		<a href="mypage/leave.do">회원정보수정 - 회원탈퇴(GET)</a><br>
		<a href="mypage/modify.do">회원정보수정(GET)</a><br>
		<a href="mypage/order.do">주문 목록 (GET)</a><br>
		<a href="mypage/orderDetail.do">주문 상세(GET)</a><br>
		<a href="mypage/picklist.do">찜한상품(GET)</a><br>
		<a href="mypage/picklistAjax.do">찜한상품(GET)</a><br>
		<a href="mypage/review.do">리뷰(GET)</a>
	</p>
	<hr><hr>
	
	
	<h2>Ajax 요청처리</h2>  <!-- 그냥 내가 정한 자바스크립트 함수 -->
	<p><a href="javascript:getJsonBoardListData()">JSON데이터 가져오기(BoardList)</a></p>
	<p><a href="javascript:getJsonBoardData()">JSON데이터 가져오기(Board)</a></p>
	
	<div id="listDisp">
		<ul>
			<li>데이터 가져와서 출력하기</li>
		</ul>
	</div>
	
</div>

<script>
	function getJsonBoardData()	{
		alert("getJsonBoardData() 실행");
		//let vo = { seq : 1 }; 아래 두줄이랑 같음
		let vo = {};
		vo.seq = 1;
		console.log(vo);
		console.log(JSON.stringify(vo)); // JS객체를 JSON 문자열로 바꿔줄 수 있음
		
		$.ajax("getJsonBoard.do", {
			type: "post",
			data: JSON.stringify(vo), // 서버쪽으로 JSON 문자열 전달 
			contentType: "application/json", //서버로 전송하는 컨텐츠 유형(JSON형식)
			dataType: "json", //서버로부터 응답받는 데이터형식
			success: function(data) {
				alert("성공");
				console.log(data);
				
				let dispHtml ="<ul>";
					dispHtml += "<li>";
					dispHtml += data.seq + ", ";					
					dispHtml += data.title + ", ";					
					dispHtml += data.writer + ", ";					
					dispHtml += data.content + ", ";					
					dispHtml += data.regdate.substring(0,10) + ", ";					
					dispHtml += data.cnt;					
					dispHtml += "</li>";
					dispHtml +="</ul>";
					
				$("#listDisp").html(dispHtml); 
			},
			error: function() {
				alert("실패");
			}
			
		});
		
	}
</script>

</body>
</html>