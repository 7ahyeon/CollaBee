<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜라비</title>
<%@ include file= "../../common/bootstrap.jspf"%>
<%@ include file= "../../common/modal/changeAdressModal.jspf"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cart.css">
<style>
	header {
		margin-bottom:100px;
	}
	footer {
		margin-top:300px;
	}
</style>
</head>
<body>
	<header>
		<%@ include file= "../../common/header.jspf"%>
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
		
<%-- 		<!-- 비회원 장바구니 -->
		<c:if test="${empty id}">
		
		</c:if> --%>
		
		<!-- 회원 장바구니 -->
	<%-- 	<c:if test="${not empty id}"> --%>
		<!-- 장바구니 상품 비존재 -->
		<c:if test="${empty cartList}">
				<div class="col-sm-6" style="white-space: nowrap;">
		
			<div style="margin:5px 10px;">
				<label>
					<input type="checkbox" name="cb1" class="check-all">
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
					<input type="checkbox" name="cb1" class="check-all">
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
					<p class="font-weight-bold text-dark" style="margin-bottom: 3px;">
						<span style="font-size:0.95rem;">
							${cartMember.address }
						</span>
					</p>
					<p class="font-weight-bold" style="color:#9A30AE;margin-top: 0;margin-bottom: 10px;">
						<span style="font-size:0.8rem;">샛별배송</span>
					</p>
					<p>
						<button id="changeAddrBtn" type="button" class="btn bg-white font-weight-bold"
							style="width:100%;border:1px solid #9A30AE;border-radius:3px;padding:10px;color:#9A30AE;font-size:0.75rem;"
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
							style="width:100%;border-radius:3px;padding:10px;color:white;font-size:1rem;">
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
		
			<form action="#">
				<div style="margin:5px 10px;">
					<label>
						<input type="checkbox" name="cb1" class="check-all">
						<i class="circle"></i>
						<span class="chk-text text-secondary" style="margin: 0 10px;">
							전체 선택 (6/6)
						</span>
					</label>
					<span class="text-secondary"> | </span>
					<span id ="selectDelete" class="text-secondary" style="padding:0 0 0 10px;">
						선택 삭제
					</span>
				</div>
				
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

							<!-- 할인가 없는 상품 -->
						    <div class="card-body" style="padding:10px;">
						    	<div class="d-flex  flex-row justify-content-between">
						    		<div class="item">
										<label>
											<input type="checkbox" name="cb1" class="check-one">
											<i class="circle"></i>
											<span class="chk-text"></span>
										</label>
										<img class="productImgCart"  src="https://product-image.kurly.com/cdn-cgi/image/width=676,format=auto/product/image/5541028a-2e9d-4487-87dc-caa9fbc06d7f.jpg" width="80px" >
							     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
							     			<a href="#" class="text-dark" style="text-decoration: none !important;">
							     				무농약 제주 청레몬 450g (3~5입)
							     			</a>
							     		</span>
						    		</div>
						    		<div class="item"  style="margin-top:24px;">
							     		<span class="btn-group" style="margin-right:50px;">
								     		<button class="minus button text-dark font-weight-bold bg-white" style="border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;">-</button>
								     		<input type="number" name="cnt" value="1" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;">
								     		<button class="plus button text-dark font-weight-bold bg-white" style="border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;">
								     			+
								     		</button>
							     		</span>
							     		<span>
								     		<span class="text-dark font-weight-bold">
							     				&nbsp;&nbsp;&nbsp;
							     				7,900원
							     			</span>
							     		</span>
							     		<span style="margin:auto;">
							     			<button class="button delBtn text-secondary"  onclick="delete_go(this)" style="border:none;background-color:white;">
									     		<i class="bi bi-x"></i>
							     			</button>
							     		</span>
						    		</div>
						    	</div>
					     	</div>
					     	
							<!-- 할인가 있는 상품 -->
						    <div class="card-body" style="padding:10px;">
						    	<div class="d-flex  flex-row justify-content-between">
						    		<div class="item">
										<label>
											<input type="checkbox" name="cb2" class="check-one">
											<i class="circle"></i>
											<span class="chk-text"></span>
										</label>
										<img class="productImgCart"  src="https://img-cf.kurly.com/cdn-cgi/image/width=676,format=auto/shop/data/goods/160342712083l0.jpg" width="80px" >
							     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
							     			<a href="#" class="text-dark" style="text-decoration: none !important;">
							     				감홍 사과 1.3kg (4~6입)
							     			</a>
							     		</span>
						    		</div>
						    		<div class="item  "  style="margin-top:24px;">
							     		<span class="btn-group" style="margin-right:50px;">
								     		<button class="minus button text-dark font-weight-bold bg-white" style="border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;">-</button>
								     		<input type="number" name="cnt" value="1" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;">
								     		<button class="plus button text-dark font-weight-bold bg-white" style="border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;">
								     			+
								     		</button>
							     		</span>
							     		<span>
								     		<span class="text-dark font-weight-bold">
							     				&nbsp;
							     				13,600원
							     			</span>
							     			<br>
							     			<span class="text-secondary text-right">
							     				&nbsp;&nbsp;
								     			<del>
								     				16,000원
								     			</del>
							     			</span>
							     		</span>
							     		<span style="margin:auto;">
							     			<button class="button delBtn text-secondary" onclick="delete_go(this)" style="border:none;background-color:white;">
									     		<i class="bi bi-x"></i>
							     			</button>
							     		</span>
						    		</div>
						    	</div>
					     	</div>

				    	</div>
				    	
					</div>
				</div>

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

							<!-- 할인가 없는 상품 -->
						    <div class="card-body" style="padding:10px;">
						    	<div class="d-flex  flex-row justify-content-between">
						    		<div class="item">
										<label>
											<input type="checkbox" name="cb1" class="check-one">
											<i class="circle"></i>
											<span class="chk-text"></span>
										</label>
										<img class="productImgCart"  src="https://img-cf.kurly.com/cdn-cgi/image/width=676,format=auto/shop/data/goods/1648202670772l0.jpg" width="80px" >
							     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
							     			<a href="#" class="text-dark" style="text-decoration: none !important;">
							     				[밀클레버] 미니붕어빵 4종
							     			</a>
							     		</span>
						    		</div>
						    		<div class="item  "  style="margin-top:24px;">
							     		<span class="btn-group" style="margin-right:50px;">
								     		<button class="minus button text-dark font-weight-bold bg-white" style="border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;">-</button>
								     		<input type="number" name="cnt" value="1" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;">
								     		<button class="plus button text-dark font-weight-bold bg-white" style="border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;">
								     			+
								     		</button>
							     		</span>
								     		<span class="text-dark font-weight-bold">
							     				&nbsp;&nbsp;&nbsp;
							     				5,700원
							     			</span>
							     		<span style="margin:auto;">
							     			<button class="button delBtn text-secondary" onclick="delete_go(this)" style="border:none;background-color:white;">
									     		<i class="bi bi-x"></i>
							     			</button>
							     		</span>
						    		</div>
						    	</div>
					     	</div>
					     	
							<!-- 할인가 있는 상품 -->
						    <div class="card-body" style="padding:10px;">
						    	<div class="d-flex flex-row justify-content-between">
						    		<div class="item">
										<label>
											<input type="checkbox" name="cb2" class="check-one">
											<i class="circle"></i>
											<span class="chk-text"></span>
										</label>
										<img class="productImgCart"  src="https://img-cf.kurly.com/cdn-cgi/image/width=676,format=auto/shop/data/goods/1654596159551l0.jpg" width="80px" >
							     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
							     			<a href="#" class="text-dark" style="text-decoration: none !important;">
							     				[Eat's Nice] 수플레 팬케이크 4종
							     			</a>
							     		</span>
						    		</div>
						    		<div class="item  "  style="margin-top:24px;">
							     		<span class="btn-group" style="margin-right:50px;">
								     		<button class="minus button text-dark font-weight-bold bg-white" style="border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;">-</button>
								     		<input type="number" name="cnt" value="1" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;">
								     		<button class="plus button text-dark font-weight-bold bg-white" style="border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;">
								     			+
								     		</button>
							     		</span>
							     		<span>
								     		<span class="text-dark font-weight-bold">
							     				&nbsp;&nbsp;&nbsp;
							     				5,115원
							     			</span>
							     			<br>
							     			<span class="text-secondary text-right">
							     				&nbsp;&nbsp;&nbsp;&nbsp;
								     			<del>
								     				5,500원
								     			</del>
							     			</span>
							     		</span>
							     		<span style="margin:auto;">
							     			<button class="button delBtn text-secondary" onclick="delete_go(this)" style="border:none;background-color:white;">
									     		<i class="bi bi-x"></i>
							     			</button>
							     		</span>
						    		</div>
						    	</div>
					     	</div>

				    	</div>
				    	
					</div>
					
				</div>
				
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

							<!-- 할인가 없는 상품 -->
						    <div class="card-body" style="padding:10px;">
						    	<div class="d-flex  flex-row justify-content-between">
						    		<div class="item">
										<label>
											<input type="checkbox" name="cb1" class="check-one">
											<i class="circle"></i>
											<span class="chk-text"></span>
										</label>
										<img class="productImgCart"  src="https://img-cf.kurly.com/cdn-cgi/image/width=676,format=auto/shop/data/goods/1653067210853l0.jpeg" width="80px" >
							     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
							     			<a href="#" class="text-dark" style="text-decoration: none !important;">
							     				[네오플램] NEW FIKA 쿡웨어 팬
							     			</a>
							     		</span>
						    		</div>
						    		<div class="item  "  style="margin-top:24px;">
							     		<span class="btn-group" style="margin-right:50px;">
								     		<button class="minus button text-dark font-weight-bold bg-white" style="border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;">-</button>
								     		<input type="number" name="cnt" value="1" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;">
								     		<button class="plus button text-dark font-weight-bold bg-white" style="border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;">
								     			+
								     		</button>
							     		</span>
							     		<span>
								     		<span class="text-dark font-weight-bold">
							     				&nbsp;
							     				29,900원
							     			</span>
							     		</span>
							     		<span style="margin:auto;">
							     			<button class="button delBtn text-secondary"  onclick="delete_go(this)" style="border:none;background-color:white;">
									     		<i class="bi bi-x"></i>
							     			</button>
							     		</span>
						    		</div>
						    	</div>
					     	</div>
					     	
							<!-- 할인가 있는 상품 -->
						    <div class="card-body" style="padding:10px;">
						    	<div class="d-flex  flex-row justify-content-between">
						    		<div class="item">
										<label>
											<input type="checkbox" name="cb2" class="check-one">
											<i class="circle"></i>
											<span class="chk-text"></span>
										</label>
										<img class="productImgCart"  src="https://product-image.kurly.com/cdn-cgi/image/width=676,format=auto/product/image/dd588ab0-d450-4805-85c3-5e5b463a3a18.jpg" width="80px" >
							     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
							     			<a href="#" class="text-dark" style="text-decoration: none !important;">
							     				[로얄코펜하겐] 베라왕 다이아몬드 모자이크 
							     				<br>
							     				고블렛 와인클라스 2P 세트
							     			</a>
							     		</span>
						    		</div>
						    		<div class="item  "  style="margin-top:24px;">
							     		<span class="btn-group" style="margin-right:50px;">
								     		<button class="minus button text-dark font-weight-bold bg-white" style="border-radius:0 2px 2px 0;border: 1px solid lightgray;font-size:0.9rem;">-</button>
								     		<input type="number" name="cnt" value="1" readonly="readonly" style="text-align:center;width:45px;height:26px;padding:0 0 0 11px;border:1px solid lightgray;border-left:none;border-right:none;">
								     		<button class="plus button text-dark font-weight-bold bg-white" style="border-radius:2px 0 0 2px;border: 1px solid lightgray;font-size:0.9rem;">
								     			+
								     		</button>
							     		</span>
							     		<span>
								     		<span class="text-dark font-weight-bold">
							     				154,000원
							     			</span>
							     			<br>
							     			<span class="text-secondary text-right">
								     			<del>
								     				220,000원
								     			</del>
							     			</span>
							     		</span>
							     		<span style="margin:auto;">
							     			<button class="button delBtn text-secondary"  onclick="delete_go(this)" style="border:none;background-color:white;">
									     		<i class="bi bi-x"></i>
							     			</button>
							     		</span>
						    		</div>
						    	</div>
					     	</div>

				    	</div>
				    	
					</div>
					
				</div>
				
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

						    <div class="card-body" style="padding:10px;">
						    	<div class="d-flex  flex-row justify-content-between">
						    		<div class="item" style="margin-left:30px;">
										<img class="productImgCart"  src="https://product-image.kurly.com/cdn-cgi/image/width=676,format=auto/product/image/576e2760-04e0-4fdf-818b-d3022157a0be.jpg" width="80px"
											style="opacity:0.5;">
							     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
							     			<a href="#" class="text-secondary" style="text-decoration: none !important;font-size:0.95rem;">
							     				로스티드 솔티드 마카다미아 270g
							     			</a>
							     		</span>
						    		</div>
						    		<div class="item  "  style="margin-top:24px;">
							     		<span style="margin:auto;">
							     			<button class="button delBtn text-secondary" onclick="delete_go(this)" style="border:none;background-color:white;">
									     		<i class="bi bi-x"></i>
							     			</button>
							     		</span>
						    		</div>
						    	</div>
					     	</div>
					     	
						    <div class="card-body" style="padding:10px;">
						    	<div class="d-flex  flex-row justify-content-between">
						    		<div class="item" style="margin-left:30px;">
										<img class="productImgCart"  src="https://product-image.kurly.com/cdn-cgi/image/width=676,format=auto/product/image/a7532913-ed4a-488b-b26d-521ddbe588d0.jpg" width="80px" 
											style="opacity:0.5;">
							     		<span class="text-dark font-weight-bold" style="margin:0 10px;font-size:0.95rem;">
							     			<a href="#" class="text-secondary" style="text-decoration: none !important;font-size:0.95rem;">
							     				[바카라] 밀누이 글라스
							     			</a>
							     		</span>
						    		</div>
						    		<div class="item  "  style="margin-top:24px;">
							     		<span style="margin:auto;"> 
							     			<button class="button delBtn text-secondary" onclick="delete_go(this)" style="border:none;background-color:white;">
									     		<i class="bi bi-x"></i>
							     			</button>
							     		</span>
						    		</div>
						    	</div>
					     	</div>

				    	</div>
				    	
					</div>
					
				</div>
				
				
				
				<div style="margin:5px 10px;">
					<label>
						<input type="checkbox" name="cb1" class="check-all">
						<i class="circle"></i>
						<span class="chk-text text-secondary" style="margin: 0 10px;">
							전체 선택 (6/6)
						</span>
					</label>
					<span class="text-secondary"> | </span>
					<span id ="selectDelete" class="text-secondary" style="padding:0 0 0 10px;">
						선택 삭제
					</span>
				</div>
				
			</form>
			
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
						<span style="font-size:0.95rem;">
							제주특별자치도 제주시 특별자치도, 해안동 1100로 220-13
						</span>
					</p>
					<p class="font-weight-bold" style="color:#9A30AE;margin-top: 0;margin-bottom: 10px;">
						<span style="font-size:0.8rem;">샛별배송</span>
					</p>
					<p>
						<button id="changeAddrBtn" type="button" class="btn bg-white font-weight-bold"
							style="width:100%;border:1px solid #9A30AE;border-radius:3px;padding:10px;color:#9A30AE;font-size:0.75rem;"
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
						<div style="margin-bottom: 10px;">
							285,000원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							상품할인금액
						</div>
						<div style="margin-bottom: 10px;">
							-68,785&nbsp;원
						</div>
					</div>
					<div class="d-flex flex-row justify-content-between text-secondary font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							배송비
						</div>
						<div style="margin-bottom: 10px;">
							3000&nbsp;원
						</div>
					</div>
				</div>
				
				<div class=""style="padding: 20px 20px;">
					<div class="d-flex flex-row justify-content-between text-dark font-weight-bold" style="font-size:1rem;">
						<div style="margin-bottom: 10px;">
							결제예정금액
						</div>
						<div style="margin-bottom: 10px;color:#9A30AE;font-size: 1.2rem;">
							219,215&nbsp;원
						</div>
					</div>
					<div class="text-right font-weight-bold text-dark" style="font-size:0.7rem;">
						<div>
							<button class="btn font-weight-bold" style="color:white;background-color: #FFCD4A;border-radius:15px;width:32px;padding:0.5px;font-size:0.6rem;">
								적립
							</button>
							<span>
								최대 2,192원 적립<br>
							</span>
							<span class="text-secondary" style="font-size:0.7rem;">
								콜 등급 적립 1%
							</span>
						</div>
					</div>
				</div>
				<div style="margin-top:10px;">
					<button id="orderBtn" type="button" onclick="location.href='order.jsp'" class="btn font-weight-bold"
							style="width:100%;border:1px solid #9A30AE;background-color:#9A30AE;border-radius:3px;padding:10px;color:white;font-size:1rem;">
							주문하기
					</button>
				</div>
				<div>
					<div>
						<ul class="text-secondary" style="list-style: none;padding:20px 15px 15px 15px;font-size:0.7rem;font-weight:bold;line-height: 160%;">
							<li>쿠폰/적립금은 주문서에서 사용 가능합니다.</li>
							<li>[주문완료]상태일 경우에만 주문 취소 가능합니다.</li>
							<li>[마이콜라비>주문내역 상세페이지]에서 직접 취소하실 수 있습니다.</li>
							<li>쿠폰, 적립금 사용 금액을 제외한 실 결제 금액 기준으로 최종 산정됩니다.</li>
						</ul>
					</div>
				</div>				
			</div>
		</div>
		</c:if>
<%-- 		</c:if> --%>
		<div class="col-sm-2">
		</div>
			
		</div>
	<footer>
		<%@ include file= "../../common/footer.jspf"%>
	</footer>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	$(function() {
		
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
			// 일정 위치에서 멈추기
			if (Math.round( $(window).scrollTop()) + 200 > $(document).height() - $(window).height()) {
				$(".quickPayMenu").stop().animate({"top":"50px"},800);
			} else {
	   			$(".quickPayMenu").stop().animate({"top":newPosition},800);
			}
		}).scroll();
		
		// 구매 불가 안내 hover
		$('.info-title').hover(function() {
			$('.info-text').css('display', 'block');
		}, function(){
			$('.info-text').css('display', 'none');
		});
		
	});
	
	function delete_go() {
		Swal.fire({
			title: '삭제하시겠습니까?',
			text: '',
			showCancelButton: true,
			confirmButtonColor: '#9A30AE',
			cancelButtonColor: '#FFCD4A',
			confirmButtonText: 'YES'
		}).then((result) => {
			if (result.isConfirmed) {
				Swal.fire({
					icon: 'success',
					title: '삭제되었습니다.',
					showConfirmButton: false,
					timer: 1500
				})
			 }
		})
	}
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = '';
	                
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우(R)
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
				$('#address_kakao').val(addr); // 주소 넣기
				$('#address_detail').focus(); //상세입력 포커싱
				console.log($('#address_kakao').value);
			}
		}).open();
	}
	function changeAddr() {
		alert($('#address_kakao').val());
		$.ajax("/cart/changeAddr.do", {
			type: "post",
			data: {
				address : $('#address_kakao').val(),
				addressDetail : $('#address_detail').val()
			},
			dataType: "json",
			success: function(data){
				alert("성공");
				console.log(data);
			},
			error: function(){
				alert("실패");
			}
		}); 
	}
</script>
</body>
</html>