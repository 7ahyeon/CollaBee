<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3><a href="adminGoods/adminGoodsList.do">상품리스트 바로가기</a></h3>
	<h3><a href="adminGoods/adminGoodsInsertPage.do">상품등록페이지 바로가기</a></h3>
	<h3><a href="adminGoods/adminGoodsSelect.do?productNum=1">상품상세조회 바로가기</a></h3>
	<h3><a href="adminGoods/adminGoodsModifyPage.do">상품수정 바로가기</a></h3>
	
	<form action="multi-file" method="post" enctype="multipart/form-data">
		<input type="file" name="multiFile" multiple><br>
		<input type="text" name="fileContent">
		<input type="submit" value="제출">
	</form>
</body>
</html>