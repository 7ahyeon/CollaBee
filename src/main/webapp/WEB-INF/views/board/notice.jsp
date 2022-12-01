<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>콜라비</title>
<%@ include file= "../common/bootstrap.jspf"%>
 <style>
    .list-group-item a {
      letter-spacing: -2px;
      text-decoration: none;
      color: black;
    }

    .list-group-item:hover {
      background-color: #fef7ff;
    }

    .list-group-item:hover>a {
      font-weight: bold;
      text-decoration: none;
      color: #b03fe3;
    }

    .list-group-item:hover>span {
      font-weight: bold;
      text-decoration: none;
      color: #b03fe3;
    }    

    .list-group-item a {
      width: 100%;
      display: block;
    }
    .clicked{
      color: #b03fe3;
    }

    li span {
      font-size: large;
      font-weight: bold;
      color: black;
    }

    h2 {
      font-weight: bold;
      letter-spacing: -2.5px;
    }

    h4 {
      font-weight: bolder;
      letter-spacing: -3px;
      word-spacing: 5px;
    }

    h4 span {
      letter-spacing: -1px;
      word-spacing: 2px;
      vertical-align: middle;
      font-size: small;
      color: gray;
    }

    .table {
      width: 100%;
      text-align: center;
      /* border: black; */
    }

    .table th {
      padding: 10px;
      font-size: 11pt;
      vertical-align: middle;
    }

    .table td {
      font-size: 10.5pt;
      height: 55px;
      padding-top: 17px;
      border-bottom: 1px solid lightgray;
    }

    .date {
      color: gray;
    }

    .n_title,
    .n_title:hover {
      text-decoration: none;
      color: black;
    }

    .btn_list {
      padding-top: 45px;
    }

    .btn1 {
      display: inline-block;
      border: black;
      width: 44px;
      height: 44px;
      border-radius: 0.5em;
    }

    .btn1:hover {
      border: solid 1px black;
    }

    .btn2 {
      display: inline-block;
      border: black;
      width: 44px;
      height: 44px;
      border-radius: 0.5em;
    }

    .btn2:hover {
      border: solid 1px darkgray;
    }

    .btns {
      text-align: center;
    }

    .notice_btn {
      padding: 0px 10px;
      text-align: center;
      overflow: hidden;
      width: 120px;
      height: 44px;
      border-radius: 3px;
      color: rgb(255, 255, 255);
      background-color: #9a30ae;
      border: 0px none;
      font-size: small;
      float: right;
    }

    .main {
      padding-bottom: 24px;
      padding-top: 10px;
    }
</style>

</head>
<body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
  <div class="container-fluid">
    <!-- header -->
    <header>
      <%@ include file = "../common/header.jspf" %>
    </header>
    
    <!--유정-->
    <div class="row" style="padding-top:50px; padding-bottom: 50px">
      <div class="col-sm-2"></div>
      <div class="col-sm-2">
       	<!-- 회원일때  --> 
        <h2>고객센터</h2>
        <br>
        <div>
          <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
              <a href="notice.do" width="100%">공지사항</a>
              <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              <a href="../faq/faq.do">자주하는 질문</a>
              <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              <a href="../inquiry/inquiry.do">1:1 문의</a>
              <span>></span>
            </li>
          </ul>
        </div>
        <!-- 관리자일때 -->
        <!--  
        <h2>관리자센터</h2>
        <br>
        <div>
            <ul class="list-group">
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="">상품등록</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="">상품목록</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="notice.do">공지사항</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="faq.do">자주하는 질문</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="inquiry.jsp">1:1문의</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="">쿠폰발행</a>
                <span>></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
                <a href="">배송관리</a>
                <span>></span>
            </li>
            </ul>
        </div>-->
      </div>
      <div class="col-sm-6">
        <div class="main" style="border-bottom: 2px solid black">
          <h4>공지사항
            <span>콜라비의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요</span>
          </h4>
        </div>
        <div>
          <table class="table">
            <thead>
              <tr style="height: 60px">
                <th style="width: 10%; vertical-align: middle; border-bottom-color: black; border-bottom-width: 1px;">번호</th>
                <th style="vertical-align: middle; border-bottom-color: black; border-bottom-width: 1px;">제목</th>
                <th style="width: 15%; vertical-align: middle; border-bottom-color: black; border-bottom-width: 1px;">작성자</th>
                <th style="width: 20%; vertical-align: middle; border-bottom-color: black; border-bottom-width: 1px;">작성일</th>
              </tr>
            </thead>
            <tbody>
           <c:if test="${not empty noticeList }"> 
           	<c:forEach var="notice" items="${noticeList }">
              <tr>
                <td>${notice.noticeNum }</td>
                <td><a class="n_title" href="notice_view.do?noticeNum=${notice.noticeNum }">${notice.noticeTitle }</a></td>
                <td>콜라비</td>
                <td class="date">${notice.noticeDate }</td>
              </tr>
            </c:forEach>
           </c:if> 
              <tr>
			<c:if test="${empty noticeList }">
				<tr>
					<td colspan="4" class="center">등록된 공지사항이 없습니다</td>
				</tr>
			</c:if>	
            </tbody>
          </table>
          <div class="btn_list">
            <div class="btns">
              <button class="btn1" disabled>
              	<i class="bi bi-chevron-left"></i>
              </button>
              <button class="btn2">
                <i class="bi bi-chevron-right"></i>
              </button>
              <!-- 관리자일때만 -->
              <button class="notice_btn" onclick="location.href='notice_write.do'" type="button">등록하기</button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-2"></div>
    </div>
  </div>

<!-- footer-->
     <footer>
       <%@ include file = "../common/footer.jspf" %>	
     </footer>   
</body>

</html>