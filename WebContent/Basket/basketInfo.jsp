<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
.cls1 {
	text-decoration: none;
}

.cls2 {
	text-align: center;
	font-size: 30px;
}
a{
	text-align: center;

}


</style>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    

<jsp:include page="../inc/header.jsp"/>

<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
<c:set var="map" value="${map}"/>
	<h2 style="text-align: center">장바구니정보</h2><br><br>
	<div class="container">
	<form action="${contextPath}/bas/basketInfo.do?num=${map.num}" method="post" style="border:1px solid #ccc;">
	<table class="table table-hover text-left" style="width:50%; margin:auto;">
				<tbody>
					<tr><td>유형</td><td>패키지상품</td></tr>
					<tr><td>번호</td><td>${map['basket_num']}</td></tr>
					<tr><td>출발일</td><td><fmt:formatDate value="${map['start_date']}" pattern="yyyy-MM-dd kk:mm" /></td></tr>  
					<tr><td>종료일</td><td><fmt:formatDate value="${map['end_date']}" pattern="yyyy-MM-dd kk:mm"/></td></tr>
					<tr><td>상품명</td><td>${map['tour_name']}</td></tr>  
					<tr><td>운송수단</td><td>${map['transport']}</td></tr>
					<tr><td>숙박</td><td>${map['stay']}</td></tr>
					<tr><td>가격</td><td>${map['price']}</td></tr>
					<tr><td>대표이미지</td><td><img alt="" src="${contextPath}/tourImage/${map['i_num']}/${map['img1']}" style="width:100px; height:100px"></td></tr>
				</tbody>
	</table>
	</div>
	</body>
    <br>
	<br>
	<div style="text-align:center">
	<button type="button" onclick="history.back();">목록보기</button>
	</div>
</form>
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>