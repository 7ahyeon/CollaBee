<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
	<%@ include file= "../common/bootstrap.jspf"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/mypageStyle.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypageCSS/review.css">

<script>
  $(function(){
    let beforeWriteArea = document.querySelector('.beforeWriteArea');
    let writtenArea = document.querySelector('.writtenArea');

    console.log("before writeArea" + beforeWriteArea);
    writtenArea.classList.add('hide');
    beforeWriteArea.classList.remove('hide');
    
    $('#beforeWrite').attr('style', "border-bottom:none; color: #692498");
    $('#written').attr('style', "background-color: #FEF7FF;");

    
  });
   $('#beforeWrite').click(function(){
     beforeWriteArea.classList.remove('hide'); //보이기
     writtenArea.classList.add('hide'); //숨김
     $('#beforeWrite').attr('style', "border-bottom:none; color: #692498");
     $('#written').attr('style', "background-color: #FEF7FF;");
   });
   $('#written').click(function(){
     writtenArea.classList.remove('hide'); //보이기
     beforeWriteArea.classList.add('hide');// 숨김
     $('#written').attr('style', "border-bottom:none; color: #692498");
     $('#beforeWrite').attr('style', "background-color: #FEF7FF;");
   });
  function modifyReview() {
    alert("리뷰 수정 팝업?");
  }
  function writeProReview() {
    alert("리뷰 작성 실행");
  }
</script> 

<style>
  /* -------------------------------------  */
  	.hide {
  		display: none;
  	}
       /* 리뷰창 제목 */
    .proReviewTitle{
      text-align: left;
      margin: 20px 0px 30px 0px;
    }

     label { 
         display: block; 
         margin-top: 20px; 
         letter-spacing: 2px; 
     } 
     form { 
      margin: 0 auto; 
      width: 100%; 
     } 
     input, textarea { 
         width: 439px; 
         height: 27px; 
         background-color: #efefef; 
         border-radius: 6px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         margin-top: 3px; 
         font-size: 0.9em; 
         color: #3a3a3a; 
     } 

    input:focus, textarea:focus{ 
        border: 1px solid #97d6eb; 
    } 

    /*리뷰 내용 적는 부분*/
     textarea {
      width: 530px;
      height: 157px;
      resize: none;
      padding: 15px 16px;
    }
     #write_review{ 
         width: 127px; 
         height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #write_review:hover{ 
         color: #fff; 
         background-color: #692498; 
         opacity: 0.9; 
     } 
     #cancel { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #cancel:hover{ 
         color: #fff; 
         background-color: #692498; 
         opacity: 0.9; 
     }

    .review-modal { 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 700px; 
         height: 550px; 
         border-radius: 0.5rem; 
     } 
     .close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
     } 
     .close-button:hover { 
         background-color: darkgray; 
     } 
     .show-modal { 
         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .writeProImg {
        width: 60px;
        height: 60px;
        border: 1px solid #216282;
     }
    .writeProName{
        margin-top: 13px;
        font-weight: bold;
    }
    

    .filebox, .buttonBox {
      width: 100%;
    }
    /*  파일첨부 모양 바꾸기 */
    /*위치조정*/
    .fileIconBox {
      margin-left: 20px;
      margin-bottom: 10px;
    }
    /* 1. 인풋스타일 변경 */
    .filebox .upload-name {
        display: inline-block;
        height: 40px;
        padding: 0 10px;
        vertical-align: middle;
        border: 1px solid #dddddd;
        width: 78%;
        color: #999999;
    }
    /* 2. 라벨스타일변경 */
    .filebox label {
        background-image: '<i class="bi bi-camera"></i>';
    }
    /* 3. 기존 모양 없애기 */
    .filebox input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }
  
</style>

</head>
 <body>
 
   <header>
		<%@ include file= "../common/header.jspf" %>
   </header>
   
    <div id="container">
     
        <div class="row" id="mypage-top">
            <div class="col-sm-2" style="background-color:#F7F7F7;"></div> 
            
            <div class="col-sm-8" style="background-color:#F7F7F7;">
	             <!-- 마이페이지 상단 --> 
	             <jsp:include page="../common/mypage/mypageTop.jsp" flush="true" />
            </div> 

            <div class="col-sm-2" style="background-color: #F7F7F7;"></div>
        </div>

        <div class="blank"></div>
       
		<div class="row" id="mypage-bottom">
			<div class="col-sm-2"></div>
			
			<!-- 마이페이지네비메뉴 -->
	  		 <jsp:include page="../common/mypage/mypageSide.jsp" flush="true" />
			
			<!-- 마이페이지 콘텐츠 영역 -->
			<div class="col-sm-6"> 
			
			<div class="mypage-top3">
                <div>
                  <div id="category-name" style="display: inline-block; margin-bottom: 9px;">
                    <h4 style="margin-right: 20px;">상품후기</h4>
                  </div>
                  <div>
                    <ul class="menuInfoList">
                      <li class="menuInfo">상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
                      <li class="menuInfo">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <span class="highlight" href="/mypage/inquiry/list">1:1 문의</span>에 남겨주세요.</li>
                    </ul>
                  </div>
              </div>
            </div>
				
			<!-- 내용 -->	
			<div class="mypage-top4">
			
 			<!-- 버튼 메뉴 영역 -->
              <div role="tablist" aria-orientation="horizontal" class="d-flex align-content-between" data-reach-tab-list="">
                <button class="reviewBtn chk " id="beforeWrite" type="button">작성 가능 후기</button>
                <button class="reviewBtn chk " id="written" type="button">작성한 후기</button>
              </div>
              
            <!-- 작성가능 후기 영역 -->
              <div class="beforeWriteArea hide">
                <div class="d-flex align-content-lg-between" style="padding:10px 0px; border-bottom: 1px solid black;">
                  <div style="width: 780px; font-weight: bold;">총 3개</div>                
                  <div style="float: right; color: #666666; font-size: small; margin-top: 5px; font-weight: bold;"><a>작성시 유의사항<i class="bi-question-circle"></i></a></div> <!--클릭시 모달창-->
                </div>

                <div class="review-container" style="">
                  <li class="d-flex inquiryPro-row" style="padding: 20px;">
                    <div class="pro_img"><img src="" style="width: 60px; height: 60px; border-radius: 5px;"></div>
                    <div class="pro_title" style="width: 560px; text-align: left;padding-left:20px"  >
                      <div class="pro_name font-weight-bold">[맨날먹는] 맛있는 반나나나 </div>
                      <div class="">2022.11.17 배송완료</div>
                    </div>
                    <div class="review-deadline minusPoint" style="width: 135px; margin-top: 20px; margin-right:20px;">12.17까지 작성 가능</div>
                    <div class="write_review" style="margin-top: 13px;">
                  <!--  <button type="button" class="trigger btn font-weight-bold" id = "writeReviewBtn" style="border: 1px solid lightgray; width: 100px; height: 36px; font-size: small; color: #666666;">후기작성</button> --> 
                      <button type="button" class="trigger btn font-weight-bold" id = "writeReviewBtn" data-toggle="modal" data-target="#reviewModal"  style="border: 1px solid lightgray; width: 100px; height: 36px; font-size: small; color: #666666;">후기작성</button> 
                    </div>
                  </li>
                </div>
                
                <!-- 후기작성 모달창 시작 The Modal -->
				<div class="modal fade" id="reviewModal">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
				    
				      	<!-- Modal Header -->
						<div class="modal-header">
						  <h4 class="modal-title">상품 후기</h4>
						  <button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
				
						<!-- Modal body -->
						<div class="modal-body">
						   <form action="" method="get" style="margin: 0px;">
                          <div class="productInfo d-flex align-content-between" style="margin-bottom: 20px;">
                              <div class="writeProImg" style="margin: 0px 20px"><img src="#"></div>
                              <div class="writeProName">[도제]촉촉한 생식빵 2cm //제품명</div>
                          </div>
                          <div class="writeArea d-flex">
                              <div>
                                  <label for="R_content"style="width: 80px; text-align: left;  margin: 0px; margin-right: 20px;" >내용</label> 
                              </div>
                              <div>
                                  <textarea type="text" name="R_content" placeholder="상품 특성에 맞는 후기를 작성해주세요. 예)레시피, 겉포장 속 실제 구성품 사진, 플레이팅, 화장품 사용자의 피부타입 등 (최소10글자 이상)" required="required"></textarea>
                              </div>
                          </div>
                        <div class="filebox d-flex align-content-between" style="margin-top:20px">
                          <div style="width: 80px; text-align: left; margin-top: 15px border: 1px solid #692498;">사진첨부</div>
                            <div class="fileIconBox">
                              <label for="file"><img src="https://cdn-icons-png.flaticon.com/512/1829/1829371.png" style="width: 60px; height: 60px; " alt="카메라" ></label>
                            </div>
                              <div>
                            <input type="file" id="file"> 
                          </div>
                        </div>
                        <div class="buttonBox" style="text-align: center;">
                          <input type="button" id="cancel"  class="close" data-dismiss="modal" value="취소"> 
                          <input type="button" id="write_review" value="작성하기" onclick="writeProReview()"> 
                        </div>
                        </form> 
						</div>
				
						<!-- Modal footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      </div>
				      
				    </div>
				  </div>
				</div>
                <!-- 후기 작성 모달창 끝 -->

             <!-- 작성한 후기 영역 -->
               <div class="writtenArea hide">
                <div class="d-flex align-content-lg-between" style="padding:10px 0px; border-bottom: 1px solid black;">
                  <div style="width: 780px; font-weight: bold;">총 3개</div>                
                  <div style="float: right; color: #666666; font-size: small; margin-top: 5px; font-weight: bold;"><a>작성시 유의사항<i class="bi-question-circle"></i></a></div> <!--클릭시 모달창-->
                </div>
                <div class="review-container" style="">
                  <li class="d-flex inquiryPro-row" style="padding: 20px;">
                    <div class="pro_img"><img src="" style="width: 60px; height: 60px; border-radius: 5px;"></div>
                    <div class="pro_title" style="width: 560px; text-align: left;padding-left:20px"  >
                      <div class="pro_name font-weight-bold">[맨날먹는] 맛있는 반나나나 </div>
                      <div class="">2022.11.17 배송완료</div>
                    </div>
                    <div class="review-deadline minusPoint" style="width: 135px; margin-top: 20px; margin-right:20px;"></div>
                    <!-- 답변여부에 따라 변경-->
                    <div class="write_review" style="margin-top: 13px;">
                      <button type="button" class="btn font-weight-bold" onclick="modifyReview()" style="border: 1px solid lightgray; width: 100px; height: 36px; font-size: small; color: #666666;">후기수정</button> 
                    </div>
                  </li>
                </div>
              </div> <!-- writtenArea 닫힘 -->
              
			</div>	   <!-- mypage-top4 -->
			</div> <!-- col-sm-6 -->
		   
		    <div class="col-sm-2"></div>
		    
		</div>
          
		<div class="blank"></div>
		
	</div>

    <footer>
		<%@ include file= "../common/footer.jspf" %>
    </footer>
    
  <script>
// 후기작성 팝업용 스크립트 html로드 후 실행
    var modal = document.querySelector(".review-modal"); 
    var trigger = document.querySelector(".trigger"); 
    var closeButton = document.querySelector(".close-button"); 
    var cancelButton = document.querySelector("#cancel");
  
    //console.log(modal);
  
    function toggleModal() { 
        modal.classList.toggle("show-modal"); 
    }
  
    function windowOnClick(event) { 
        if (event.target === modal) { 
            toggleModal(); 
        } 
    }
  
    trigger.addEventListener("click", toggleModal); 
    closeButton.addEventListener("click", toggleModal); 
    cancel.addEventListener("click", toggleModal); 
    window.addEventListener("click", windowOnClick); 
  
  </script>
 </body>
</html>