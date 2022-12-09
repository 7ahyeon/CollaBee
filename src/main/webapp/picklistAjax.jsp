<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:forEach items="${pickList }" var="item" varStatus="status">
		<div class="d-flex align-content-between pick-item-container" style="padding: 20px 0px;">
		<div class="item-col1">
		<div class="pick-item-img"><img src="${pickList.thumSysFilename}" style="width: 60px; height: 78px;"></div>
		</div>
		<div class="item-col2" style="width:600px; height: 79px; margin-left: 20px; margin-right: 100px; border: 2px soild #B03FE3;">
		<div class="pick-item-info-proname">${pickList.productName }</div>
		<div class="pick-item-info-price">${pickList.price}원</div>
		</div>
		<div class="item-col3" style="width: 104px;">
		<div class="pick-item-del"><button type="button" class="btn btn-outline-del" style="margin-bottom: 10px;" onclick="delPickList(${pickList.productNum})">삭제</button></div>
		<div class="pick-item-del"><button type="button" class="btn btn-outline-add" onclick="addCart()"><i class="bi bi-cart4"></i>담기</button></div>
		</div>
		</div>
		<div class="item-col4" style="border-bottom: 0.5px solid grey;"></div>
</c:forEach>
