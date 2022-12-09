<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <%@ include file = "../common/bootstrap.jspf" %>

<style>

    /* 카테고리 페이지 전용*/
    #category-page #category-box {
        border: solid var(--border-faint-color) 1px;
        margin: 50px 0px;
        width: 100%;

    }

    #category-page #category-box ul{
        list-style: none;
        display: flex;
        overflow: auto;
        flex-wrap: wrap;
        padding: 20px 50px;
        margin: 0px;
    }

    #category-page #category-box ul li {
        width: 250px;
        margin: 10px 20px;
    }

    #category-page #category-box ul button {
        margin-left: 40px;
        color: var(--font-basic-color);
        text-decoration: none;
        background-color: transparent;
        border: none;
    }

    #category-page #category-box ul button:hover {
        color: var(--main-color);
    }
    
</style>


    <script>
    
        /* $(function(){
            $(".sub-category-opt").click(function(event){
                changeSubCategoryColor();
                console.log(event.target);
                event.target.style.color = 'var(--main-color)';
            });
        });

        function changeSubCategoryColor(){
            $(".sub-category-opt").each(function(){
                $(this).css('color', 'var(--font-basic-color)');
            })
        } */
        
        
        
		function getJsonGoodsListByCategory() {
	        	
        	console.log("getJsonGoodsListByCategory 들어옴")
    		console.log("넘기는 옵션" + $("#options-form").serialize())
    		$.ajax("../collections/getJsonGoodsListByCategory.do", {
    			type: "get",
    			data: $("#options-form").serialize(), 
    			dataType: "json",
    			success: function(data){
    				//alert("성공~~");
    				console.log(data);
    				
    				let dispHtml = "";
    				let sequence = 1;
    				for (let goodsVO of data) {
    					dispHtml += "<form id='item-box-form"+sequence+"'>";
	   					dispHtml += "<div class='card item-box'>";
	   					dispHtml += "<img class='card-img-top' src='../resources/imgs/goods/"+goodsVO.thumSysFilename+"' alt='Card image'>";
	   					dispHtml += "<div class='icon-cart-box-box' style='position:relative; height:0px;'>";			
	   					dispHtml += "<div type='button' data-toggle='modal' data-target='#cart-modal' class='btn btn-primary icon-cart-box' data-productname='"+goodsVO.productName+"' data-saleprice='"+goodsVO.saleprice+"' data-productnum='"+goodsVO.productNum+"'>";			
	   					dispHtml += "<i class='fa-solid fa-cart-shopping'></i>";			
	   					dispHtml += "</div></div>";			
	   					dispHtml += "<div class='card-body'>";
	   					dispHtml += "<p class='card-text --font-large' style='height:54px;'>"+goodsVO.productName+"</p>";
	   					dispHtml += "<p><span class='--color-red --font-large'>"+goodsVO.disRate+"</span><span class='--color-red --font-large'>%</span><span id='saleprice"+sequence+"' class='--font-large --strong' style='margin-left:10px;'>"+(Math.floor(goodsVO.price*(1-goodsVO.disRate*0.01)/10) *10)+"</span><span class='--font-large --strong'>원</span></p>";
	   					dispHtml += "<p class='--font-mid --color-gray --line-mid'><span>"+goodsVO.price+"</span><span>원</span></p>";
	   					dispHtml += "<p class='--font-small --color-gray --strong'>"+goodsVO.pDescription+"</p>";
	   					dispHtml += "<a href='../goods/goodsContent.do?productNum="+goodsVO.productNum+"' class='stretched-link'></a>";
	   					dispHtml += "<input name='productNum' type='hidden' value='"+goodsVO.productNum+"'>";
	   					dispHtml += "</div>";
	   					dispHtml += "</div>";
	   					dispHtml += "</form>";
	   					
	   					sequence++;
	   					
	   					/* $("#saleprice" + sequence) */
    				} 
    				
    				$("#new-item-box").html(dispHtml);
    				$("#search-result-amount").html("총 " +data.length+"건");
    				setColorNowDivision();
    				
    			},
    			error: function(){
    				alert("getJsonGoodsListByCategory실패!~~");
    				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    			}
    		}); 
    	}
	
		function addNowDivision(divisionNum) {
			$("#jsonData-divisionNum").val(divisionNum);
			getJsonGoodsListByCategory();
		}
		
		function setColorNowDivision(){
			$(".sub-category-opt").each(function(){
				if ($(this).val() == $("#jsonData-divisionNum").val()){
					$(this).css('color', 'var(--main-color)');
				} else {
					$(this).css('color', 'var(--font-basic-color)');
				}
			});
		}
		
		function resetDivision() {
			$("#jsonData-divisionNum").val(0);
			getJsonGoodsListByCategory();
		}
		
		$().ready(function(){
			console.log("rURL : ${rURL }");
		});

    </script>
    
</head>
<body>

	<!-- 모달 -->
	<!-- 쇼핑카트 모달 -->
    <%@ include file = "../common/modal/addShoppingCartModal.jspf" %>

    <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>
    

	<section id="category-page">
	
	    
	    <div class="row">
	
	        <div class="col-sm-2"></div>
	        <div class="col-sm-8">
				
	    				<h4 class="text-center" style="margin-top: 50px;"> <카테고리명> </h4>
			            <div id="category-box">
			                <ul>
			                	<li><button value="0" onclick="resetDivision()" class="sub-category-opt">전체보기</button></li>
				            	<c:forEach var="vo" items="${divisionVOList }" varStatus="status">
			                    	<li><button value="${vo.divisionNum }" onclick="addNowDivision(this.value)" class="sub-category-opt">${vo.division }</button></li>
			<%--                     	<li><a href="${pageContext.request.contextPath}/collections/categories.do?divisionNum=${vo.divisionNum }" class="sub-category-opt">${vo.division }</a></li> --%>
				                </c:forEach>
			                </ul>
			            </div>
	
	        </div>
	        <div class="col-sm-2"></div>
	    </div>
	
	
	
	
	    <div class="row">
	    
	        
	        <div class="col-sm-2"></div>
	        <!-- aside -->
	        <div class="col-sm-2">
	        	<form id="options-form">
		        	<%@ include file = "./sidebar.jspf" %>
		            <!-- categoryNum 폼에 넘기는 부분 -->
		            <input type="hidden" name="categoryNum" value="${division.categoryNum }">
		            <input id="jsonData-divisionNum" type="hidden" name="divisionNum" value="${division.divisionNum }">
		            
	        	</form>
	            
	        </div>
	        <!-- section -->
	        <div class="col-sm-6">
	            <ul class="list-group list-group-flush  side-bar-box">
	                <li class="list-group-item  d-flex justify-content-between search-filter-top" style="padding: 0px 0px 15px 0px;">
	                    <div id="search-result-amount">총 -건</div>
	                    <div> 
	                        <ul>
	                            <li><div class="form-check filter-top" style="display: inline-block;">
									<label class="form-check-label" for="o-opt1">
									    <input class="form-check-input p-opt opt" type="checkbox" value="" id="o-opt1">
								    	추천순
									</label>
		                    	</div>
                                <div class="dropdown" style="display: inline-block; margin-left:5px; height: 30px; width: 20px;">
                                    <i class="fa-regular fa-circle-question"></i>
                                	<div class="dropdown-menu" style="padding: 20px; width: 300px; border: solid 1px black; position: relative; z-index: 5; right: -300px; top: 0px;"> 소비자 인기도(판매량, 조회수, 상품출시일)를 종합적으로 고려한 순서입니다.</div>
                                </div>
                            </li> 
	                            <li><a href="#">판매량순</a></li>
	                            <li><a href="#">낮은가격순</a></li>
	                            <li><a href="#">높은가격순</a></li>
	
	                        </ul>
	                    </div>
	                </li>
	            </ul>
	            <div id="new-item-box" class="item-container" style="width: 100%;">
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