var cookieName = "item";
var splitStr = "/";
	
	$(function() {
		
		// 선택 수량 변경
		function selectNumChange(){
			var selectNumber = $('input:checkbox[name=orderGoods]:checked').length;
			$(".selectNum").html(selectNumber);
			
			if (selectNumber == $('.check_all').val()) {
				$(".check_all").prop("checked", true);
			}
		}
		// 숫자 1000단위 표기
		function addComma(value){
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
		}
		// 결제 예정 금액 상품 금액 계산
		function totalPriceTemp() {
			
			// 총 상품 금액
			var totPrice = 0;
			var tot = 0;
			var cnt = 0;
			
			// 상품 할인 금액
			var salePrice = 0;
			var sale = 0;
			
			$('input:checkbox[name=orderGoods]:checked').each(function(){
				tot = $(this).parents(".d-flex").find(".btn-group").find("input").attr('data-price');
				sale = $(this).parents(".d-flex").find(".btn-group").find("input").attr('data-saleprice');
				cnt = $(this).parents(".d-flex").find(".btn-group").find("input").val();
				
				// 총 상품 금액
				tot = tot * cnt;
				totPrice += parseInt(tot);
				
				// 상품 할인 금액
				if (sale != 0) {
					sale = sale * cnt;
					sale = tot - sale;
					
					salePrice += parseInt(sale);
				}
			});
			// 총 상품 금액
			var totPriceTemp = String(totPrice);
			totPriceTemp = addComma(totPriceTemp);
			var totHtml = totPriceTemp + " 원";
			$(".tot_price_temp").html(totHtml);
			
			// 상품 할인 금액
			var salePriceTemp = String(salePrice);
			salePriceTemp = addComma(salePriceTemp);
			var seleHtml = "";
			if (salePrice != 0) {
				saleHtml = "-" + salePriceTemp + " 원";
			} else {
				saleHtml = salePriceTemp + " 원";
			}
			$(".sale_price_temp").html(saleHtml);
			
			// 결제 예정 금액(배송비 제외) 상품 금액 계산
			var totalPrice = 0;
			if (totPrice == 0 && salePrice == 0){
				totalPrice = 0;
			} else {
				totalPrice = totPrice - salePrice;
			}
			
			// 배송비 계산
			var deliveryFee = 0;
			if (totalPrice > 0 && totalPrice < 40000) {
				deliveryFee = 3000;
			}
			
			var deliveryFeeTemp = String(deliveryFee);
			deliveryFeeTemp = addComma(deliveryFeeTemp);
			var deliveryFeeHtml = deliveryFeeTemp + " 원";
			
			$(".delivery_fee_temp").html(deliveryFeeHtml);
			
			// 결제 예정 금액(배송비 포함) 상품 금액 계산
			var totalPriceAll = 0;
			totalPriceAll = totalPrice + deliveryFee;
			
			var totalPriceAllTemp = String(totalPriceAll);
			totalPriceAllTemp = addComma(totalPriceAllTemp);
			var totalHtml = totalPriceAllTemp + " 원";
			$(".total_price_temp").html(totalHtml);
			
			// 적립 예정 금액
			var saveEmoney = 0;
			var saveRate = $(".memberGrade").attr("data-severate");
			saveRate = parseInt(saveRate);
			saveRate = (saveRate / 100);
			
			if (totalPrice != 0) {
				saveEmoney = (totalPrice * saveRate);
				saveEmoney = Math.round(saveEmoney);
			}
			var saveEmoneyTemp = String(saveEmoney);
			saveEmoneyTemp = addComma(saveEmoneyTemp);
			var saveEmoneyHtml = " 최대 " + saveEmoneyTemp + " 원 적립";
			$(".save_emoney_temp").html(saveEmoneyHtml);
		}
		
		// 장바구니 기본 설정 : 전체 선택
		
		$(".check_all").prop("checked", true);
		$(".check_one").prop("checked", true);
		totalPriceTemp();
		selectNumChange();
		
		// 전체 선택 check box
		$(".check_all").click(function() {
			
			var chk = $(".check_all").prop("checked");
			if (chk) {
				//전체 선택
				$(".check_one").prop("checked", true);
				$(".check_all").prop("checked", true);
				
			} else {
				//전체 선택 해제
				$(".check_one").prop("checked", false);
				$(".check_all").prop("checked", false);
			}
			totalPriceTemp();
			selectNumChange();
		});
		// 개별 선택시 전체 선택 check box 해제
		$(".check_one").click(function(){
			$(".check_all").prop("checked", false);
			totalPriceTemp();
			selectNumChange();
		});
		
		// 장바구니 수량 변경 ajax
		function changegoodsCount(goodsNum, goodsCount) {
			var updateGoods = {
					productNum : goodsNum,
					count : goodsCount
			};
			$.ajax({
				type: "POST",
				url: "updateCart.do",
				data: JSON.stringify(updateGoods),
				contentType: "application/json",
				dataType: "json",
				success: function(data){
					
				},
				error: function(){
				}
			}); 
		}
		
		// 장바구니 기본 설정 : 수량
		$("input[type=number]").each(function(){
			// 수량
			var cartCount = $(this).val();
			cartCount = parseInt(cartCount);
			// 재고
			var cartStock = $(this).attr("data-stock");
			var cartNum = $(this).attr("data-productNum");
			cartStock = parseInt(cartStock);
			
			// 재고보다 수량이 많을시 장바구니 수량 자동 변경
			if (cartCount > cartStock) {
				cartCount = cartStock;
				changegoodsCount(cartNum, cartCount);
			}
			
			if (cartCount == 1) {
				//  수량 1개일 시 마이너스 버튼 비활성화
				$(this).parent("span").find(".plusBtn").attr("disabled", false);
				$(this).parent("span").find(".minusBtn").attr("disabled", true);
			} else if (cartCount == 10 || cartCount == cartStock) {
				//  수량 10개일 시 / 재고와 같을 시 플러스 버튼 비활성화
				$(this).parent("span").find(".plusBtn").attr("disabled", true);
				$(this).parent("span").find(".minusBtn").attr("disabled", false);
			} else {
				// 그외 버튼 활성화
				$(this).parent("span").find(".minusBtn").attr("disabled", false);
				$(this).parent("span").find(".plusBtn").attr("disabled", false);
			}
		});
		
		// 상품 수량 변경 : 마이너스 버튼
		$(".minusBtn").click(function(){
			// 현재 수량
			var goodsCount = $(this).parent("span").find("input").val();
			goodsCount = parseInt(goodsCount);
			// 상품 번호
			var goodsNum = $(this).parent("span").find("input").attr("data-productNum");
			goodsNum = parseInt(goodsNum);
			
			// 가격
			var goodsPrice = $(this).parent("span").find("input").attr("data-price");
			var goodsSaleprice = $(this).parent("span").find("input").attr("data-saleprice");
			goodsPrice = parseInt(goodsPrice);
			goodsSaleprice = parseInt(goodsSaleprice);
			
			var priceHtml = '';
			var totPriceGoods = 0;
			var totsalePriceGoods = 0;
			
			// 수량 변경
			if (goodsCount != 1) {
				--goodsCount;
				changegoodsCount(goodsNum, goodsCount);
				
				$(this).parent("span").find("input").val(goodsCount);
				
				
				// 수량 변경시 가격 변경
				totPriceGoods = goodsCount * goodsPrice;
				totPriceGoods = totPriceGoods.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				
				// 수량 변경시 가격 변경
				if (goodsSaleprice == 0) {
					priceHtml +=  totPriceGoods + ' 원';
					
				} else {
					totsalePriceGoods = goodsCount * goodsSaleprice;
					totsalePriceGoods = totsalePriceGoods.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					priceHtml += totsalePriceGoods + ' 원';
					priceHtml += '<span class="text-secondary text-right">';
					priceHtml += '<del>';
					priceHtml += totPriceGoods + ' 원';
					priceHtml += '</del>';
					priceHtml += '</span>';
					
				}
				$(this).parent("span").parent(".item").find(".price").html(priceHtml);
				totalPriceTemp();
			}
			if (goodsCount == 1) {
				//  수량 1개일 시 마이너스 버튼 비활성화
				$(this).parent("span").find(".minusBtn").attr("disabled", true);
				$(this).parent("span").find(".plusBtn").attr("disabled", false);
			} else {
				// 그외 버튼 활성화
				$(this).parent("span").find(".minusBtn").attr("disabled", false);
				$(this).parent("span").find(".plusBtn").attr("disabled", false);
			}
			
		});
		
		// 상품 수량 변경 : 플러스 버튼
		$(".plusBtn").click(function(){
			// 현재 수량
			var goodsCount = $(this).parent("span").find("input").val();
			goodsCount = parseInt(goodsCount);
			// 상품 번호
			var goodsNum = $(this).parent("span").find("input").attr("data-productNum");
			goodsNum = parseInt(goodsNum);
			// 재고
			var cartStock = $(this).parent("span").find("input").attr("data-stock");
			cartStock = parseInt(cartStock);
			
			// 가격
			var goodsPrice = $(this).parent("span").find("input").attr("data-price");
			var goodsSaleprice = $(this).parent("span").find("input").attr("data-saleprice");
			goodsPrice = parseInt(goodsPrice);
			goodsSaleprice = parseInt(goodsSaleprice);
			
			var priceHtml = '';
			var totPriceGoods = 0;
			var totsalePriceGoods = 0;
			
			// 수량 변경
			if (goodsCount != 10 && goodsCount != cartStock) {
				++goodsCount;
				changegoodsCount(goodsNum, goodsCount);
				$(this).parent("span").find("input").val(goodsCount);
				
				// 수량 변경시 가격 변경
				totPriceGoods = goodsCount * goodsPrice;
				totPriceGoods = totPriceGoods.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				
				// 수량 변경시 가격 변경
				if (goodsSaleprice == 0) {
					priceHtml +=  totPriceGoods + ' 원';
					
				} else {
					totsalePriceGoods = goodsCount * goodsSaleprice;
					totsalePriceGoods = totsalePriceGoods.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					priceHtml += totsalePriceGoods + ' 원';
					priceHtml += '<span class="text-secondary text-right">';
					priceHtml += '<del>';
					priceHtml += totPriceGoods + ' 원';
					priceHtml += '</del>';
					priceHtml += '</span>';
					
				}
				$(this).parent("span").parent(".item").find(".price").html(priceHtml);
				totalPriceTemp();
			}
			if (goodsCount == 10 || goodsCount == cartStock) {
				//  수량 10개일 시 / 재고와 같을 시 플러스 버튼 비활성화
				$(this).parent("span").find(".minusBtn").attr("disabled", false);
				$(this).parent("span").find(".plusBtn").attr("disabled", true);
			} else {
				// 그외 버튼 활성화
				$(this).parent("span").find(".minusBtn").attr("disabled", false);
				$(this).parent("span").find(".plusBtn").attr("disabled", false);
			}
		});
		
		
		// 선택 삭제 
		$(".selectDelete").click(function(){
			Swal.fire({
				title: '',
				text: '선택한 상품을 삭제하시겠습니까?',
				showCancelButton: true,
				confirmButtonColor: '#9A30AE',
				cancelButtonColor: '#FFCD4A',
				confirmButtonText: 'YES'
			}).then(function(result){
				if (result.isConfirmed) {
					
					select_delete();
					
					Swal.fire({
						icon: 'success',
						title: '삭제되었습니다.',
						showConfirmButton: false,
						timer: 1500
					});
				 }
			})
		});
		
		function select_delete() {
			var chkArr = new Array();
			$("input[class='check_one']:checked").each(function(){
				chkArr.push($(this).attr("data-productNum"));
			});
			
			$.ajax({
				type: "POST",
				url: "delectCart.do",
				data: { chbox : chkArr },
				success: function(result){
					if (result == 1) {
						location.reload();
					}
				},
				error: function(){
				}
			}); 
		}
		
		// 개별 삭제
		$(".delBtn").click(function(){
			var productNum = $(this).prop('value');
			var productName = $(this).prop('name');
			if (productName.length > 24) {
				var productName1 = productName.substring(0, 24);
				var productName2 = productName.substring(24,productName.length+1);
				var productN = productName1 + '<br/>' + productName2;
			} else {
				var productN = productName;
			}
				Swal.fire({
					title: '',
					html:  productN + '을(를) 삭제하시겠습니까?',
					showCancelButton: true,
					confirmButtonColor: '#9A30AE',
					cancelButtonColor: '#FFCD4A',
					confirmButtonText: 'YES'
				}).then(function(result){
					if (result.isConfirmed) {
						delete_one(productNum);
						Swal.fire({
							icon: 'success',
							title: '삭제되었습니다.',
							showConfirmButton: false,
							timer: 1500
						});
					 }
				})
		});
		
		function delete_one(productNum) {
			var chkArr = new Array();
			chkArr.push(productNum);
			$.ajax({
				type: "POST",
				url: "delectCart.do",
				data: { chbox : chkArr },
				success: function(result){
					if (result == 1) {
						location.reload();
					}
				},
				error: function(){
				}
			}); 
		}
		
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
		
		
		
		// 주문하기
		$(".orderBtn").click(function(){
			var selectNumber = $('input:checkbox[name=orderGoods]:checked').length;
			if (selectNumber == 0) {
				Swal.fire({
					icon: 'warning',
					title: '주문하실 상품을 선택해주세요.',
					showConfirmButton: false,
					timer: 1500
				});
			} else {
				// 체크 상품 넘겨주기
				var chkArr = new Array();
				$("input[class='check_one']:checked").each(function(){
					chkArr.push($(this).attr("data-productNum"));
				});
				
				$.ajax({
					type: "POST",
					url: "../order/cartToOrder.do",
					data: { chbox : chkArr },
					success: function(result){
						location.href='../order/order.do';
					},
					error: function(){
					}
				}); 
			}
		});
		
		
	});
	
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
		var addr = $('#address_kakao').val();
		var addrDetail = $('#address_detail').val();
		var sendAddr = {
				address : addr,
				addressDetail : addrDetail
			};
		$.ajax({
			type: "POST",
			url: "changeAddr.do",
			data: JSON.stringify(sendAddr),
			contentType: "application/json",
			dataType: "json",
			success: function(data){
				let addrHtml = addr + " " + addrDetail;
				$(".addressView").html(addrHtml);
			},
			error: function(){
			}
		}); 
	}
	