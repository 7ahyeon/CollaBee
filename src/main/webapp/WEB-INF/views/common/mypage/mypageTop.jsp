<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script>
$(function(){
	if (${empty loginMember }) {
		alert("로그인 정보가 없습니다.")
		location.href = "../member/loginpage.do";
	}
});
</script>

<script>
// 멤버십정보, 적립금, 쿠폰 정보불러오기
$(function(){
	var mvo = { memberNum : ${loginMember.getMemberNum()} };
	console.log(mvo); 
	
	//총 적립금
	$.ajax("getTotEmoneyAjax.do",{ //COUPONBOX 뷰에서 가져오기
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(emoneyUsage){
			//alert("성공> 받은 데이터 : " + emoneyUsage); 		
			console.log(emoneyUsage);
			if(emoneyUsage == ""){
				$('#totalEmoney').val('0');					
			} else {
				$('#totalEmoney').val(emoneyUsage);					
			}
		},
		error: function(){
			alert("getTotEmoneyAjax 실패")
		}
	});//ajax끝
		
	//쿠폰 갯수
	$.ajax("getCouponCntAjax.do",{ //COUPONBOX 뷰에서 가져오기
		type: "post",
		data: JSON.stringify(mvo),
		contentType: "application/json",
		dataType: "json",
		success: function(couponCnt){
			//alert("성공> 받은 데이터 : " + couponCnt); 		
			console.log(couponCnt);
			$('#couponCnt').val(couponCnt);
		},
		error: function(){
			alert("couponAjax 실패")
		}
	});//ajax끝
	
}); //document onload

// 마이페이지 상단
function emoney() {
	alert("적립금 페이지로 이동");
	location.href = "emoney.do";
}
function coupon() {
	alert("쿠폰 페이지로 이동");
	location.href = "coupon.do";
}
function bannerClick() {
	alert("이벤트 페이지로 이동 >> 컨트롤러 연결필요");
	//location.href = "coupon.do";
}
function inquiry() {
	alert("1:1문의  페이지로 이동 >> 컨트롤러 연결필요");
	//location.href = "coupon.do";
}
// 마이페이지 네비바
</script>    

<!-- 마이페이지 윗부분 -->
			<div id="mypage-cover" style="height: 392px;">
                <div class="d-flex align-items-stretch" id="mypage-top">
 
                  <div class="mypage-top2" style="width: 40%;">
                    <div style="text-align: left;" id="user-grade" >
                      <div style="display: inline-block; height: 48px; margin-right: 20px;">
	                     
	             		<c:if test="${loginMember.grade == 3 }">
	                       	<img src="../resources/imgs/member/grade3.png" style="width: 48px; height: 48px;">
	                 	</c:if>
	             		<c:if test="${loginMember.grade == 2 }">
	                       	<img src="../resources/imgs/member/grade2.png" style="width: 48px; height: 48px;">
	                 	</c:if>
	             		<c:if test="${loginMember.grade == 1 }">
	                       	<img src="../resources/imgs/member/grade1.png" style="width: 48px; height: 48px;">
	                 	</c:if>
            
                      </div>
                       		
                      <div style="display: inline-block; width: 156px;">
                        <span class="align-left" id="user-name"><b>${loginMember.name }님</b></span>
                      </div>
                    </div>
                      
                    <div class="align-left" id="save-rate"  style="text-align: left;">적립 0.1%</div>
                    <div id="membership-info-button" style="text-align: left; margin: auto;" >
                      <button type="button" class="btn" id="allgrade" style="margin-right: 50px; width: 151px; height: 41px;" onclick="">전체등급 보기</button>
                      <button type="button" class="btn" id="nextgrade"style="width: 151px; height: 41px;" onclick="">다음 달 예상등급 보기</button>
                    </div>
                  </div> 

                  <div class="mypage-top2" style="width: 30%;">
                      <button type="button" class="btn" style="width: 100%; height: 100%;" onclick="emoney()"> 
                        <div style="padding-bottom: 25px;">
                          <div class="align-left" style="margin-bottom: 10px;"><b>적립금></b></div>
                          <div></div>
                          <div class="align-left purple-bold">
								<input type="text" class="form-control-plaintext" id="totalEmoney" value=""
									style="width:100px;"> 원
							</div>
                          <div class="align-left">소멸예정 0원</div>
                        </div>
                      </button>
                  </div>

                  <div class="mypage-top2" style="width: 30%; margin: 0;">
                    <button type="button" class="btn" style="width: 100%; height: 100%;" onclick="coupon()">
                      <div style="padding-bottom: 57px;">
                        <div class="align-left" style="margin-bottom:10px;"><b>쿠폰></b></div>
                        <div class="align-left purple-bold">
                        	<input type="text" class="form-control-plaintext" id="couponCnt" value=""
                        		style="width:50px">개
                        </div>
                      </div>
                      <div></div>
                    </button>
                  </div>

                </div>
                <div id="eventbn">
                    <img src="# alt="이미지 배너" onclick="bannerClick()" style="width: 100%; height: 60px; margin: 0px;">
                </div>
              
              </div>