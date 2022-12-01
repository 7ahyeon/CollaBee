<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Session에 저장된 \${loginMember } : ${loginMember }
<!-- 마이페이지 윗부분 -->
			<div id="mypage-cover" style="height: 392px;">
                <div class="d-flex align-items-stretch" id="mypage-top">
 
                  <div class="mypage-top2" style="width: 40%;">
                    <div style="text-align: left;" id="user-grade" >
                      <div style="display: inline-block; height: 48px; margin-right: 20px;">
                        <img src="# alt="그림" style="width: 48px; height: 48px;">
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
                      <button type="button" class="btn" style="width: 100%; height: 100%;" onclick="emoneyload()"> 
                        <div style="padding-bottom: 25px;">
                          <div class="align-left" style="margin-bottom: 10px;"><b>적립금></b></div>
                          <div></div>
                          <div class="align-left purple-bold">1,497원</div>
                          <div class="align-left">소멸예정 0원</div>
                        </div>
                      </button>
                  </div>

                  <div class="mypage-top2" style="width: 30%; margin: 0;">
                    <button type="button" class="btn" style="width: 100%; height: 100%;" onclick="couponload()">
                      <div style="padding-bottom: 57px;">
                        <div class="align-left" style="margin-bottom:10px;"><b>쿠폰></b></div>
                        <div class="align-left purple-bold">1개</div>
                      </div>
                      <div></div>
                    </button>
                  </div>

                </div>
                <div id="eventbn">
                    <img src="# alt="이미지 배너" onclick="bannerClick()" style="width: 100%; height: 60px; margin: 0px;">
                </div>
              
              </div>