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

    .side-bar-box input {
        display: none;
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
    
    .item-container {
        display: flex;
        justify-content: space-between;
    }

    .item-container div{
        width: 300px;
        height: 600px;
    }

    .item-container img {
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
        $(function(){
            $("#option-reset-btn").click(function(){
                $(".opt:checked").each(function(){
                    $(this).prop("checked", false);
                    changeOptionColor();
                });
            });

            $(".opt").change(function(){
                changeOptionColor();
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

    </script>

</head>
<body style="width:2000px; margin: auto; margin-top: 50px;">

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
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt1">
                                <i class="fa-solid fa-circle-check"></i>채소
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt2">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt2">
                                <i class="fa-solid fa-circle-check"></i>과일・견과・쌀
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt3">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt3">
                                <i class="fa-solid fa-circle-check"></i>수산・해산물・건어물
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="c-opt4">
                                <input class="form-check-input c-opt opt" type="checkbox" value="" id="c-opt4">
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
                                <input class="form-check-input p-opt opt" type="checkbox" value="" id="p-opt1">
                                <i class="fa-solid fa-circle-check"></i>9,900원 미만
                            </label>
                            </div>
                            <div class="form-check">
                            <label class="form-check-label" for="p-opt2">
                                <input class="form-check-input p-opt opt" type="checkbox" value="" id="p-opt2">
                                <i class="fa-solid fa-circle-check"></i>9,900원 ~ 13,800원
                            </label>
                            </div>
                            <div class="form-check">
                            <label class="form-check-label" for="p-opt3">
                                <input class="form-check-input p-opt opt" type="checkbox" value="" id="p-opt3">
                                <i class="fa-solid fa-circle-check"></i>13,800원 ~ 21,900원
                            </label>
                            </div>
                            <div class="form-check">
                            <label class="form-check-label" for="p-opt4">
                                <input class="form-check-input p-opt opt" type="checkbox" value="" id="p-opt4">
                                <i class="fa-solid fa-circle-check"></i>21,900원 이상
                            </label>
                        </div>
                    </div>
                </li>

                <li class="list-group-item">
                    <div class="justify-content-between" style="margin:20px 0px; display:flex; height: 32px;">
                        <div>혜택</div>
                        <div class="form-check">
                            <input style="display:none;" type=checkbox class="form-check-input" data-toggle="collapse" data-target="#option-show-hide4" value="" id="flexCheckDefault4">
                            <label class="form-check-label4" for="flexCheckDefault4">
                            </label>
                        </input>
                        
                        </div>
                    </div>
                
                <div id="option-show-hide4" class="collapse show">
                    <div class="form-check">
                        <label class="form-check-label" for="b-opt1">
                            <input class="form-check-input b-opt opt" type="checkbox" value="" id="b-opt1">
                            <i class="fa-solid fa-circle-check"></i>할인상품
                        </label>
                    </div>
                </div>
                </li>
                <hr>

            </ul>
        </div>
        <!-- section -->
        <div class="col-sm-6">
            <ul class="list-group list-group-flush  side-bar-box">
                <li class="list-group-item  d-flex justify-content-between search-filter-top" style="padding: 0px 0px 15px 0px;">
                    <div>총 351건</div> 
                    <div> 
                        <ul>
                            <li><a href="#">추천순</a>
                                <div class="dropdown" style="display: inline-block; margin-left:5px; height: 30px; width: 20px; border: solid red 2px;">
                                    <i class="fa-regular fa-circle-question"></i>
                                <div>
                                <div class="dropdown-menu" style="padding: 20px; width: 300px; border: solid 1px black; position: relative; z-index: 1; right: -300px; top: 50px;"> 소비자 인기도(판매량, 조회수, 상품출시일)를 종합적으로 고려한 순서입니다</div>
                            </li> 
                            <li><a href="#">판매량순</a></li>
                            <li><a href="#">낮은가격순</a></li>
                            <li><a href="#">높은가격순</a></li>

                        </ul>
                    </div>
                </li>
            </ul>

            <div class="item-container" style="width: 100%;">
                <div>
                    <div class="card" style="width:inherit;">
                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
                        <div class="card-body">
                            <p class="card-text --font-large">해남호박고구마</p>
                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
                            <a href="#" class="stretched-link"></a>
                        </div>
                    </div>

                </div>
                <div>
                    <div class="card" style="width:inherit;">
                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
                        <div class="card-body">
                            <p class="card-text --font-large">해남호박고구마</p>
                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
                            <a href="#" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card" style="width:inherit;">
                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
                        <div class="card-body">
                            <p class="card-text --font-large">해남호박고구마</p>
                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
                            <a href="#" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="item-container" style="width: 100%;">
                <div>
                    <div class="card" style="width:inherit;">
                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
                        <div class="card-body">
                            <p class="card-text --font-large">해남호박고구마</p>
                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
                            <a href="#" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card" style="width:inherit;">
                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
                        <div class="card-body">
                            <p class="card-text --font-large">해남호박고구마</p>
                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
                            <a href="#" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card" style="width:inherit;">
                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
                        <div class="card-body">
                            <p class="card-text --font-large">해남호박고구마</p>
                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
                            <a href="#" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
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