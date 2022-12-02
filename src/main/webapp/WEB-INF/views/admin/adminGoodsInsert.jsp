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
        letter-spacing: -2.5px;
      }
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
      .btn {
            background-color: #9A30AE;
            color: none;
      }
      button {
          border: none;
          box-shadow:none !important;
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
      button:hover {
        background-color: none;
      }
      
      /* 카테고리 부분*/
      #main-category-box, #sub-category-box {
        padding: 0px;
      }
      
      #main-category-box .category-container, #sub-category-box .category-container {
        border: solid 1px lightgray;
        padding-top: 18px;
      }

      #main-category-box button, #sub-category-box button {
        border: 0;
        margin-top: 5px;
        color: white;
      }

      #main-category-box ul, #sub-category-box ul {
        display: flex;
        flex-wrap: wrap;
      }

      #main-category-box ul .form-check, #sub-category-box ul .form-check {
        width: 250px;
        height: 30px;
      }

      /**/
      .category-box ul{
        list-style: none;
        padding: 0px;
      }

      .category-box input {
        display: none;
      }
      
      .category-box button {
        border: 0;
        background-color: var(--main-color);
        color: white;
      }
      
      .category-box .dropdown-menu {
        width: 100%;
        height: 200px;
      }

      .category-box .category-inner-box{
        border-right: solid 1px var(--border-faint-color);
        height: 190px;
      }
      
      .category-box .dropdown-menu .form-check {
        padding: 0px;
      }

      .category-box .dropdown-menu li {
        width: 200px;
        height: 30px;
        padding-left: 20px;
      }

      .overview {
        overflow: auto;
      }
</style>  

<script>
  function setThumbnail(event) {
      var fileUpload = event.target.parentNode; //이벤트 대상자의 부모
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        fileUpload.appendChild(img);
        img.setAttribute("src", event.target.result);
        img.setAttribute("width", 110);
        img.setAttribute("height", 160);
        img.setAttribute("class", "pre_img");
        document.querySelector("div#image_container").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);

    //미리 만들어 놓은 div에 text(파일 이름) 추가
    var name = document.getElementById('fileName');
    name.textContent = file.name;
  }

  function setThumbnail2(event) {
      var fileUpload = event.target.parentNode; //이벤트 대상자의 부모
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        fileUpload.appendChild(img);
        img.setAttribute("src", event.target.result);
        img.setAttribute("width", 200);
        img.setAttribute("height", 150);
        img.setAttribute("class", "pre_img");
        document.querySelector("div#image_container2").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]);

    //미리 만들어 놓은 div에 text(파일 이름) 추가
    var name = document.getElementById('fileName');
    name.textContent = file.name;
  }

  // Add the following code if you want the name of the file appear on select
  // $(".custom-file-input").on("change", function() {
  //   var fileName = $(this).val().split("\\").pop();
  //   $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
  // });



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
          <div style="width: 800px;">
            <div class="main" style="border-bottom:2px solid black";>
                <h4>상품등록</h4>
            </div>
            <br>
              <form id="form" name="form" method="post">
                  상품번호 <input type="text" class="form-control form-control" name="productNum" style="border: none;" value="${goods.productNum}" disabled/>
                  <br>
                  상품명 <input type="text" class="form-control form-control" name="productName" placeholder="상품명을 입력하세요." autofocus/>
                  <br>
                  상품설명 <input type="text" class="form-control form-control" name="pDescription" placeholder="상품정보를 입력하세요."/>
                  <br>
                  상품가격 <input type="text" class="form-control form-control" name="price" placeholder="상품가격을 입력하세요."/>
                  <br>
                  할인율 <input type="text" class="form-control form-control" name="disRate" placeholder="할인율을 입력하세요."/>
                  <br>
                  할인가격 <input type="text" class="form-control form-control" name="saleprice" placeholder="할인가격을 입력하세요."/>
                  <br>
                  할인기간 <input type="date" class="form-control form-control" name="disDate"/>
                  <br>
                  입고수량 <input type="text" class="form-control form-control" name="stock" placeholder="입고할 수량을 입력하세요."/>
                  <br>
                  포장타입
	              <br>  
			        <form>
					  <select name="condition" >
					    <option value="none">=== 선택 ===</option>
					    <option value="1">냉장</option>
					    <option value="2">냉동</option>
					    <option value="3">상온</option>
					  </select>
					</form>
                  <br>
                  배송유형 
                  <br>  
			        <form>
					  <select name="deliveryType" >
					    <option value="none">=== 선택 ===</option>
					    <option value="1">샛별배송</option>
					  </select>
					</form>
                  <br> 
                  <span>카테고리</span>
                  <div id="main-category-box" class="container">
                    <div style="display: inline-block; padding: 5px; border-radius: 4px;margin-top:10px; background-color: lightgray;">대분류</div>
                    
                      <div class="category-container">
                        <ul>
                          <div class="form-check">
                            <label class="form-check-label" for="main-category1">
                              <li><input id="main-category1" type="radio" class="form-check-input main-category" name="mainCategory">
                               	 채소
                              </li>
                            </label>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label"  for="main-category2"> 
                              <li><input id="main-category2" type="radio" class="form-check-input main-category" name="mainCategory"> 
								과일•견과•쌀
                              </li>
                            </label>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label" for="main-category3">
                              <li><input id="main-category3" type="radio" class="form-check-input main-category" name="mainCategory">
								수산•해산•건어물

                              </li>
                            </label>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label" for="main-category4">
                              <li><input id="main-category4" type="radio" class="form-check-input main-category" name="mainCategory">
								정육•계란
                              </li>
                            </label>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label" for="main-category5">
                              <li><input id="main-category5" type="radio" class="form-check-input main-category" name="mainCategory">
								국•반찬•메인요리
                              </li>
                            </label>
                          </div>
                          <div class="form-check">
                            <li><input id="main-category6" type="radio" class="form-check-input" name="mainCategory">
                              <label class="form-check-label" for="main-category6">샐러드•간편식 </label>
                            </li>
                          </div>
                          <div class="form-check">
                            <li><input id="main-category7" type="radio" class="form-check-input" name="mainCategory">
                              <label class="form-check-label" for="main-category7">면•양념•오일 </label>
                            </li>
                          </div>
                          <div class="form-check">
                            <li><input id="main-category8" type="radio" class="form-check-input" name="mainCategory">
                              <label class="form-check-label" for="main-category8">생수•음료•우유•커피 </label>
                            </li>
                          </div>
                          <div class="form-check">
                            <li><input id="main-category9" type="radio" class="form-check-input" name="mainCategory">
                              <label class="form-check-label" for="main-category9">간식•과자•떡 </label>
                            </li>
                          </div>
                          <div class="form-check">
                            <li><input id="main-category10" type="radio" class="form-check-input" name="mainCategory">
                              <label class="form-check-label" for="main-category10">베이커리•치즈•델리</label>
                            </li>
                          </div>
                          <div class="form-check">
                            <li><input id="main-category11" type="radio" class="form-check-input" name="mainCategory">
                              <label class="form-check-label" for="main-category11">건강식품</label>
                            </li>
                          </div>
                          <div class="form-check">
                            <li><input id="main-category12" type="radio" class="form-check-input" name="mainCategory"> 
                              <label class="form-check-label" for="main-category12">생활용품•리빙•캠핑</label>
                            </li>
                          </div> 
                        </ul>
                    </div>
                  </div>
                  <div id="sub-category-box" class="container">
                    <div style="display: inline-block; padding: 5px; border-radius: 4px;margin-top:10px; background-color: lightgray;">소분류</div>
                      <div class="category-container">
                        <ul>
                          <div class="form-check">
                            <label class="form-check-label" for="sub-category1">
                              <li><input id="sub-category1" type="radio" class="form-check-input main-category" name="subCategory">
                                	채소
                              </li>
                            </label>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label"  for="sub-category2"> 
                              <li><input id="sub-category2" type="radio" class="form-check-input main-category" name="subCategory"> 
                                	과일•견과•쌀
                              </li>
                            </label>
                          </div>
                          <div class="form-check">
                            <label class="form-check-label" for="sub-category3">
                              <li><input id="sub-category3" type="radio" class="form-check-input main-category" name="subCategory">
                               	 수산•해산•건어물
                              </li>
                            </label>
                          </div>
                          
                        </ul>
                    </div>
                  </div>

                  <br>
                  판매자 <input type="text" class="form-control form-control" name="seller" value="${goods.seller}" disabled/> 
                  <br>
                  등록일자 <input type="text" class="form-control form-control" name="regdate" value="${goods.regdate}" disabled/>
                  <br>

                  상품이미지
                  <!-- <div class="form-group" style="margin: 8px 0 8px;">
                      <input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:85%; display: inline;"/>
                      <div class="fileUpload">
                          <input type="file" id="image" name="thumSysFilename" onchange="setThumbnail(event);" multiple/>
                      </div>
                      <br>
                      <div class="fileUpload">
                        <input type="file" id="image" name="detaileSysFilename" onchange="setThumbnail(event);" multiple/>
                    </div>
                    <br>
                    <input type="submit" value="파일업로드">
                  </div> -->

                  <form method="post" enctype="multipart/form-data">
                    <div class="custom-file">
                      <input type="file" class="custom-file-input" id="customFile" name="thumSysFilename" onchange="setThumbnail(event);" multiple>
                      <label class="custom-file-label" for="customFile">썸네일 이미지</label>
                    </div>
                    <div id="image_container"></div>
                    <br><br>
                    <div class="custom-file">
                      <input type="file" class="custom-file-input" id="customFile2" name="detaileSysFilename" onchange="setThumbnail2(event);" multiple>
                      <label class="custom-file-label" for="customFile2">상세 이미지</label>
                    </div>
                    <div id="image_container2"></div>
                  </form>
              </form>
            <div class="col-sm-2"></div>
          </div>
        </div>
      </div>
         
        <div style="display: flex; justify-content: center;">
          <input type="submit" class="btn" onclick="" value="상품등록" style="border: none; color: white; margin-right: 15px;"> 
          <input type="reset" class="btn" style="border: none; color: white;" value="초기화">
        </div>
    </body>
     <br><br>
    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
  </html>