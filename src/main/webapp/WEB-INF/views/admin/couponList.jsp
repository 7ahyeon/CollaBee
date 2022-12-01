<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      .list-group-item:hover > a {
        font-weight: bold;
        text-decoration: none;
        color:#B03FE3;
      }
      .list-group-item:hover > span {
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
        
      span{letter-spacing: -1px;
        word-spacing: 2px;
        vertical-align: middle;
        font-size: small; color: gray;
      }
      .main{
        padding-bottom: 24px;
        padding-top: 10px ;
      }
      /* thead {
        background-color: #FEF7FF;
        vertical-align: middle;
      } */

      /* table > tbody:hover {
        background-color: #FEF7FF;
      } */
      
      .pagination>li>a, .pagination>li>span {
        border: 1px solid darkgray;
        color: darkgray;
      }
      .pagination > li > a:hover {
        background: #B03FE3;
        color: #fff;
      }
      button {
        border: none;
        box-shadow:none !important;
      }
      button:hover {
        background-color: none;
      }
      .form-check-input {
        margin: auto;
      }
      .text-center, .table{
        text-align: center;
      }
      .btn_list{
        padding-top: 45px;
      }
      .btn1, .btn2 {
        display: inline-block;
        border: black;
        width: 44px;
        height: 44px;
        border-radius: 0.5em;
      }
      .btn1:hover{
        border: solid 1px darkgray;
      }
      .btn2:hover{
        border: solid 1px darkgray;
      }
      .btns{
        text-align: center;
      }
      .inquiry_btn{
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

      .click {
        color: #B03FE3; 
        background-color: #FEF7FF;
      }

  </style> 
  
  <script>
    $(function(){
      $("#th_checkAll").click(function() {
        console.log($(this).is(":checked"));
        if ($(this).is(":checked")) {
          $(".chk:not(checked)").each(function() {
            $(this).prop("checked", true);
          });
        } else {
          $(".chk:checked").each(function() {
            $(this).prop("checked",false);
          });
        }
      });
    });


  </script>
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
          <div style="width: 1050px;">
            <div class="main" style="border-bottom:1px solid black;">
                <h4>쿠폰 발행 목록</h4>
            </div>
              <form id="form" name="form" method="post">
                <table class="table table-hover">
                  <thead>
                    <div>
                    <tr>
                      <th class="center"><input type="checkbox" name="checkAll" id="th_checkAll" style="width: 20px; height: 30px;" /></th>
                      <th class="text-center" style="vertical-align: middle; width: 100px; height: 60px; vertical-align: middle;">쿠폰번호</th>
                      <th style="vertical-align: middle; width: 300px;">쿠폰명</th>
                      <th style="vertical-align: middle;">할인금액</th>
                      <th style="vertical-align: middle;">총 수량</th>
                      <th style="vertical-align: middle;">최소 구매금액</th>
                      <th style="vertical-align: middle;">유효기간</th>
                      <th style="vertical-align: middle;">사용여부</th>
                    </tr>
                    </div>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="center"><input type="checkbox" class="chk" name="checkRow" value="${content.IDX}" style="width: 20px; height: 20px;"></td>
                      <td class="text-center">1</td>
                      <td><a href="#" style="text-decoration: none; color: black;">쿠폰명</a></td>
                      <td>3000</td>
                      <td>1</td>
                      <td>20000</td>
                      <td>2022-12-31</td>
                      <td>사용</td>
                    </tr>
                    <tr>
                      <td class="center"><input type="checkbox" class="chk" name="checkRow" value="${content.IDX}" style="width: 20px; height: 20px;"></td>
                      <td class="text-center">2</td>
                      <td><a href="#" style="text-decoration: none; color: black;">쿠폰명</a></td>
                      <td>5000</td>
                      <td>1</td>
                      <td>30000</td>
                      <td>2022-12-31</td>
                      <td>미사용</td>
                    </tr>
                    <tr>
                      <td class="center"><input type="checkbox" class="chk" name="checkRow" value="${content.IDX}" style="width: 20px; height: 20px;"></td>
                      <td class="text-center">3</td>
                      <td><a href="#" style="text-decoration: none; color: black;">쿠폰명</a></td>
                      <td>10000</td>
                      <td>1</td>
                      <td>50000</td>
                      <td>2022-12-31</td>
                      <td>미사용</td>
                    </tr>
                  </tbody>
                </table>
              </form>
              <div class="btn_list">    
                <div class="btns">
                  <button class="btn1" disabled>
                    <i class="bi bi-chevron-left"></i>
                  </button>
                  <button class="btn2">
                    <i class="bi bi-chevron-right"></i>
                  </button>
                                   
                  <%-- 쿠폰삭제 버튼 클릭 시 모달 include --%>
    			  <%@ include file = "../common/modal/couponDeleteModal.jspf" %>
                  
                  <button class="inquiry_btn" type="button" style="width: 80px; height: 44; border-radius: 3; margin-left: 10px;">쿠폰수정</button>
                  <button class="inquiry_btn" type="button" style="width: 80px; height: 44; border-radius: 3;">쿠폰발행</button>
                </div>
              </div>
              <div class="col-sm-2"></div>
            </div>
            </div>
          </div>

      </div>
    </div>
  </body>
  <br><br>
    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
</html>
  