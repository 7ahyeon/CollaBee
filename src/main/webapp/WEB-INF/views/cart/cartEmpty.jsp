<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%@ include file= "../common/bootstrap.jspf"%>
<style>
	header {
		margin-bottom:100px;
	}
	footer {
		margin-top:400px;
	}
	
	/* 	장바구니 상품 목록 영역 */
	/* 전체 선택 */
	.circle{
		display: inline-block;
		width: 20px; height: 20px;
		border: 2px solid #999;
		box-sizing: border-box;
		border-radius: 10px;
		position: relative; top: 4px;
		
		background-image: url(https://blog.kakaocdn.net/dn/XTnSL/btrhtUIVtpB/5FungHN6IXVXG8bLbhE9Dk/img.png);
		background-size: 70%;
		background-repeat: no-repeat;
		background-position: center;
	}
	
	input[type="checkbox"] { position: absolute; left: -999em; }
	.btn:active, .btn:focus {
		text-decoration:none;
		outline:none !important;
		box-shadow:none !important;
	}
	.bi {
		margin: x 10px;
		font-size: 1.5rem;
		font-weight: bold;
	}
	.text-secondary {
		font-size:0.8rem;
	}
	/* 구매 불가 안내 영역 */
	.info-text {
		display: none;
		position: absolute;
		right:10px;
		top:45px;
		background-color: white;
	}
	/* 결제 박스 영역 */
	.quickPayMenu { 
		position: absolute;
		width: 280px;
		height: 400px;
		left: 30px;
	}
	
	
</style>
</head>
<body>
	<header>
		<%@ include file= "../common/header.jspf"%>
	</header>
	
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8  text-center" style="margin-bottom:20px;" >
			<h3 style="font-weight: bolder;">장바구니</h3>
		</div>
		<div class="col-sm-2">
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2">
		</div>
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
					<p class="font-weight-bold text-dark" style="margin-bottom: 15px;">
						<span style="font-size:0.95rem;">
							<span style="color:#9A30AE;">배송지를 등록</span>하고<br>구매 가능한 상품을 확인하세요!
						</span>
					</p>
					<p>
						<button id="changeAddrBtn" type="button" class="btn bg-white font-weight-bold"
							style="width:100%;border:1px solid #9A30AE;border-radius:3px;padding:10px;color:#9A30AE;font-size:0.75rem;">
							<i class="bi bi-search" style="font-size:0.8rem;"></i>&nbsp;&nbsp;주소 검색
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
		<div class="col-sm-2">
		</div>
		
	</div>
	<footer>
		<%@ include file= "../common/footer.jspf"%>
	</footer>
<script>
	$(function() {
		
		// 전체 선택 check box
		$('.check-all').click( function() {
			$('.check-one').prop('checked', this.checked);
			$('.check-all').prop('checked', this.checked);
		});
		
		var currentPosition = parseInt($(".quickPayMenu").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			var newPosition = position + currentPosition + "px";
		    $(".quickPayMenu").stop().animate({"top":newPosition},800);
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
</script>
</body>
</html> --%>