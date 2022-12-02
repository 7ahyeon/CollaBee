<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Collabee</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://kit.fontawesome.com/ae242928e2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css" type="text/css">
    
	<%@ include file = "../common/bootstrap.jspf" %>
	
<style>

    

    .coupon-img {
        margin-bottom: 20px;
    }

    .coupon-img img {
        width: 100%;
    }

    .event-title {
        margin: 20px 0px;
        font-size: 30px;
    }

    #coupon-inner {
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin: 20px 0px;  
    }

    #coupon-box .coupon-container {
        width: 400px;
        height: 200px;
        border: solid 1px var(--font-faint-color);
        margin-bottom: 20px;
        padding: 20px;
    }

    #coupon-box .coupon-container div {
        margin: 10px;
    }
    #coupon-box .coupon-container div:nth-child(4) {
        display: flex;
        justify-content: space-between;
    }

    #coupon-box .coupon-container button {
        border: none;
        background-color: var(--main-color);
        color: var(--font-white-color);
        width: 100px;
        height: 50px;
        border-radius: 10px;;
    }
</style>
</head>
<body style="width:2000px; margin: auto; margin-top: 50px;">

    <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>




    <!-- 쿠폰 이미지 -->

    <section>
	    <div class="row">
	        <div class="col-sm-2"></div>
	        <div class="col-sm-8">
	
	            <div id="coupon-box">
	                <div class="event-title">받을 수 있는 쿠폰 목록</div>
	                <div id="coupon-inner">
	                    <div class="coupon-container">
	                        <div class="--font-mid --strong"> 블랙프라이데이 </div>
	                        <div class="--font-small">2022.11.31까지</div>
	                        <div class="--font-large --strong">3,000원</div>
	                        <div><span class="--font-small --color-gray"><span>30000</span>원 이상 구매시 적용</span> <button>쿠폰받기</button>
	                        </div>
	                    </div>
	                    <div class="coupon-container">
	                        <div class="--font-mid --strong"> 사장님이 미쳤어요 </div>
	                        <div class="--font-small">2022.11.31까지</div>
	                        <div class="--font-large --strong">3,000원</div>
	                        <div><span class="--font-small --color-gray"><span>30000</span>원 이상 구매시 적용</span> <button>쿠폰받기</button>
	                        </div>
	                    </div>
	                    <div class="coupon-container">
	                        <div class="--font-mid --strong"> 쿠폰명 </div>
	                        <div class="--font-small">2022.11.31까지</div>
	                        <div class="--font-large --strong">3,000원</div>
	                        <div><span class="--font-small --color-gray"><span>30000</span>원 이상 구매시 적용</span> <button>쿠폰받기</button>
	                        </div>
	                    </div>
	                </div>
	                
	            </div>
	
	            <div class="event-title">진행중인 이벤트</div>
	
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/1.avif">
	            </div>
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/2.avif">
	            </div>
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/3.avif">
	            </div>
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/4.avif">
	            </div>
	            <div class="coupon-img">
	                <img src="${pageContext.request.contextPath }/resources/imgs/coupon/5.avif">
	            </div>
	            
	        </div>
	        <div class="col-sm-2"></div>
	    </div>
	</section>
    


    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>

</body>
</html>