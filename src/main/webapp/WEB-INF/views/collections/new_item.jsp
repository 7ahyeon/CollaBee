<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Collabee</title>
    
    <%@ include file = "../common/bootstrap.jspf" %>
<style>

    .side-bar-box li {
        padding: 0px;
    }
    .side-bar-box {
        border: white solid 1px;
        padding-right: 20px;
    }

    .side-bar-box li .form-check{
        padding: 0px 0px 10px 0px;
    }

    
    label.form-check-label2:before {
        content:"\f106";
        font: var(--fa-font-solid);
        color: lightgray;
    }
    
    input#flexCheckDefault2:checked + label.form-check-label2:before {
        content: "\f107";
    }

    label.form-check-label3:before {
        content:"\f106";
        font: var(--fa-font-solid);
        color: lightgray;
    }
    
    input#flexCheckDefault3:checked + label.form-check-label3:before {
        content: "\f107";
    }

    label.form-check-label4:before {
        content:"\f106";
        font: var(--fa-font-solid);
        color: lightgray;
    }
    
    input#flexCheckDefault4:checked + label.form-check-label4:before {
        content: "\f107";
    } 

    .side-bar-box input[type=checkbox] {
        display: none;
    }
    
    .side-bar-box input[type=radio] {
    	font-size: 30px;
    	backgound-color: #9A30AE;
    	left-margin: 100px;
    }

    .side-bar-box .form-check i {
        color: lightgray;
        margin-right: 5px;
    }

    .search-filter-top ul{
        list-style: none;
        display: flex;
    }

    .search-filter-top li:not(:first-child) {
        border-left: solid 1px lightgray;
    }
    
    .search-filter-top li {
        margin-left: 10px;
        padding-left: 10px;
    }

    .search-filter-top a {
        color: gray
    }
    
    #new-item-box {
    	display: flex;
    	flex-wrap: wrap;
    }
    #new-item-box div.item-box {
    	width: 300px;
    	height: 600px;
    	margin-left: 22px;
    }

    .item-container img {
    	width: 300px;
        height: 380px;
    }

    .item-container a {}

    .item-container .card {
        border: none;
    }

    .item-container .card .card-body {
        padding: 20px 0px;
    }
    
    .item-container .card p {
        margin-bottom: 10px;
    }
    
    
    
    
    
    
    </style>


    <script>
    
    // 필터 체크하면 아작스로 상품 조회 다시 불러오는 곳, 체크된 항목 아이콘 색 변경
        $(function(){
            $("#option-reset-btn").click(function(){
                $(".opt:checked").each(function(){
                    $(this).prop("checked", false);
                    changeOptionColor();
                });
            });

            $(".opt").change(function(){
                changeOptionColor();
                console.log("옵션 버튼 클릭됨~~");
               	getJsonGoodsList()
            });

        });

        function changeOptionColor () {
            $(".opt:checked").each(function(){
                    $(this).next().css('color', '#9A30AE');
            });

            $(".opt:not(:checked)").each(function(){
                $(this).next().css('color', 'lightgray');
            });
        }
        
        $().ready(function(){
        	getJsonGoodsList();
        });
        
        function getJsonGoodsList() {
        	
        	console.log("getJsonGoodsList 들어옴")
    		
    		$.ajax("../collections/getJsonGoodsList.do", {
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
	   					dispHtml += "<img class='card-img-top' src='resources/imgs/채소/해남호박고구마.avif' alt='Card image'>";
	   					dispHtml += "<div class='icon-cart-box-box' style='position:relative; height:0px;'>";			
	   					dispHtml += "<div type='button' data-toggle='modal' data-target='#cart-modal' class='btn btn-primary icon-cart-box' data-productname='"+goodsVO.productName+"' data-saleprice='"+goodsVO.saleprice+"' data-productnum='"+goodsVO.productNum+"'>";			
	   					dispHtml += "<i class='fa-solid fa-cart-shopping'></i>";			
	   					dispHtml += "</div></div>";			
	   					dispHtml += "<div class='card-body'>";
	   					dispHtml += "<p class='card-text --font-large' style='height:54px;'>"+goodsVO.productName+"</p>";
	   					dispHtml += "<p><span class='--color-red --font-large'>"+goodsVO.disRate+"</span><span class='--color-red --font-large'>%</span><span id='saleprice"+sequence+"' class='--font-large --strong' style='margin-left:10px;'>"+(Math.floor(goodsVO.price*(1-goodsVO.disRate*0.01)/10) *10)+"</span><span class='--font-large --strong'>원</span></p>";
	   					dispHtml += "<p class='--font-mid --color-gray --line-mid'><span>"+goodsVO.price+"</span><span>원</span></p>";
	   					dispHtml += "<p class='--font-small --color-gray --strong'>"+goodsVO.pDescription+"</p>";
	   					dispHtml += "<a href='#' class='stretched-link'></a>";
	   					dispHtml += "<input name='productNum' type='hidden' value='"+goodsVO.productNum+"'>";
	   					dispHtml += "</div>";
	   					dispHtml += "</div>";
	   					dispHtml += "</form>";
	   					
	   					sequence++;
	   					
	   					/* $("#saleprice" + sequence) */
    				} 
    				
    				$("#new-item-box").html(dispHtml);
    				$("#search-result-amount").html("총 " +data.length+"건");
    				
    			},
    			error: function(){
    				alert("실패!~~");
    				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    			}
    		}); 
    	}
        
        
        
        
        
        // 라디오 버튼 재클릭시 체크 해제되는 함수 
        
        $(function(){
	        $("input[type=radio]").each(function(){
	
	            var chk = $(this).is(":checked");
	            var name = $(this).attr('name');
	            if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
	        });
	
	        $("input[type=radio]").click(function(){
	
	            var pre = $(this).data("previous");
	            var chk = $(this).is(":checked");
	            var name = $(this).attr('name');
	
	            if(chk == true && pre == $(this).val()){
	
	                $(this).prop('checked',false);
	                $("input[name='"+name+"']").data("previous",'');
	                
	                getJsonGoodsList();
	                
	            }else{
	                if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
	            }
	
	        });
        });

    </script>

</head>
<body style="width:2000px; margin: auto; margin-top: 50px;">

	<!-- 모달 -->
	<!-- 쇼핑카트 모달 -->
    <%@ include file = "../common/modal/addShoppingCartModal.jspf" %>
    
    
    <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>

    <!-- 상단이미지 -->
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <img src="${pageContext.request.contextPath }/resources/imgs/info/new_item/new_info_1.png" style="width: 100%">
        </div>
        <div class="col-sm-2"></div>
    </div>

    <h4 class="text-center" style="margin: 50px 0px;"> 신상품 </h4>
    
    <div class="row">
    
        
        <div class="col-sm-2"></div>
        <!-- aside -->
        <div class="col-sm-2">
        <form id="options-form">
            <ul class="list-group list-group-flush  side-bar-box">
                <li class="list-group-item  d-flex justify-content-between" style="padding: 0px 0px 15px 0px;"><div>필터</div> 
                    <button id="option-reset-btn" style="border:0; background-color: white;"> 
                        <i class="fa-solid fa-arrow-rotate-right" style="margin-right:8px;"></i>초기화
                    </button>
                </li>
                    <div class="justify-content-between" style="margin:20px 0px; display:flex;">
                        <div>카테고리</div>
                        <div class="form-check">
                            <input style="display:none;" type=checkbox class="form-check-input" data-toggle="collapse" data-target="#option-show-hide1" value="" id="flexCheckDefault2">
                                <label class="form-check-label2" for="flexCheckDefault2">
                                </label>
                            </input>
                            
                        </div>
                    </div>
                <li class="list-group-item">
                    <div  id="option-show-hide1" class="collapse show">
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt1">
                                <input name="categoryType" class="form-check-input c-opt opt" type="checkbox" value="1" id="c-opt1">
                                <i class="fa-solid fa-circle-check"></i>채소
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt2">
                                <input name="categoryType" class="form-check-input c-opt opt" type="checkbox" value="2" id="c-opt2">
                                <i class="fa-solid fa-circle-check"></i>과일・견과・쌀
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt3">
                                <input name="categoryType" class="form-check-input c-opt opt" type="checkbox" value="3" id="c-opt3">
                                <i class="fa-solid fa-circle-check"></i>수산・해산물・건어물
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt4">
                                <input name="categoryType" class="form-check-input c-opt opt" type="checkbox" value="4" id="c-opt4">
                                <i class="fa-solid fa-circle-check"></i>정육・계란
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt5">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt5">
                                <i class="fa-solid fa-circle-check"></i>국・반찬・메인요리
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt6">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt6">
                                <i class="fa-solid fa-circle-check"></i>샐러드・간편식
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt7">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt7">
                                <i class="fa-solid fa-circle-check"></i>면・양념・오일
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt8">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt8">
                                <i class="fa-solid fa-circle-check"></i>생수・음료・우유・커피
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt9">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt9">
                                <i class="fa-solid fa-circle-check"></i>간식・과자・떡
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt10">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt10">
                                <i class="fa-solid fa-circle-check"></i>생활용품・리빙
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt10">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt10">
                                <i class="fa-solid fa-circle-check"></i>베이커리・치즈・델리
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt10">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt10">
                                <i class="fa-solid fa-circle-check"></i>기타
                            </label>
                        </div>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="justify-content-between" style="margin:20px 0px; display:flex; height: 32px;">
                        <div>가격</div>
                        <div class="form-check">
                            <input style="display:none;" type=checkbox class="form-check-input" data-toggle="collapse" data-target="#option-show-hide3" value="" id="flexCheckDefault3">
                                <label class="form-check-label3" for="flexCheckDefault3">
                                </label>
                            </input>
                            
                        </div>
                    </div>

                    <div id="option-show-hide3" class="collapse show">
                        <div class="form-check">
	                        <label class="form-check-label" for="p-opt1">
	                            <input name="priceRange" class="form-check-input p-opt opt" type="radio" value="~9900" id="p-opt1">
	                            9,900원 미만
	                        </label>
                        </div>
                        <div class="form-check">
	                        <label class="form-check-label" for="p-opt2">
	                            <input name="priceRange" class="form-check-input p-opt opt" type="radio" value="9900~13800" id="p-opt2">
	                            9,900원 ~ 13,800원
	                        </label>
                        </div>
                        <div class="form-check">
	                        <label class="form-check-label" for="p-opt3">
	                            <input name="priceRange" class="form-check-input p-opt opt" type="radio" value="13800~21900" id="p-opt3">
	                            13,800원 ~ 21,900원
	                        </label>
                        </div>
						<div class="form-check">
							<label class="form-check-label" for="p-opt4">
							    <input name="priceRange" class="form-check-input p-opt opt" type="radio" value="21900~" id="p-opt4">
							    21,900원 이상
							</label>
                    	</div>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="justify-content-between" style="margin:20px 0px; display:flex; height: 32px;">
                        <div>혜택</div>
                        <div class="form-check">
                            <input style="display:none;" type=checkbox class="form-check-input" data-toggle="collapse" data-target="#option-show-hide4" id="flexCheckDefault4">
                            <label class="form-check-label4" for="flexCheckDefault4">
                            </label>
                        </input>
                        
                        </div>
                    </div>
                
                <div id="option-show-hide4" class="collapse show">
                    <div class="form-check">
                        <label class="form-check-label" for="b-opt1">
                            <input name="benefitType" class="form-check-input b-opt opt" type="checkbox" value="discount" id="b-opt1">
                            <i class="fa-solid fa-circle-check"></i>할인상품
                        </label>
                    </div>
                </div>
                </li>
                <hr>

            </ul>
        </form>
        </div>
        <!-- section -->
        <div class="col-sm-6">
            <ul class="list-group list-group-flush  side-bar-box">
                <li class="list-group-item  d-flex justify-content-between search-filter-top" style="padding: 0px 0px 15px 0px;">
                    <div id="search-result-amount">총 351건</div> 
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

    


    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>
        

</body>
</html>