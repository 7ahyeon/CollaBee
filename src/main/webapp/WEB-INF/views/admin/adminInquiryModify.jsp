<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>콜라비</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    
    <%@ include file = "../common/bootstrap.jspf" %>
    <style>

      .list-group-item a{
        letter-spacing: -2px; 
        text-decoration: none;
        color:black;
      }
      .list-group-item:hover {
        background-color: #FEF7FF;
      }     
      .list-group-item:hover >a {
        font-weight: bold;
        text-decoration: none;
        color:#B03FE3;
      }
      .list-group-item:hover >span {
        font-weight: bold;
        text-decoration: none;
        color:#B03FE3;
      }
      .list-group-item a {
        width: 100%;
        display: block;
      }

      li span{font-size: large;
        font-weight: bold;
        color: black;
      }
      
      h2{font-weight: bold;
        letter-spacing: -2.5px;}

      h4{font-weight: bolder;
          letter-spacing: -3px; 
          word-spacing: 5px;
        }

      span {letter-spacing: -1px;
        word-spacing: 2px;
        vertical-align: middle;
        font-size: medium; color: gray;
      }

      .main{
        padding-bottom: 24px;
        padding-top: 10px ;
      }

      .table {
        width: 100%;
        text-align: center;
      }

      .title{
        width: 100%; 
        vertical-align: middle; 
        padding-bottom: 9px; 
        border-color: lightgray; 
        border-width: 1px;
      }
      .btn_list{
        padding-top: 45px;
      }
      .answer_btn{
        padding: 0px 10px;
        text-align: center;
        overflow: hidden;
        width: 120px;
        height: 44px;
        border-radius: 3px;
        color: rgb(255, 255, 255);
        background-color: #9A30AE;
        border: 0px none;
        font-size: small;
        float: right;
      }

      textarea {
        resize: none;
      }

</style>  

  </head>
  <body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
  
  	  <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>
	
    <div class="container-fluid">
      <br><br><br>
      <div class="row" style="margin-bottom: 50px;">
        <div class="col-sm-2"></div>
        <div class="col-sm-2">
          <div style="width: 250px;">
            <h2>관리자 목록</h2>
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
                  <a href="">공지사항</a>
                  <span>></span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  <a href="">자주하는 질문</a>
                  <span>></span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  <a href="">1:1문의</a>
                  <span>></span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  <a href="">쿠폰발행</a>
                  <span>></span>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="main" style="border-bottom:2px solid black";>
            <h4>1:1 문의 답변 수정</h4>
          </div>
          <div>
            <table class="table">
              <tbody>
              <tr style="height: 60px;">
                <td style="width: 10%; vertical-align: middle; border-color: white;">제목</td>
                <td style="vertical-align: middle; border-color: white; text-align: left;">
                  저기용 질문할게요 
                </td>
                <span style="display: flex; justify-content: end; border-bottom: none;">${vo.regdate}</span>
              </tr>
              <tr style="height: 60px;">
                <td style="width: 10%; vertical-align: middle; border-color: gray;">문의 내용</td>
                <td style="vertical-align: left; border-bottom-color: gray;">
                  좋은 질문 (1 부) 서적이나 영화에서 어떤 주인공이 최악의 룸메이트가됩니까? 어떤 야외 활동을 시도하지 않았지만 원하십니까? 
                  많은 사람들이 비록 그것에 대해 거의 알지 못하지만 어떤 것에 대해 강한 의견을 가지고 있습니까? 몇 년 동안 어떤 허구의 인물들이 반한 적이 있습니까? 
                </td>
              </tr>
              <tr>
                <td style="font-weight: bolder;">답변</td>
                <td>
                    <textarea class="form-control" rows="18" id="comment" name="text" placeholder="답변 내용을 입력하세요.">전에 답변했던 내용</textarea>
                </td>        
              </tr>

            </tbody>
          </table>
          <div>    
            <button class="answer_btn" type="button" style="width: 120; height: 44; border-radius: 3;">수정</button>
          </div>
          </div>
              </div>
              </div>
              <div class="col-sm-2"></div>
            </div>
          </div>
    </body>
      <!-- footer -->
     <br><br> 
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
</html>
  