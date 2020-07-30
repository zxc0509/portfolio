<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/reset.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cls1 {
	text-decoration: none;
}

.cls2 {
	text-align: center;
	font-size: 30px;
}

a {
	text-align: center;
}

.seat {
	width: 40px;
	height: 30px;
}

.clicked {
	background-color: green;
	color: white;
}
</style>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    

<jsp:include page="../inc/header.jsp"/>

<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>
	<h2 style="text-align: center">결제정보</h2><br><br>
	<form style="border:1px solid #ccc">
	
	<table class="table table-hover text-center" style="width:50%; margin:auto">
				<tbody>
					<tr><td>고객 ID</td><td>${vo.reserv_id}</td></tr>
					<tr><td>고객 Email</td><td>${vo.reserv_email}</td></tr>
					<tr><td>상품번호</td><td>${vo.tour_num}</td></tr>  
					<tr><td>상품이름</td><td>${vo.tour_name}</td></tr>
					<tr><td>출발일</td><td><fmt:formatDate value="${vo.start_date}" pattern="yyyy-MM-dd kk:mm"/></td></tr>  
					<tr><td>도착일</td><td><fmt:formatDate value="${vo.end_date}" pattern="yyyy-MM-dd kk:mm"/></td></tr>  
					<tr><td>교통수단</td><td>${vo.transport}</td></tr>
					<tr><td>숙박시설</td><td>${vo.stay}</td></tr>
					<tr><td>예약인원</td><td>${vo.reserv_member}</td></tr>
					<tr><td>결제금액</td><td>${vo.price}</td></tr>
				</tbody>
	</table>
    <br>
	<br>
	
	</form>
	
	<div style="text-align:center">
	<c:url var="url" value="/my/tourOrder.do">
		<c:param name="num" value="${num}"/>
		<c:param name="pageNum" value="${pageNum}"/>
	</c:url>

	<button type="button" onclick="location.href='${url}'" class="btn btn-warning">주문목록</button>
	</div>
		
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>