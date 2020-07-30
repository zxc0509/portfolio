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

<meta charset="UTF-8">

<jsp:include page="../inc/adminHeader.jsp"/>

<div class="container-fluid">
  <div class="row">
<jsp:include page="../inc/adminSidebar.jsp"/>
 <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
 	<h1 class="h2">환영합니다 관리자님</h1>
        
      </div>

<body>
<c:set var="vo" value="${vo}"/>
	<h2 style="text-align: center">결제정보</h2><br><br>
	<div class="container">
	<form action="${contextPath}/adm/payTourInfo.do?num=${vo.num}" method="post" style="border:1px solid #ccc;">
	
	<table class="table table-hover text-center" style="width:50%; margin:auto;">
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
	</div>
	</body>
    <br>
	<br>

	<div style="text-align:center">
	<button type="button" onclick="history.back();">목록보기</button>
	</div>
</form>	
</div>
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>