<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
<%@ include file= "../common/bootstrap.jspf"%>
<%@ include file= "../common/modal/agreeModal1.jspf"%>
<%@ include file= "../common/modal/agreeModal2.jspf"%>
<%@ include file= "../common/modal/agreeModal3.jspf"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/order.css">
<style>
	header {
		margin-bottom:100px;
	}
	footer {
		margin-top:300px;
	}
</style>
</head>
<body  style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
	<header>
		<%@ include file= "../common/header.jspf"%>
	</header>
	
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8  text-center" style="margin-bottom:20px;">
			<h3 style="font-weight: bolder;">주문서</h3>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-6" style="white-space: nowrap;">
			<div class="card" style="border:none;">
			    <div class="card-header bg-white" id="headingOne" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
		        	<p class="text-left" style="margin:0;">
		        		<span>
							<span style="font-size:1.2rem;font-weight:bold;">
								주문 상품
							</span>
		        		</span>
				    	<button class="btn btn-link float-right" onclick="openList()" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							<span><i class="bi bi-chevron-down" style="color:black;"></i></span>
				        </button>
					</p>
			    </div>
				<div class="orderInfo text-center text-dark font-weight-bold" style="padding:35px;font-size:1rem;white-space: nowrap;">
					<span>
						${orderGoods[0].productName } 외
					</span>
					<span style="color:#9A30AE;">
						${orderGoods.size() - 1 }개
					</span>
					 상품을 주문합니다.
				</div>
			    <c:forEach var="goods" items="${orderGoods }" varStatus="status">
				<!-- 할인가 없는 상품 -->
			    <div class="card-body product" style="display: none;padding:25px 10px 10px 5px;">
			    	<div class="d-flex  flex-row justify-content-between">
			    		<div class="item">
							<img class="productImgCart"  src="../resources/imgs/goods/${goods.thumSysFilename }" width="80px" >
				     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
			     				<c:if test="${goods.productName.length() > 39 }">
			     					${goods.productName.substring(0,39) }<br>
			     					${goods.productName.substring(39,cartGoods.productName.length()) }
			     				</c:if>
			     				<c:if test="${goods.productName.length() <= 39 }">
			     					${goods.productName }
			     				</c:if>
				     		</span>
			    		</div>
			    		<div class="item" style="margin-top:38px;">
				     		<span class="text-right text-dark font-weight-bold">
			     				${goods.count }개
			     			</span>
				     		<span class="text-right text-dark font-weight-bold" style="width:200px;">
			     				<c:if test="${goods.saleprice == goods.price }">
			     					<fmt:formatNumber pattern="###,###,###" value="${goods.price * goods.count }" /> 원
			     				</c:if>
			     				
								<!-- 할인가 있는 상품 -->
			     				<c:if test="${goods.saleprice != goods.price }">
			     					<fmt:formatNumber pattern="###,###,###" value="${goods.saleprice * goods.count }" /> 원
		     					<span class="text-secondary text-right" style="font-size:0.8rem;">
					     			<del>
					     				<fmt:formatNumber pattern="###,###,###" value="${goods.price * goods.count }" /> 원
					     			</del>
				     			</span>
			     				</c:if>
			     			</span>
			    		</div>
			    	</div>
		     	</div>

				</c:forEach>
			     			     	
	    	</div>
	    	<c:if test="${not empty loginMember}">
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<p class="text-left" style="margin:0 0 10px 0;">
		        		<span>
							<span style="font-size:1.2rem;font-weight:bold;">
								주문자 정보
							</span>
		        		</span>
		        	</p>
			    </div>
			    <div class="card-body" style="padding:15px 10px;">
			    
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			보내는 분
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.85rem;">
				    		<span>
				    			${loginMember.name }
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			휴대폰
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.85rem;">
				    		<span>
				    			${loginMember.phone.substring(0,3)}-${loginMember.phone.substring(3,7)}-${loginMember.phone.substring(7,11)}
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			이메일
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.85rem;">
				    		<span>
				    			${loginMember.email }
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:10px 0 10px 0;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left text-secondary" style="width: 200px;font-size: 0.7rem;">
				    		<span>
				    			이메일을 통해 주문처리과정을 보내드립니다.
				    			<br>
				    			정보 변경은 마이콜라비>개인정보 수정 메뉴에서 가능합니다.
				    		</span>
						</div>
			    	</div>
			    	
			    </div> 
  			</div>
  			</c:if>
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<div class="text-left" style="margin:0 0 10px 0;">
		        		<div class="d-flex justify-content-between">
							<div style="font-size:1.2rem;font-weight:bold;">
								배송 정보
							</div>
							<div class="info-title text-right text-secondary font-weight-bold" style="font-size:0.8rem;">
		        				배송지 변경 안내
		        				<i class="bi bi-question-circle" style="font-size:0.9rem;margin-left:2px;"></i>
	        				</div>
		        		</div>
		        	</div>
			    </div>
			    <div class="info-text font-weight-bold" style="background-color:#B03FE3;color:white;border:1px solid #B03FE3;padding:15px;border-radius:5px;font-size:0.7rem;">
					<span>장바구니, 홈에서 배송지를 변경할 수 있어요</span>
				</div>
			    <div class="card-body" style="padding:15px 10px;">
			    
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			배송지
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 700px;font-size: 0.85rem;white-space: normal;">
			    			<span class="orderAddr">
					    	<c:if test="${empty loginMember }">
								<c:if test="${empty orderNm }">
									<span style="color:#9A30AE;">배송지를 등록해주세요!</span>
								</c:if>						
								<c:if test="${not empty orderNm }">
									${orderNm.orderAddr }&nbsp;${orderNm.orderAddrDetail }
								</c:if>
							</c:if>
							<c:if test="${not empty loginMember }">
								${loginMember.address }&nbsp;${loginMember.addressDetail }
							</c:if>
							</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:30px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			상세 정보
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.85rem;">
			    			<span class="orderNamePhone">
			    			<c:if test="${empty loginMember }">
								<span style="color:#FFCD4A;">상세정보를 입력해주세요!</span>
							</c:if>
							<c:if test="${not empty loginMember }">
								${loginMember.name }, ${loginMember.phone.substring(0,3)}-${loginMember.phone.substring(3,7)}-${loginMember.phone.substring(7,11)}
							</c:if>
							</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.8rem;">
				    		<span class="orderPlaceRequest">
				    			문 앞 | 기타 (벨 누르지 말고 문 앞에 놔주세요)
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:5px 0 10px 0;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left text-dark" style="width: 200px;font-size: 0.8rem;">
				    		<span class="orderMMS">
				    			배송완료메시지 | 배송직후
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:5px 0 10px 0;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left text-dark" style="width: 200px;">
				    		<button type="button" class="btn btn-sm text-dark font-weight-bold" style="border:1px solid lightgray;font-size: 0.7rem;">
				    			수정
				    		</button>
						</div>
			    	</div>
			    </div> 
  			</div>
  			
	    	<div class="card" style="border:none;margin-top:50px;">
	    		 <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<p class="text-left" style="margin:0 0 10px 0;">
		        		<span>
							<span style="font-size:1.2rem;font-weight:bold;">
								배송 시간 선택
							</span>
		        		</span>
		        	</p>
			    </div>
			    <div class="card-body" style="padding:50px 10px;">
			    	<form action="#">
			    		<table class="deliveryTable">
			    			<thead>
			    				<tr>
				    				<th style="color:#FFCD4A;">샛별배송</th>
				    				<th>11/26 (토)</th>
				    				<th>11/27 (일)</th>
				    				<th>11/28 (월)</th>
				    				<th>11/29 (화)</th>
				    				<th>11/30 (수)</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    				</tr>
			    				<tr>
			    				</tr>
			    				<tr>
			    				</tr>
			    				<tr>
			    				</tr>
			    				<tr>
			    				</tr>
			    			</tbody>
			    		</table>
			    	</form>
			    </div> 
  			</div>
  			
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<div class="text-left" style="margin:0 0 10px 0;">
		        		<div class="d-flex justify-content-between">
							<div style="font-size:1.2rem;font-weight:bold;">
								쿠폰 / 적립금
							</div>
		        		</div>
		        	</div>
			    </div>
			    
			    <div class="card-body" style="padding:15px 10px;">
			    
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    			쿠폰 적용
			    		</div>
			    		<div class="item text-left" style="width: 700px;font-size: 0.8rem;white-space: nowrap;">
				    		<select name="couponNumber" title="쿠폰" id="select1" style="width:400px;padding:10px;border:1px solid lightgray;">
					            <option>사용가능 쿠폰 2장 / 전체 2장</option>
					            <option>무료 배송 쿠폰 </option>
					            <option>5000원 할인 쿠폰 </option>
					        </select>
					        <div style="padding-top:5px;">
					        	<a href="#" style="color:#9A30AE;text-decoration: none !important;font-size: 0.7rem;">
					        		쿠폰 사용 문의 (고객센터) >
					        	</a>
					        </div>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:30px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    			적립금 적용
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 180px;font-size: 0.85rem;white-space: nowrap;">
				    		<input type="number" placeholder="0" style="padding:5px;border:1px solid lightgray;">
						</div>
			    		<button type="button" class="btn btn-sm text-dark font-weight-bold" style="padding:7px;border:1px solid lightgray;font-size: 0.7rem;">
			    			모두 사용
			    		</button>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.8rem;">
				    		<span>
				    			사용가능 적립금
				    			<span class="font-weight-bold">
				    				315
				    			</span>
				    			원
				    		</span>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:10px 0 10px 0;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left text-secondary" style="width: 200px;font-size: 0.7rem;">
				    		<span>
				    			적립금 내역: 마이콜라비>적립금
				    		</span>
						</div>
			    	</div>
			    </div> 
  			</div>
  			
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<div class="text-left" style="margin:0 0 10px 0;">
		        		<div class="d-flex justify-content-between">
							<div style="font-size:1.2rem;font-weight:bold;">
								결제 수단
							</div>
		        		</div>
		        	</div>
			    </div>
			    
			    <div class="card-body" style="padding:15px 10px;">
			    
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    			결제 수단 선택
			    		</div>
			    		<div class="item text-left" style="width: 700px;font-size: 0.8rem;white-space: nowrap;">
				    		<button type="button" onclick="kakaoPay()" class="kakaoBtn btn font-weight-bold" style="padding:15px;width:390px;border:1px solid lightgray;">
				    			<i class="bi bi-chat-fill"></i> Pay
				    		</button>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start text-dark font-weight-bold" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
				    		<span>
				    		</span>
			    		</div>
			    		<div class="item text-left" style="width: 700px;">
				    		<div class="btn-group" style="width:390px;">
								<button type="button" class="cardBtn btn font-weight-bold" onclick="cardPay()" style="padding:15px 12px;font-size: 0.8rem;border:1px solid lightgray;">
									신용카드
								</button>
								<button type="button" class="easyBtn btn font-weight-bold" onclick="easyPay()" style="padding:15px 12px;font-size: 0.8rem;border:1px solid lightgray;">
									간편 결제
								</button>
								<button type="button" class="phoneBtn btn font-weight-bold" onclick="phonePay()" style="padding:15px 12px;font-size: 0.8rem;border:1px solid lightgray;">
									휴대폰
								</button>
							</div>
						</div>

			    	</div>
			    	
			    	<div id="cardPick1" class="payPick d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.8rem;">
			    			<select name="ptNum" title="결제수단" id="select2" style="margin:20px 0 0 200px;width:270px;padding:10px;border:1px solid lightgray;">
					            <option>현대</option>
					            <option>신한 </option>
					            <option>비씨(페이북)</option>
					            <option>KB국민</option>
					            <option>삼성</option>
					            <option>롯데</option>
					            <option>하나(외환)</option>
					            <option>NH채움</option>
					            <option>우리</option>
					            <option>수협</option>
					            <option>씨티</option>
					            <option>광주</option>
					            <option>전북</option>
					            <option>제주</option>
					            <option>신협체크</option>
					            <option>MG새마을체크</option>
					            <option>저축은행체크</option>
					            <option>우체국카드</option>
					            <option>KDB산업은행</option>
					            <option>카카오뱅크</option>
					        </select>
						</div>
			    	</div>
			    	<div id="cardPick2" class="payPick d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    		</div>
			    		<div class="item text-left" style="width: 200px;font-size: 0.8rem;">
			    			<select name="ptNum" title="결제수단할부" id="select2" style="margin:5px 0 10px 200px;width:270px;padding:10px;border:1px solid lightgray;">
					            <option>일시불</option>
					            <option>2개월(무이자)</option>
					            <option>3개월(무이자)</option>
					            <option>4개월</option>
					            <option>5개월</option>
					            <option>6개월</option>
					            <option>7개월</option>
					            <option>8개월</option>
					            <option>9개월</option>
					            <option>10개월</option>
					            <option>11개월</option>
					            <option>12개월</option>
					        </select>
					        <div style="padding-top:5px;">
					        	<span class="text-secondary" style="font-size: 0.7rem;">
					        		은행계열/체크/기프트/선불/법인/개인사업자/기업카드는 무이자 할부 시 제외
					        	</span>
					        </div>
						</div>
			    	</div>
			    	<div id="easyPick" class="payPick d-flex justify-content-start text-dark" style="font-size: 0.9rem;padding-top:10px;">
			    		<div class="item" style="width: 200px;">
			    		</div>
			    		<div class="item text-dark text-left font-weight-bold" style="margin:20px 0 0 200px;font-size: 0.9rem;">
			    			<span style="margin:7px;">
			    				<input type="radio" value="" name="ptNum" style="width:25px;height:25px;vertical-align: middle;" checked> 네이버페이
		    				</span>
		    				<span style="margin:10px;">
		    					<input type="radio" value="" name="ptNum" style="width:25px;height:25px;vertical-align: middle;"> 토스
		    				</span>
					        <div style="margin:10px;">
			    				<input type="radio" value="" name="ptNum" style="width:25px;height:25px;vertical-align: middle;"> 무통장입금
					        </div>
						</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-start" style="font-size: 0.9rem;padding:30px 0 10px 0;">
			    		<div class="item text-left text-secondary" style="width: 200px;font-size: 0.7rem;">
				    		<span>
				    			※ 카카오페이, 네이버페이, 토스 결제시 결제하신 수단으로만 환불되는 점 양해 부탁드립니다.
				    		</span>
						</div>
			    	</div>
			    </div> 
  			</div>
	    	<div class="card" style="border:none;margin-top:50px;">
			    <div class="card-header bg-white" style="border:none;border-bottom:1px solid black;text-decoration:none;margin:0;padding:0;">
			    	<div class="text-left" style="margin:0 0 10px 0;">
		        		<div class="d-flex justify-content-between">
							<div style="font-size:1.2rem;font-weight:bold;">
								개인정보 수집 / 제공
							</div>
		        		</div>
		        	</div>
			    </div>
			    
			    <div class="card-body" style="padding:15px 10px;">
			    	<form action="#">
				    	<div class="text-dark font-weight-bold" style="font-size:1rem;">
				    		<label>
								<input type="checkbox" name="cb0" class="check-all">
								<i class="circle"></i>
								<span class="chk-text" style="margin: 0 10px;">
									결제 진행 필수 전체 동의
								</span>
							</label>
				    	</div>
				    	<div class="text-dark" style="font-size:0.8rem;">
				    		<label>
								<input type="checkbox" name="cb1" id="cb1" class="check-one">
								<i class="circle"></i>
								<span class="chk-text" style="margin: 0 10px;text-decoration: underline;"
									data-toggle="modal" data-target="#agreeModal1">
									(필수) 개인정보 수집 · 이용 및 처리 동의
								</span>
							</label>
				    	</div>
				    	<div class="text-dark" style="font-size:0.8rem;">
				    		<label>
								<input type="checkbox" name="cb2" id="cb2" class="check-one">
								<i class="circle"></i>
								<span class="chk-text" style="margin: 0 10px;text-decoration: underline;"
									data-toggle="modal" data-target="#agreeModal2">
									(필수) 개인정보 제3자 제공 동의
								</span>
							</label>
				    	</div>
				    	<div class="text-dark" style="font-size:0.8rem;">
				    		<label>
								<input type="checkbox" name="cb3" id="cb3" class="check-one">
								<i class="circle"></i>
								<span class="chk-text" style="margin: 0 10px;text-decoration: underline;"
									data-toggle="modal" data-target="#agreeModal3">
									(필수) 전자지급 결제대행 서비스 이용약관 동의
								</span>
							</label>
				    	</div>
			    	</form>
			    	<div class="text-secondary" style="font-size:0.7rem;">
			    		<ul style="list-style: none;padding:30px 0 0 0;">
							<li>※ [주문 완료] 상태일 경우에만 주문 취소 가능합니다.</li>
							<li>※ 미성년자가 결제 시 법정대리인이 그 거래를 취소할 수 있습니다.</li>
							<li>※ 쿠폰, 적립금 사용 금액을 제외한 실 결제 금액 기준으로 최종 산정됩니다.</li>
							<li>※ 배송 불가 시 결제 수단으로 환불됩니다. 상품이 품절일 경우 신속하게 환불해 드리겠습니다.</li>
						</ul>
			    	</div>
			    </div> 
  			</div>
		    <div class="d-flex justify-content-center">
		    	<button id="orderBtn" type="button" onclick="orderCompleteGo()" class="btn font-weight-bold"
						style="width:250px;border:1px solid #9A30AE;background-color:#9A30AE;border-radius:3px;padding:15px;color:white;font-size:1rem;">
					182,552원 결제하기
				</button>
		    </div>
		</div>
		<!-- 결제 메뉴 -->
		<div class="col-sm-2">
			<div class="quickPayMenu">
				
				<div style="padding:15px">
					<p class="font-weight-bold text-dark" style="margin-bottom: 10px;">
						<span style="font-size:1.2rem;">
							결제 금액
						</span>
					</p>
				</div>
				
				<div style="padding: 0 20px;">
					<div class="d-flex flex-row justify-content-between" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							상품금액
						</div>
						<div class="font-weight-bold" style="margin-bottom: 10px;">
							216,215원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary" style="font-size:0.8rem;">
						<div style="margin-bottom: 5px;">
							┕ 상품금액
						</div>
						<div style="margin-bottom: 5px;">
							285,000원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary" style="font-size:0.8rem;">
						<div style="margin-bottom: 10px;">
							┕ 상품할인금액
						</div>
						<div style="margin-bottom: 10px;">
							-68,785&nbsp;원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							배송비
						</div>
						<div class="font-weight-bold" style="margin-bottom: 10px;">
							0&nbsp;원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							쿠폰 할인
						</div>
						<div class="font-weight-bold" style="margin-bottom: 10px;color:#FFCD4A;">
							-5000&nbsp;원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							적립금 사용
						</div>
						<div class="font-weight-bold" style="margin-bottom: 10px;color:#FFCD4A;">
							-315&nbsp;원
						</div>
					</div>
					
				</div>
				
				<div class=""style="padding: 20px 20px;">
					<div class="d-flex flex-row justify-content-between font-weight-bold" style="font-size:0.95rem;">
						<div style="margin-bottom: 10px;">
							최종결제금액
						</div>
						<div style="margin-bottom: 10px;color:#9A30AE;font-size: 1.3rem;">
							210,900&nbsp;원
						</div>
					</div>
					<div class="text-right font-weight-bold text-dark" style="font-size:0.7rem;">
						<div>
							<button class="btn font-weight-bold" style="color:white;background-color: #FFCD4A;border-radius:15px;width:32px;padding:1px;font-size:0.6rem;">
								적립
							</button>
							<span class="text-secondary" style="font-size:0.7rem;">
								구매 시 2,109원(1%)
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<footer>
		<%@ include file= "../common/footer.jspf"%>
	</footer>
<script>


// 주문 상품 목록
function openList() {
	if($('.orderInfo').css('display') != 'none') {
		$('.orderInfo').css('display', 'none');		
		$('.product').css('display', 'block');		
	} else {
		$('.orderInfo').css('display', 'block');		
		$('.product').css('display', 'none');		
	}
}
$(function() {
	let today = new Date();
	var dateHtml = '';
	var dateVal = '';
	var timeVal = '';
	
	for(var i = 1; i < 6; i++) {
		var deliveryHtml = '';
		var tomorrow = new Date(today.setDate(today.getDate()+1));
		var year = tomorrow.getFullYear();
		var month = tomorrow.getMonth() + 1;
		var date = tomorrow.getDate();
		var day = tomorrow.getDay();
		
		if (day == 0 ) {
			day = '일';
		} else if (day == 1) {
			day = '월';
		} else if (day == 2) {
			day = '화';
		} else if (day == 3) {
			day = '수';
		} else if (day == 4) {
			day = '목';
		} else if (day == 5) {
			day = '금';
		} else if (day == 6) {
			day = '토';
		}
		
		dateHtml = month + '/' + date + ' (' + day + ')';
		$(".deliveryTable").find("thead").find("th:eq(" + i + ")").html(dateHtml);
		
		if (i == 1) {
			timeVal = ' 06:00:00';
			deliveryHtml += '<td style="color:#9A30AE;font-weight:bold;">~06:00까지</td>';
		} else if (i == 2) {
			timeVal = ' 10:00:00';
			deliveryHtml += '<td style="color:#9A30AE;font-weight:bold;">06:00~10:00</td>';
		} else if (i == 3) {
			timeVal = ' 13:00:00';
			deliveryHtml += '<td style="color:#9A30AE;font-weight:bold;">10:00~13:00</td>';
		} else if (i == 4) {
			timeVal = ' 17:00:00';
			deliveryHtml += '<td style="color:#9A30AE;font-weight:bold;">13:00~17:00</td>';
		} else if (i == 5) {
			timeVal = ' 21:00:00';
			deliveryHtml += '<td style="color:#9A30AE;font-weight:bold;">17:00~21:00</td>';
		}
	
		for (var t = 0; t < 5; t++) {
			
			dateVal = year + '-' + month + '-' + date;
			
			if (i == 1 && t == 0) {
				deliveryHtml += '<td><label style="padding:0;margin:0;cursor:pointer;"><input type="radio" value="' + dateVal + timeVal + '" name="deliveryPick" checked> 예약가능</label></td>';
			} else {
				deliveryHtml += '<td><label style="padding:0;margin:0;cursor:pointer;"><input type="radio" value="' + dateVal + timeVal + '" name="deliveryPick"> 예약가능</label></td>';
			}
			
			$(".deliveryTable").find("tbody").find("tr:eq(" + i + ")").html(deliveryHtml);
		}
	}
	
	
	// 배송지 변경 안내 hover
	$('.info-title').hover(function() {
		$('.info-text').css('display', 'block');
	}, function(){
		$('.info-text').css('display', 'none');
	});
	
	// 전체 선택 check box
	$('.check-all').click( function() {
		$('.check-one').prop('checked', this.checked);
		$('.check-all').prop('checked', this.checked);
	});
	
	// 결제 박스
	var currentPosition = parseInt($(".quickPayMenu").css("top"));
	$(window).scroll(function() {
		var position = $(window).scrollTop();
		var newPosition = position + currentPosition - 100 + "px";
		var endPosition = position + currentPosition - 200 + "px";
		// 일정 위치에서 멈추기
		if (Math.round( $(window).scrollTop()) + 200 > $(document).height() - $(window).height()) {
			$(".quickPayMenu").stop().animate({"top":endPosition},800);
		} else {
   			$(".quickPayMenu").stop().animate({"top":newPosition},800);
		}
	}).scroll();
});
// 결제 버튼
function kakaoPay() {
	$('.kakaoBtn').css('background-color', '#F6E500');
	$('.kakaoBtn').css('border', '1px solid #F6E500');
	
	$('.cardBtn, .easyBtn, .phoneBtn').css('background-color', 'white');
	$('.cardBtn, .easyBtn, .phoneBtn').css('color', 'black');
	$('.cardBtn, .easyBtn, .phoneBtn').css('border', '1px solid lightgray');
	
	$('.payPick').css('display', 'none');
}
function cardPay() {
	$('.cardBtn').css('background-color', '#9A30AE');
	$('.cardBtn').css('color', 'white');
	$('.cardBtn').css('border', '1px solid #9A30AE');

	$('.kakaoBtn, .easyBtn, .phoneBtn').css('background-color', 'white');
	$('.kakaoBtn, .easyBtn, .phoneBtn').css('color', 'black');
	$('.kakaoBtn, .easyBtn, .phoneBtn').css('border', '1px solid lightgray');
	
	$('.payPick').attr('style', 'display: none !important');
	$('#cardPick1').attr('style', 'display: block !important');
	$('#cardPick2').attr('style', 'display: block !important');
}
function easyPay() {
	$('.easyBtn').css('background-color', '#9A30AE');
	$('.easyBtn').css('color', 'white');
	$('.easyBtn').css('border', '1px solid #9A30AE');
	
	$('.kakaoBtn, .cardBtn, .phoneBtn').css('background-color', 'white');
	$('.kakaoBtn, .cardBtn, .phoneBtn').css('color', 'black');
	$('.kakaoBtn, .cardBtn, .phoneBtn').css('border', '1px solid lightgray');
	
	$('.payPick').attr('style', 'display: none !important');
	$('#easyPick').attr('style', 'display: block !important');
	
}
function phonePay() {
	$('.phoneBtn').css('background-color', '#9A30AE');
	$('.phoneBtn').css('color', 'white');
	$('.phoneBtn').css('border', '1px solid #9A30AE');
	
	$('.kakaoBtn, .cardBtn, .easyBtn').css('background-color', 'white');
	$('.kakaoBtn, .cardBtn, .easyBtn').css('color', 'black');
	$('.kakaoBtn, .cardBtn, .easyBtn').css('border', '1px solid lightgray');
	
	$('.payPick').attr('style', 'display: none !important');
}
function orderCompleteGo() {
	if ( $('#cb1').is(':checked') && $('#cb2').is(':checked') && $('#cb3').is(':checked') ) {
		location.href='orderComplete.do';
	} else {
		Swal.fire({
			title: '',
			text: '결제 진행 필수 동의에 체크해주세요.',
			showCancelButton: false,
			confirmButtonColor: '#9A30AE'
		});
	}
}
</script>	
</body>
</html>