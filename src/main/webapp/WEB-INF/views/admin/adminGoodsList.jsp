<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>콜라비</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
        
      h4 span{letter-spacing: -1px;
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
      } */

      /* table > tbody:hover {
        background-color: #FEF7FF;
      } */
      
      #th_checkAll {
      	background-color: #B03FE3;
      }
      
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
          <div style="width: 900px;">
            <div class="main" style="border-bottom:2px solid black";>
                <h4>등록된 상품 목록</h4>
            </div>
              <form id="form" name="form" method="post">
              
               
                <table class="table table-hover">
                	<colgroup>
                		<col style="width: 5%">
                		<col style="width: 10%">
                		<col style="width: 20%">
                		<col style="width: 25%">
                		<col style="width: 10%">
                		<col style="width: 10%">
                		<col style="width: 10%">
                		<col style="width: 10%">
                	</colgroup>
                  <thead>
                    <tr>
                      <th class="center"><input type="checkbox" class="" name="checkAll" id="th_checkAll" style="width: 20px; height: 45px; vertical-align: middle;"/></th>
                      <th class="text-center" style="vertical-align: middle;">상품번호</th>
                      <th style="vertical-align: middle;">상품이미지</th>
                      <th style="vertical-align: middle;">상품명</th>
                      <th style="vertical-align: middle;">할인가격</th>
                      <th style="vertical-align: middle;">포장타입</th>
                      <th style="vertical-align: middle;">배송유형</th>
                      <th style="vertical-align: middle;">재고</th>
                    </tr>
                  </thead>
                  <tbody id="listDisp">
                  <c:if test="${not empty goodsList }">
					<c:forEach var="admin" items="${goodsList }" >
						<tr>
							<td class="center"><input type="checkbox" class="chk" name="checkRow" value="${content.IDX}" style="width: 20px; height: 20px;"></td>
							<td class="center">${admin.productNum }</td>
							<td class="center"><img src="${admin.thumSysFilename }" alt="상품"></td>
							<td class="center"><a href="adminGoodsSelect.do" style="color: black;">${admin.productName }</a></td>
							<td class="center">${admin.saleprice }</td>
							<td class="center">${admin.condition }</td>
							<td class="center">${admin.deliveryType }</td>
							<td class="center">${admin.stock }</td>
						</tr>
					</c:forEach>
				  </c:if>
                  
                   
                  </tbody>
                </table>
              <div class="btn_list">    
                <div class="btns">        
                  <button class="btn1" disabled>
                    <i class="bi bi-chevron-left"></i>
                  </button>
                  <button class="btn2" onclick="getJsonGoodsListData(this.form)">
                    <i class="bi bi-chevron-right"></i>
                  </button>
              </form>
                       
    			  <%-- 상품삭제 버튼 클릭 시 모달 include --%>
    			  <%@ include file = "../common/modal/goodsDeleteModal.jspf" %>

					<input type="button" value="수정" class="inquiry_btn" onclick="admin/adminGoodsModify.do?productNum=${goods.productNum }" style="width: 60px; height: 44; border-radius: 3; margin-left: 10px;">    				
					<input type="button" value="상품등록" class="inquiry_btn" onclick="admin/adminGoodsInsert.do" style="width: 80px; height: 44; border-radius: 3; margin-left: 10px;">    				
                  <!-- <button class="inquiry_btn" type="button" onclick="admin/adminGoodsModify.do" style="width: 60px; height: 44; border-radius: 3; margin-left: 10px;">수정</button>
                  <button class="inquiry_btn" type="button" onclick="admin/adminGoodsInsert.do" style="width: 100px; height: 44; border-radius: 3;">상품 등록</button> -->
                </div>
              </div>
              <div class="col-sm-2"></div>
            </div>
            </div>
          </div>
          
          <!-- <div class="text-center">
            <ul class="pagination justify-content-center pagination my">
                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">다음</a></li>
            </ul>
        </div> -->
      </div>
    </div>
    
    <script>
     function getJsonGoodsListData(form) {
			alert("getJsonGoodsListData() 실행1");
			console.log($(form).serialize());
			console.log("dkdk");
			$.ajax("getJsonGoodsList.do", {
				type: "get",
				data: $(form).serialize(),
				dataType: "json",
				success: function(data) {
					alert("성공~~~");
					console.log(data);
					
					let dispHtml = "";
					for (let goods of data) {
						dispHtml += "<tr>";
						dispHtml += "<td class='center'><input type='checkbox' class='chk' name='checkRow' value=" + content.IDX + "style='width: 20px; height: 20px;'></td>";
						dispHtml += "<td class='center'>" + goods.productNum + "</td>";
						dispHtml += "<td class='center'><img src=" + goods.thumSysFilename + "alt='상품'></td>";
						dispHtml += "<td class='center'><a href='adminGoodsSelect.do' style='color: black;'>" + goods.productName + "</a></td>";
						dispHtml += "<td class='center'>" + goods.saleprice + "</td>";
						dispHtml += "<td class='center'>" + goods.condition + "</td>";
						dispHtml += "<td class='center'>" + goods.deliveryType + "</td>";
						dispHtml += "<td class='center'>" + goods.stock + "</td>";
						dispHtml += "</tr>";
					}					
					$("#listDisp").html(dispHtml);
				},
				error: function(){
					alert("실패~");
				}
			});
		}
    </script>
    
  </body>
<br><br>
    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
</html>