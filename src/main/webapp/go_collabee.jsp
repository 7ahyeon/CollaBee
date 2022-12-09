<%@page import="com.spring.collabee.biz.member.impl.MemberDAO"%>
<%@page import="com.spring.collabee.biz.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/* MemberVO loginMember = new MemberDAO().getMember("yusg9603");
	session.setAttribute("loginMember", loginMember); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1><a href="collections/main.do">콜라비 바로가기</a></h1>
	<h1><a href="cart/cart.do">장바구니 바로가기</a></h1>
	<h1><a href="coupons/couponsInsertPage.do">쿠폰등록</a></h1>
	<h1><a href="chatting/openChat.do?type=websocket"> 채팅 접속</a></h1>
	
	<h1><a href="chatting/openChat.do?type=sock"> SockJS 사용 채팅 접속 </a></h1>

	
</body>
</html>