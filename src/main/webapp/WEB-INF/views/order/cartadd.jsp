<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file= "../common/bootstrap.jspf"%>
</head>
<body>

<button type="button" class="btn insertBtn">장바구니 담기</button>
<script>
	$(function() {
		$(".insertBtn").click(
			// 장바구니 담기
			function insertCart() {
				
				// 상품 번호
				var goodsNum = 10;
				// 상품 개수
				var goodsCount = 2;
				
				var sendCart = {
						productNum : goodsNum,
						count : goodsCount
				};
				
				// 장바구니 상품 존재 여부 확인 후 추가
				$.ajax({
					type: "POST",
					url: "../cart/cartAdd.do",
					data: JSON.stringify(sendCart),
					contentType: "application/json",
					dataType: "json",
					success: function(result){
						alert("성공");
						if (result == 1) {
							alert("장바구니 추가 성공 알림 보내기");
						} else if (result == 2) {
							alert("이미 장바구니에 있는 상품 수량 추가 알림 보내기");
						} else if (result == 3) {
							alert("이미 최대 수량입니다");
						} else if (result == 0) {
							alert("오류");
						}
					},
					error: function(){
						alert("실패");
					}
				}); 
				
			}
		)
	});
</script>
</body>
</html>