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
          word-spacing: 5px;}

      h4 span{letter-spacing: -1px;
        word-spacing: 1px;
        vertical-align: middle;
        font-size: small; color: gray;
      }
      .main{
        padding-bottom: 24px;
        padding-top: 10px ;
      }
      .inquiry{ display: flex;
        width: 100%;
        border-bottom: 1px solid rgb(51, 51, 51);
        text-align: center;
        height: 61px;
      }
      .inquiry_top{
      padding: 10px;
      font-size: 11pt;
      vertical-align: middle;
      font-weight: bolder;
      }
      .card{
      border: white;
      }
      .card-header{
        background-color: white;
        height: 55px;
        padding-top: 13px;
      }
      .card-header a{
        color: black;
        text-decoration: none;
        vertical-align: middle;
      }
      .card-header div{
        text-align: center;
        font-size: 10.5pt;
      }
      .card-header:hover{
        color: black;
        text-decoration: none;
        background-color: white;
      }
      .card-body{
        border-top-color: white;
        background-color: #FEF7FF;
      }
      .i_type{
        font-size: 9pt;
        color: darkgray;
      }
      .i_title_icon{
        display: inline;
        font-size: 15pt;
        padding-top: 4px;
        padding-bottom: 10px;
      }
      .i_title{
        vertical-align: center;
        display: inline;
        font-size: 10pt;
        padding-top: 4px;
        padding-bottom: 10px;
      }
      .i_answer_icon{
        display: inline;
        font-size: 15pt;
      }      
      .i_answer{
        vertical-align: center;
        display: inline;
        font-size: 10pt;
        color: grey;
        font-weight: bolder;
      }

      .btn_list{
        padding-top: 45px;
      }
      .btn1{
        display: inline-block;
        border: black;
        width: 44px;
        height: 44px;
        border-radius: 0.5em;
      }
      .btn1:hover{
        border: solid 1px darkgray;
      }
      .btn2{
        display: inline-block;
        border: black;
        width: 44px;
        height: 44px;
        border-radius: 0.5em;
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

</style>  
    </style>
  </head>
  <body style="width:1900px; margin: auto; margin-top: 50px;  padding: 0px;">
  
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
          <div class="main" style="border-bottom:2px solid black";>
            <h4>1:1 문의
          </h4>
          </div>
          <div>
            <div class="inquiry">
                <div class="inquiry_top" style="padding-top: 19px;"> 
                    <div style="width: 80px; display: inline-block;">글번호</div>
                    <div style="width: 600px; display: inline-block;">제목</div>
                    <div style="width: 200px; display: inline-block;">작성일</div>
                    <div style="width: 75px; display: inline-block;">답변상태</div>
                </div>
            </div>
            <div>
              <div id="accordion">
                <div class="card">
                  <div class="card-header">
                      <a class="card-link" data-toggle="collapse" href="#collapseOne">
                        <div style="width: 80px; display: inline-block;">1</div>
                        <div style="width: 600px; display: inline-block;">문의해용</div>
                        <div class="date" style="width: 200px;  display: inline-block;">2022.11.21</div>
                        <div style="width: 75px; display: inline-block;">답변완료</div>
                      </a>
                  </div>
                  <div id="collapseOne" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                      <div class="i_type">분류 > 세부분류</div>
                      <div>
                        <div class="i_title_icon">
                          <i class="bi bi-person-circle"></i>
                        </div>
                        <div class="i_title">
                          문의 합니다 ~ 어찌고 저찌고 ~ 
                        </div> 
                      </div>
                      <div>
                        <div class="i_answer_icon">
                          <i class="bi bi-chat-dots-fill"></i>
                        </div>
                        <div class="i_answer">
                          안냐세요 고객님 ~ 문의주신 내용 답변입니다
                          좋은 질문 (1 부) 서적이나 영화에서 어떤 주인공이 최악의 룸메이트가됩니까? 어떤 야외 활동을 시도하지 않았지만 원하십니까? 
                          많은 사람들이 비록 그것에 대해 거의 알지 못하지만 어떤 것에 대해 강한 의견을 가지고 있습니까? 몇 년 동안 어떤 허구의 인물들이 반한 적이 있습니까? 
                          많은 사람들이 바라는 바가 무엇이고, 일어나지 않을
                          좋은 질문 (1 부) 서적이나 영화에서 어떤 주인공이 최악의 룸메이트가됩니까? 어떤 야외 활동을 시도하지 않았지만 원하십니까? 
                          많은 사람들이 비록 그것에 대해 거의 알지 못하지만 어떤 것에 대해 강한 의견을 가지고 있습니까? 
                          몇 년 동안 어떤 허구의 인물들이 반한 적이 있습니까? 많은 사람들이 바라는 바가 무엇이고, 일어나지 않을
                        </div>
                      </div>
                      <div style="text-align: right;">                        
                        <a href="inquiry_answer" style="font-size:9pt; color: darkgray; text-decoration: none;">답변</a>
                        <a href="inquiry_modify" style="font-size:9pt; color: darkgray; text-decoration: none;">수정</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
                      <div style="width: 80px; display: inline-block;">2</div>
                      <div style="width: 600px; display: inline-block;">문의해용</div>
                      <div class="date" style="width: 200px;  display: inline-block;">2022.11.21</div>
                      <div style="width: 75px; display: inline-block;">답변완료</div>
                  </a>
                  </div>
                  <div id="collapseTwo" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다 
                      답변이다답변이다답변이다답변이다답변이다
                      <div style="text-align: right;">
                        <a href="inquiry_answer" style="font-size:9pt; color: darkgray; text-decoration: none;">답변</a>
                        <a href="inquiry_modify" style="font-size:9pt; color: darkgray; text-decoration: none;">수정</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
                      <div style="width: 80px; display: inline-block;">3</div>
                      <div style="width: 600px; display: inline-block;">문의해용</div>
                      <div class="date" style="width: 200px;  display: inline-block;">2022.11.21</div>
                      <div style="width: 75px; display: inline-block;">답변완료</div>
                    </a>
                  </div>
                  <div id="collapseThree" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다 
                      답변이다답변이다답변이다답변이다답변이다
                      <div style="text-align: right;">
                        <a href="inquiry_answer" style="font-size:9pt; color: darkgray; text-decoration: none;">답변</a>
                        <a href="inquiry_modify" style="font-size:9pt; color: darkgray; text-decoration: none;">수정</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <a class="collapsed card-link" data-toggle="collapse" href="#collapsefour">
                      <div style="width: 80px; display: inline-block;">4</div>
                      <div style="width: 600px; display: inline-block;">문의해용</div>
                      <div class="date" style="width: 200px;  display: inline-block;">2022.11.21</div>
                      <div style="width: 75px; display: inline-block;">답변완료</div>
                    </a>
                  </div>
                  <div id="collapsefour" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다 
                      답변이다답변이다답변이다답변이다답변이다
                      <div style="text-align: right;">
                        <a href="inquiry_answer" style="font-size:9pt; color: darkgray; text-decoration: none;">답변</a>
                        <a href="inquiry_modify" style="font-size:9pt; color: darkgray; text-decoration: none;">수정</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <a class="collapsed card-link" data-toggle="collapse" href="#collapsefive">
                      <div style="width: 80px; display: inline-block;">5</div>
                      <div style="width: 600px; display: inline-block;">문의해용</div>
                      <div class="date" style="width: 200px;  display: inline-block;">2022.11.21</div>
                      <div style="width: 75px; display: inline-block;">답변완료</div>
                    </a>
                  </div>
                  <div id="collapsefive" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다 
                      답변이다답변이다답변이다답변이다답변이다
                      <div style="text-align: right;">
                        <a href="inquiry_answer" style="font-size:9pt; color: darkgray; text-decoration: none;">답변</a>
                        <a href="inquiry_modify" style="font-size:9pt; color: darkgray; text-decoration: none;">수정</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <a class="collapsed card-link" data-toggle="collapse" href="#collapsesix">
                      <div style="width: 80px; display: inline-block;">6</div>
                      <div style="width: 600px; display: inline-block;">문의해용</div>
                      <div class="date" style="width: 200px;  display: inline-block;">2022.11.21</div>
                      <div style="width: 75px; display: inline-block;">답변완료</div>
                    </a>
                  </div>
                  <div id="collapsesix" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다 
                      답변이다답변이다답변이다답변이다답변이다
                      <div style="text-align: right;">
                        <a href="inquiry_answer" style="font-size:9pt; color: darkgray; text-decoration: none;">답변</a>
                        <a href="inquiry_modify" style="font-size:9pt; color: darkgray; text-decoration: none;">수정</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <a class="collapsed card-link" data-toggle="collapse" href="#collapseseven">
                      <div style="width: 80px; display: inline-block;">7</div>
                      <div style="width: 600px; display: inline-block;">문의해용</div>
                      <div class="date" style="width: 200px;  display: inline-block;">2022.11.21</div>
                      <div style="width: 75px; display: inline-block;">답변완료</div>
                    </a>
                  </div>
                  <div id="collapseseven" class="collapse" data-parent="#accordion">
                    <div class="card-body">
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다 
                      답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다답변이다                      
                      <div style="text-align: right;">
                        <a href="inquiry_answer" style="font-size:9pt; color: darkgray; text-decoration: none;">답변</a>
                        <a href="inquiry_modify" style="font-size:9pt; color: darkgray; text-decoration: none;">수정</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="btn_list">    
            <div class="btns">
              <button class="btn1" disabled>
                <i class="bi bi-chevron-left"></i>
              </button>
              <button class="btn2">
                <i class="bi bi-chevron-right"></i>
              </button>
              <!-- <button class="inquiry_btn" type="button" style="width: 120; height: 44; border-radius: 3;">등록하기</button> -->
            </div>
            </div>
            </div>
            <div class="col-sm-2"></div>
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
