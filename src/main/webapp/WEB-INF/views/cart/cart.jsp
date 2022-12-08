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
<%@ include file= "../common/modal/changeAdressModal.jspf"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cart.css">
<script src="${pageContext.request.contextPath }/resources/js/cart.js" type="text/javascript"></script>
<style>
header {
	margin-bottom:100px;
}
footer {
	margin-top:300px;
}
</style>
</head>
<body style="width:1900px; margin: auto; margin-top: 50px; padding: 0px;">
	<header>
		<%@ include file= "../common/header.jspf"%>
	</header>
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8  text-center" style="margin-bottom:20px;" >
			<h3 style="font-weight: bolder;">장바구니 </h3>
		</div>
		<div class="col-sm-2">
		</div>
	</div>

	<div class="row">
		<div class="col-sm-2">
		</div>
		<!-- 장바구니 상품 비존재 -->
		<c:if test="${empty cartList}">
		<div class="col-sm-6" style="white-space: nowrap;">
		
			<div style="margin:5px 10px;">
				<label>
					<input type="checkbox" name="cb1" class="check_all">
					<i class="circle"></i>
					<span class="chk-text text-secondary" style="margin: 0 10px;">
						전체 선택 (0/0)
					</span>
				</label>
				<span class="text-secondary"> | </span>
				<span id ="selectDelete" class="text-secondary" style="padding:0 0 0 10px;">
					선택 삭제
				</span>
			</div>
			<div class="font-weight-bold text-center" style="color:#999;border-top:1px solid black;padding:150px;font-size:0.95rem;">
				장바구니에 담긴 상품이 없습니다.
			</div>
			<div style="margin:5px 10px;">
				<label>
					<input type="checkbox" name="cb1" class="check_all">
					<i class="circle"></i>
					<span class="chk-text text-secondary" style="margin: 0 10px;">
						전체 선택 (0/0)
					</span>
					
				</label>
				<span class="text-secondary"> | </span>
				<span id ="selectDelete" class="text-secondary" style="padding:0 0 0 10px;">
					선택 삭제
				</span>
			</div>
		</div>
		
		<!-- 결제 메뉴 -->
		<div class="col-sm-2">
			<div class="quickPayMenu">
				
				<div style="padding:15px">
					<p class="font-weight-bold text-dark" style="margin-bottom: 10px;">
						<i class="bi bi-geo-alt" style="font-size:1.2rem;margin:0"></i>
						<span style="font-size:0.95rem;">
							배송지
						</span>
					</p>
					<p class="font-weight-bold text-dark" style="margin-bottom: 15px;">
						<span class="addressView" style="font-size:0.95rem;">
						<c:if test="${empty loginMember }">
							<span style="color:#9A30AE;">배송지를 등록</span>하고<br>구매 가능한 상품을 확인하세요!
						</c:if>
						<c:if test="${not empty loginMember }">
							${loginMember.address }&nbsp;${loginMember.addressDetail }
						</c:if>
						</span>
					</p>
					<c:if test="${not empty loginMember }">
					<p class="font-weight-bold" style="color:#9A30AE;margin-top: 0;margin-bottom: 10px;">
						<span style="font-size:0.8rem;">샛별배송</span>
					</p>
					</c:if>
					<p>
						<button id="changeAddrBtn" type="button" class="btn bg-white font-weight-bold"
							style="margin-top:10px;width:100%;border:1px solid #9A30AE;border-radius:3px;padding:10px;color:#9A30AE;font-size:0.75rem;"
							data-toggle="modal" data-target="#changeAddressModal">
							<c:if test="${not empty loginMember }">
							배송지 변경
							</c:if>
							<c:if test="${empty loginMember }">
							배송지 등록
							</c:if>
						</button>
					</p>
				</div>
				
				<div style="padding: 0 20px;">
					<div class="d-flex flex-row justify-content-between text-secondary font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							상품금액
						</div>
						<div style="margin-bottom: 10px;">
							0원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							상품할인금액
						</div>
						<div style="margin-bottom: 10px;">
							0원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							배송비
						</div>
						<div style="margin-bottom: 10px;">
							0원
						</div>
					</div>
				</div>
				
				<div class=""style="padding: 20px 20px;">
					<div class="d-flex flex-row justify-content-between text-dark font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							결제예정금액
						</div>
						<div style="margin-bottom: 10px;font-size: 1.2rem;">
							0원
						</div>
					</div>
				</div>
				<div style="margin-top:10px;">
					<button type="button" class="btn font-weight-bold disabled btn-secondary"
							style="width:100%;border-radius:3px;padding:10px;color:white;font-size:1rem;cursor:default;">
							상품을 담아주세요
					</button>
				</div>
				<div>
					<div>
						<ul class="text-secondary" style="list-style: none;padding:20px 15px 15px 15px;font-size:0.7rem;font-weight:bold;line-height: 160%;">
							<li>[주문완료]상태일 경우에만 주문 취소 가능합니다.</li>
							<li>[마이콜라비>주문내역 상세페이지]에서 직접 취소하실 수 있습니다.</li>
						</ul>
					</div>
				</div>				
			</div>
		</div>
		</c:if>
		<!-- 장바구니 상품 존재 -->
		<c:if test="${not empty cartList}">
		<div class="col-sm-6" style="white-space: nowrap;">
		
				<div style="margin:5px 10px;">
					<label>
						<input type="checkbox" value = "${cartCount }" name="cbAll" class="check_all">
						<i class="circle"></i>
						<span class="chk-text text-secondary" style="margin: 0 10px;cursor: pointer;">
							전체 선택 (<span class="selectNum">0</span>/${cartCount })
						</span>
					</label>
					<span class="text-secondary"> | </span>
					<button type="button" class="btn text-secondary selectDelete">
						선택 삭제
					</button> 
				</div>
				
				<c:if test="${not empty cartList1 }">
					<div class="accordion" id="accordionOne">
						<div class="card"  style="border:none;">
						
						    <div class="card-header bg-white" id="headingOne" style="border:none;border-top:1px solid black;text-decoration:none;margin:0;padding:0;">
					        	<p class="text-left" style="margin:0;">
					        		<span>
					        			<span style="margin-top:2px;">
											<i class="bi bi-droplet" style="color: mediumaquamarine;"></i>
					        			</span>
										<span style="font-size:1.0rem;font-weight:bold;">
											냉장 상품
										</span>
					        		</span>
							    	<button class="btn btn-link float-right" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
										<span><i class="bi bi-chevron-down" style="color:black;"></i></span>
							        </button>
								</p>
						    </div>
						
						    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionOne">
	
								<c:forEach var="cartGoods" items="${cartList1 }" varStatus="status">
								<!-- 할인가 없는 상품 -->
							    <div class="card-body" style="padding:10px;">
							    	<div class="d-flex  flex-row justify-content-between">
							    		<div class="item">
											<label>
												<c:if test="${cartGoods.saleprice == 0 }">
													<input type="checkbox" name="orderGoods" data-price="${cartGoods.price * cartGoods.count }"
														value="${cartGoods.price * cartGoods.count }" class="check_one" data-productNum="${cartGoods.productNum }" >
												</c:if>
												<c:if test="${cartGoods.saleprice != 0 }">
													<input type="checkbox" name="orderGoods" data-price="${cartGoods.price * cartGoods.count }" 
													data-saleprice="${(cartGoods.price - cartGoods.saleprice) * cartGoods.count }" value="${cartGoods.saleprice * cartGoods.count }" class="check_one" data-productNum="${cartGoods.productNum }" >
												</c:if>
												<i class="circle"></i>
												<span class="chk-text"></span>
											</label>
											<img class="productImgCart"  src="../resources/imgs/goods/${cartGoods.categoryNum }/${cartGoods.thumSysFilename }" width="80px" >
								     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
								     			<a href="${cartGoods.productNum }" class="text-dark" style="text-decoration: none !important;">
								     				<c:if test="${cartGoods.productName.length() > 39 }">
								     					${cartGoods.productName.substring(0,39) }<br>
								     					${cartGoods.productName.substring(39,cartGoods.productName.length()) }
								     				</c:if>
								     				<c:if test="${cartGoods.productName.length() <= 39 }">
								     					${cartGoods.productName }
								     				</c:if>
								     			</a>
								     			<c:if test="${cartGoods.stock <= 5 }">
								     				<p class="text-danger text-left" style="font-size:0.8rem;">
								     					재고 ${cartGoods.stock + 1 }개 미만
								     				</p>
								     			</c:if>
								     		</span>
							    		</div>
							    		<div class="item"  style="margin-top:35px;">
								     		<span class="btn-group">
									     		<button class="minusBtn button font-weight-bold" style="border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;padding: 0 8px;background-color:white;">-</button>
									     		<input type="number" name="cnt" value="${cartGoods.count }" data-productNum="${cartGoods.productNum }" data-price="${cartGoods.price }" data-saleprice="${cartGoods.saleprice }" data-stock="${cartGoods.stock }" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;cursor:default;">
									     		<button class="plusBtn button font-weight-bold" style="border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;background-color:white;">
									     			+
									     		</button>
								     		</span>
								     		<span class="text-right" style="width:200px;">
									     		<span class="price text-dark font-weight-bold">
								     				<c:if test="${cartGoods.saleprice == 0 }">
								     					<fmt:formatNumber pattern="###,###,###" value="${cartGoods.price * cartGoods.count }" /> 원
								     				</c:if>
								     				
													<!-- 할인가 있는 상품 -->
								     				<c:if test="${cartGoods.saleprice != 0 }">
								     					<fmt:formatNumber pattern="###,###,###" value="${cartGoods.saleprice * cartGoods.count }" /> 원
							     					<span class="text-secondary text-right">
										     			<del>
										     				<fmt:formatNumber pattern="###,###,###" value="${cartGoods.price * cartGoods.count }" /> 원
										     			</del>
									     			</span>
								     				</c:if>
								     			</span>
								     		</span>
								     		<span style="margin:auto;">
								     			<button class="button delBtn text-secondary" name="${cartGoods.productName }" value="${cartGoods.productNum }" style="border:none;background-color:white;">
										     		<i class="bi bi-x"></i>
								     			</button>
								     		</span>
							    		</div>
							    	</div>
						     	</div>
								</c:forEach>
						     	
					    	</div>
					    	
						</div>
					</div>
				</c:if>
				<c:if test="${not empty cartList2 }">
					<div class="accordion" id="accordionTwo">
						<div class="card"  style="border:none;">
						
						   <div class="card-header bg-white" id="headingTwo" style="border:none;border-top:1px solid black;text-decoration:none;margin:0;padding:0;">
					        	<p class="text-left" style="margin:0;">
					        		<span>
					        			<span style="margin-top:2px;">
											<i class="bi bi-snow" style="color: LightSkyBlue;"></i>
					        			</span>
										<span style="font-size:1.0rem;font-weight:bold;">
											냉동 상품
										</span>
					        		</span>
							    	<button class="btn btn-link float-right" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
										<span class="iconTwo"><i class="bi bi-chevron-down" style="color:black;"></i></span>
							        </button>
								</p>
					    	</div>
						
						    <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionTwo">
	
								<c:forEach var="cartGoods" items="${cartList2 }" varStatus="status">
	
								<!-- 할인가 없는 상품 -->
							    <div class="card-body" style="padding:10px;">
							    	<div class="d-flex  flex-row justify-content-between">
							    		<div class="item">
											<label>
												<c:if test="${cartGoods.saleprice == 0 }">
													<input type="checkbox" name="orderGoods" data-price="${cartGoods.price * cartGoods.count }" 
														value="${cartGoods.price * cartGoods.count }" class="check_one" data-productNum="${cartGoods.productNum }" >
												</c:if>
												<c:if test="${cartGoods.saleprice != 0 }">
													<input type="checkbox" name="orderGoods" data-price="${cartGoods.price * cartGoods.count }" 
													data-saleprice="${(cartGoods.price - cartGoods.saleprice) * cartGoods.count }" value="${cartGoods.saleprice * cartGoods.count }" class="check_one" data-productNum="${cartGoods.productNum }" >
												</c:if>
												<i class="circle"></i>
												<span class="chk-text"></span>
											</label>
											<img class="productImgCart"  src="../resources/imgs/goods/${cartGoods.categoryNum }/${cartGoods.thumSysFilename }" width="80px" >
								     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
								     			<a href="${cartGoods.productNum }" class="text-dark" style="text-decoration: none !important;">
								     				<c:if test="${cartGoods.productName.length() > 39 }">
								     					${cartGoods.productName.substring(0,39) }<br>
								     					${cartGoods.productName.substring(39,cartGoods.productName.length()) }
								     				</c:if>
								     				<c:if test="${cartGoods.productName.length() <= 39 }">
								     					${cartGoods.productName }
								     				</c:if>
								     			</a>
								     			<c:if test="${cartGoods.stock <= 5 }">
								     				<p class="text-danger text-left" style="font-size:0.8rem;">
								     					재고 ${cartGoods.stock + 1 }개 미만
								     				</p>
								     			</c:if>
								     		</span>
							    		</div>
							    		<div class="item"  style="margin-top:35px;">
								     		<span class="btn-group">
									     		<button class="minusBtn button font-weight-bold" style="background-color:white;border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;padding: 0 8px;">-</button>
									     		<input type="number" name="cnt" value="${cartGoods.count }" data-productNum="${cartGoods.productNum }"  data-price="${cartGoods.price }" data-saleprice="${cartGoods.saleprice }" data-stock="${cartGoods.stock }" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;cursor:default;">
									     		<button class="plusBtn button font-weight-bold" style="background-color:white;border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;">
									     			+
									     		</button>
								     		</span>
								     		<span class="text-right" style="width:200px;">
									     		<span class="price text-dark font-weight-bold">
								     				<c:if test="${cartGoods.saleprice == 0 }">
								     					<fmt:formatNumber pattern="###,###,###" value="${cartGoods.price * cartGoods.count }" /> 원
								     				</c:if>
								     				
													<!-- 할인가 있는 상품 -->
								     				<c:if test="${cartGoods.saleprice != 0 }">
								     					<fmt:formatNumber pattern="###,###,###" value="${cartGoods.saleprice * cartGoods.count }" /> 원
							     					<span class="text-secondary text-right">
										     			<del>
										     				<fmt:formatNumber pattern="###,###,###" value="${cartGoods.price * cartGoods.count }" /> 원
										     			</del>
									     			</span>
								     				</c:if>
								     			</span>
								     		</span>
								     		<span style="margin:auto;">
								     			<button class="button delBtn text-secondary" name="${cartGoods.productName }" value="${cartGoods.productNum }" style="border:none;background-color:white;">
										     		<i class="bi bi-x"></i>
								     			</button>
								     		</span>
							    		</div>
							    	</div>
						     	</div>
								</c:forEach>
						     	
					    	</div>
					    	
						</div>
					</div>
				</c:if>
				<c:if test="${not empty cartList3 }">
				<div class="accordion" id="accordionThree">
						<div class="card"  style="border:none;">
						
						    <div class="card-header bg-white" id="headingThree" style="border:none;border-top:1px solid black;text-decoration:none;margin:0;padding:0;">
					        	<p class="text-left" style="margin:0;">
					        		<span>
					        			<span style="margin-top:2px;">
											<i class="bi bi-brightness-high" style="color: orange;"></i>
					        			</span>
										<span style="font-size:1.0rem;font-weight:bold;">
											상온 상품
										</span>
					        		</span>
							    	<button class="btn btn-link float-right" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
										<span><i class="bi bi-chevron-down" style="color:black;"></i></span>
							        </button>
								</p>
						    </div>
						
						    <div id="collapseThree" class="collapse show" aria-labelledby="headingThree" data-parent="#accordionThree">

								<c:forEach var="cartGoods" items="${cartList3 }" varStatus="status">
	
								<!-- 할인가 없는 상품 -->
							    <div class="card-body" style="padding:10px;">
							    	<div class="d-flex  flex-row justify-content-between">
							    		<div class="item">
											<label>
												<c:if test="${cartGoods.saleprice == 0 }">
													<input type="checkbox" name="orderGoods" data-price="${cartGoods.price * cartGoods.count }" 
														value="${cartGoods.price * cartGoods.count }" class="check_one" data-productNum="${cartGoods.productNum }" >
												</c:if>
												<c:if test="${cartGoods.saleprice != 0 }">
													<input type="checkbox" name="orderGoods" data-price="${cartGoods.price * cartGoods.count }" 
													data-saleprice="${(cartGoods.price - cartGoods.saleprice) * cartGoods.count }" value="${cartGoods.saleprice * cartGoods.count }" class="check_one" data-productNum="${cartGoods.productNum }" >
												</c:if>
												<i class="circle"></i>
												<span class="chk-text"></span>
											</label>
											<img class="productImgCart"  src="../resources/imgs/goods/${cartGoods.categoryNum }/${cartGoods.thumSysFilename }" width="80px" >
								     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
								     			<a href="${cartGoods.productNum }" class="text-dark" style="text-decoration: none !important;">
							     					<c:if test="${cartGoods.productName.length() > 39 }">
								     					${cartGoods.productName.substring(0,39) }<br>
								     					${cartGoods.productName.substring(39,cartGoods.productName.length()) }
								     				</c:if>
								     				<c:if test="${cartGoods.productName.length() <= 39 }">
								     					${cartGoods.productName }
								     				</c:if>
								     			</a>
								     			<c:if test="${cartGoods.stock <= 5 }">
								     				<p class="text-danger text-left" style="font-size:0.8rem;">
								     					재고 ${cartGoods.stock + 1 }개 미만
								     				</p>
								     			</c:if>
								     		</span>
							    		</div>
							    		<div class="item"  style="margin-top:35px;">
								     		<span class="btn-group">
									     		<button class="minusBtn button font-weight-bold" style="background-color:white;border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;padding: 0 8px;">
									     			-
									     		</button>
									     		<input type="number" name="cnt" value="${cartGoods.count }" data-stock="${cartGoods.stock }"  data-price="${cartGoods.price }" data-saleprice="${cartGoods.saleprice }" data-productNum="${cartGoods.productNum }" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;cursor:default;">
									     		<button class="plusBtn button font-weight-bold" style="background-color:white;border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;">
									     			+
									     		</button>
								     		</span>
								     		<span class="text-right" style="width:200px;">
									     		<span class="price text-dark font-weight-bold">
								     				<c:if test="${cartGoods.saleprice == 0 }">
								     					<fmt:formatNumber pattern="###,###,###" value="${cartGoods.price * cartGoods.count }" /> 원
								     				</c:if>
								     				
													<!-- 할인가 있는 상품 -->
								     				<c:if test="${cartGoods.saleprice != 0 }">
								     					<fmt:formatNumber pattern="###,###,###" value="${cartGoods.saleprice * cartGoods.count }" /> 원
							     					<span class="text-secondary text-right">
										     			<del>
										     				<fmt:formatNumber pattern="###,###,###" value="${cartGoods.price * cartGoods.count }" /> 원
										     			</del>
									     			</span>
								     				</c:if>
								     			</span>
								     		</span>
								     		<span style="margin:auto;">
								     			<button class="button delBtn text-secondary" name="${cartGoods.productName }" value="${cartGoods.productNum }" style="border:none;background-color:white;">
										     		<i class="bi bi-x"></i>
								     			</button>
								     		</span>
							    		</div>
							    	</div>
						     	</div>
								</c:forEach>
						     	
					    	</div>
					    	
						</div>
					</div>
				</c:if>
				
				<c:if test="${not empty cartList4 }">
					<div class="accordion" id="accordionFour">
						<div class="card"  style="border:none;">
						
						    <div class="card-header bg-white" id="headingFour" style="border:none;border-top:1px solid black;text-decoration:none;margin:0;padding:0;">
					        	<div class="d-flex justify-content-between text-left" style="margin:0;">
					        		<div>
					        			<span style="margin-top:2px;">
											<i class="bi bi-x-circle" style="color:firebrick;"></i>
					        			</span>
										<span style="font-size:1.0rem;font-weight:bold;color:firebrick;">
											구매 불가 상품
										</span>
					        		</div>
				        			<div class="info-title text-right text-secondary font-weight-bold" style="font-size:0.8rem;margin-top:15px;">
				        				구매 불가 안내
				        				<i class="bi bi-question-circle" style="font-size:0.9rem;margin-left:2px;"></i>
				        			</div>
								</div>
						    </div>
							<div class="info-text text-secondary" style="font-size:0.7rem;border:1px solid #999;padding:15px 15px 0 0;border-radius:5px;">
								<ul>
									<li>품절, 판매 종료시 구매가 불가합니다.</li>
									<li>재입고시 구매 가능합니다.</li>
								</ul>
							</div>
						    <div id="collapseFour" class="collapse show" aria-labelledby="headingFour" data-parent="#accordionFour">

								<c:forEach var="cartGoods" items="${cartList4 }" varStatus="status">
	
								<div class="card-body" style="padding:10px;">
									<div class="d-flex  flex-row justify-content-between">
										<div class="item" style="margin-left:30px;">
											<img class="productImgCart"  src="../resources/imgs/goods/${cartGoods.categoryNum }/${cartGoods.thumSysFilename }"  width="80px"
											style="opacity:0.5;">
											<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
												<a href="${cartGoods.productNum }" class="text-dark" style="text-decoration: none !important;">
									 				<c:if test="${cartGoods.productName.length() > 25 }">
									 					${cartGoods.productName.substring(0,25) }<br>
									 					${cartGoods.productName.substring(25,cartGoods.productName.length()) }
									 				</c:if>
									 				<c:if test="${cartGoods.productName.length() <= 25 }">
									 					${cartGoods.productName }
									 				</c:if>
									 			</a>
											</span>
										</div>
										<div class="item  "  style="margin-top:24px;">
											<span style="margin:auto;">
												<button class="button delBtn text-secondary" name="${cartGoods.productName }" value="${cartGoods.productNum }" style="border:none;background-color:white;">
										     		<i class="bi bi-x"></i>
								     			</button>
											</span>
										</div>
									</div>
								</div>
								</c:forEach>
						     	
					    	</div>
					    	
						</div>
					</div>
				</c:if>
				
		</div>
		<!-- 결제 메뉴 -->
		<div class="col-sm-2">
			<div class="quickPayMenu">
				
				<div style="padding:15px">
					<p class="font-weight-bold text-dark" style="margin-bottom: 10px;">
						<i class="bi bi-geo-alt" style="font-size:1.2rem;margin:0"></i>
						<span style="font-size:0.95rem;">
							배송지
						</span>
					</p>
					<p class="font-weight-bold text-dark" style="margin-bottom: 3px;">
						<span class="addressView" style="font-size:0.95rem;">
						<c:if test="${empty loginMember }">
							<c:if test="${empty orderNm }">
								<span style="color:#9A30AE;">배송지를 등록</span>하고<br>구매 가능한 상품을 확인하세요!
							</c:if>						
							<c:if test="${not empty orderNm }">
								${orderNm.orderAddr }&nbsp;${orderNm.orderAddrDetail }
							</c:if>
						</c:if>
						<c:if test="${not empty loginMember }">
							${loginMember.address }&nbsp;${loginMember.addressDetail }
						</c:if>
						</span>
					</p>
					<c:if test="${not empty loginMember }">
					<p class="font-weight-bold" style="color:#9A30AE;margin-top: 0;margin-bottom: 10px;">
						<span style="font-size:0.8rem;">샛별배송</span>
					</p>
					</c:if>
					<p>
						<button id="changeAddrBtn" type="button" class="btn bg-white font-weight-bold"
							style="margin-top:10px;width:100%;border:1px solid #9A30AE;border-radius:3px;padding:10px;color:#9A30AE;font-size:0.75rem;"
							data-toggle="modal" data-target="#changeAddressModal">
							배송지 변경
						</button>
					</p>
				</div>
				
				<div style="padding: 0 20px;">
					<div class="d-flex flex-row justify-content-between text-secondary font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							상품금액
						</div>
						<div class="tot_price_temp" style="margin-bottom: 10px;">
							0 원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							상품할인금액
						</div>
						<div class="sale_price_temp" style="margin-bottom: 10px;">
							0 원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							배송비
						</div>
						<div class="delivery_fee_temp" style="margin-bottom: 10px;">
							0 원
						</div>
					</div>
				</div>
				
				<div class=""style="padding: 20px 20px;">
					<div class="d-flex flex-row justify-content-between text-dark font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							결제예정금액
						</div>
						<div class="total_price_temp" style="margin-bottom: 10px;color:#9A30AE;font-size: 1.2rem;">
							0 원
						</div>
					</div>
					<div class="text-right font-weight-bold text-dark" style="font-size:0.7rem;">
						<div>
							<button class="btn font-weight-bold" style="color:white;background-color: #FFCD4A;border-radius:15px;width:32px;padding:0.5px;font-size:0.7rem;cursor:default;">
								적립
							</button>
							<c:if test="${not empty loginMember }">
							<span class="save_emoney_temp">
								최대 0 원 적립
							</span>
							<span class="memberGrade" data-severate="${cartMember.saverate }" style="font-size:0.7rem;color:#FFCD4A;">
								 (${cartMember.gradeName } 등급 적립 ${cartMember.saverate }%)
							</span>
							</c:if>
							<c:if test="${empty loginMember }">
							<span>
								로그인 후 회원 등급에 따라 적립
							</span>
							</c:if>
						</div>
					</div>
				</div>
				<div style="margin-top:10px;">
				<c:if test="${not empty loginMember }">
					<button id="orderBtn" type="button" class="orderBtn btn font-weight-bold"
							style="width:100%;border:1px solid #9A30AE;background-color:#9A30AE;border-radius:3px;padding:10px;color:white;font-size:1rem;">
							주문하기
					</button>
				</c:if>
				<c:if test="${empty loginMember }">
					<button id="nOrderBtn" type="button" class="orderBtn btn font-weight-bold"
							style="width:100%;border:1px solid #9A30AE;background-color:#9A30AE;border-radius:3px;padding:10px;color:white;font-size:1rem;">
							주문하기
					</button>
				</c:if>
				</div>
				<div>
					<div>
						<ul class="text-secondary" style="list-style: none;padding:20px 15px 15px 15px;font-size:0.7rem;font-weight:bold;line-height: 250%;">
							<c:if test="${empty loginMember }">
							<li>로그인시 주문서에서 쿠폰/적립금을 사용할 수 있습니다.</li>
							<li>[주문완료]상태일 경우에만 주문 취소 가능합니다.</li>
							</c:if>
							<c:if test="${not empty loginMember }">
							<li>쿠폰/적립금은 주문서에서 사용 가능합니다.</li>
							<li>[주문완료]상태일 경우에만 주문 취소 가능합니다.</li>
							<li>[마이콜라비>주문내역 상세페이지]에서 직접 취소하실 수 있습니다.</li>
							<li>쿠폰, 적립금 사용 금액을 제외한 실 결제 금액 기준으로 최종 산정됩니다.</li>
							</c:if>
						</ul>
					</div>
				</div>				
			</div>
		</div>
		</c:if>
		<div class="col-sm-2">
		</div>
			
		</div>
	<footer>
		<%@ include file= "../common/footer.jspf"%>
	</footer>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>