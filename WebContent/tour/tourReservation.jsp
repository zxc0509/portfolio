<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/reset.css">
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
	<c:if test="${list != null }">

	<h2 style="text-align: center">예약정보</h2><br><br>
	<table class="table table-hover text-center" style="width:50%; margin:auto">
		
				
				<tbody>
					<tr><td colspan="2"><img alt="" src="${contextPath}/tourImage/${num}/${list['img1']}"> </td></tr>
					<tr><td>고객 ID</td><td>${mvo.id}</td></tr>
					<tr><td>고객 Email</td><td>${mvo.email}</td></tr>
					<tr><td>상품번호</td><td>${list["tour_num"]}</td></tr>  
					<tr><td>상품이름</td><td>${list["tour_name"]}</td></tr>
					<tr><td>출발시각</td><td><fmt:formatDate value="${list['start_date']}" pattern="yyyy-MM-dd kk:mm"/></td></tr>  
					<tr><td>도착시각</td><td><fmt:formatDate value="${list['end_date']}" pattern="yyyy-MM-dd kk:mm"/></td></tr>
					<tr><td>교통수단</td><td>${list["transport"]}</td></tr>
					<tr><td>숙박시설</td><td>${list["stay"]}</td></tr>
					<tr><td>요금</td><td>${list["price"]}</td></tr>
					
				</tbody>
	</table>

    <br>
<form action="${contextPath}/tre/tourReserv1.do?num=${num}&tour_num=${list['tour_num']}" method="post" style="border:1px solid #ccc">
<br>

<div class="seat-wrapper" style="text-align: center"> 
    <span>인원수 선택 : </span>
    <select id="person" name="person">
        <option value="1">1명</option>
        <option value="2">2명</option>
        <option value="3">3명</option>
        <option value="4">4명</option>
        <option value="5">5명</option>
        <option value="6">6명</option>
        <option value="7">7명</option>
        
    </select>
    <br>
    <br>
    </div>

    <br>
    
	<input type="hidden" name="id" value="${mvo.id}">
	<input type="hidden" name="email" value="${mvo.email}">
	<div style="text-align:center">
	<button type="submit" class="btn btn-warning">결제진행</button>
	</div>
 	
</form>

	</c:if>
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>