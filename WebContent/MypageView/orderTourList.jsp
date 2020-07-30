<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
a{
	text-align: center;

}


</style>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    

<jsp:include page="../inc/header.jsp"/>

<meta charset="UTF-8">
<title>주문목록</title>
</head>
<body>
	<h2 align="center">${id}의 주문목록</h2>
	<br>
	<br>
	<table class="table table-hover text-center" style="width: 80%; margin:auto;">
				<colgroup class="d-none d-lg-table-column-group">
					<col style="width:80px"/>
					<col />
					<col style="width:100px"/>
					<col style="width:100px"/>
					<col style="width:100px"/>
				</colgroup>
				<thead>
					<tr height="10" align="center" bgcolor="lightgray">
						<th>상품번호</th>
              			<th>상품이름</th>
          			    <th>출발시간</th>
          			    <th>도착시간</th>
         			    <th>교통수단</th>
        			    <th>숙박시설</th>
       			        <th>예약인원</th>
      			        <th>가격</th>
					</tr>
				</thead>
				<tbody>
				
		<c:if test="${articleList== null}">
			<tr height="10" >
				<td colspan="4">
					<p align="center">
						<b><span style="font-size:9pt;">결제내역이 없습니다.</span></b>
					</p>
				</td>
			</tr>	
		</c:if>
		<c:if test="${articleList != null}">
			<c:forEach var="article" items="${articleList}">
				<tr align="center" onclick="location.href='${contextPath}/my/tourOrderContent.do?num=${article.num}&pageNum=${pageNum}'">
					<td>${article.tour_num }</td>
						<td>${article.tour_name }</td>
						<td>${article.start_date }</td>
						<td>${article.end_date }</td>
						<td>${article.transport }</td>
						<td>${article.stay }</td>
						<td>${article.reserv_member }</td>
						<td>${article.price}</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	<br>
	<div class="row">
		<div class="col-12">
			<ul class="pagination justify-content-center">
			<c:if test="${count > 0}">
				<c:if test="${startPage > pageBlock}">
					<c:url var="url1" value="/my/tourOrder.do">
						<c:param name="pageNum" value="${startPage-pageBlock}"/>
					</c:url>
						<a style="font-size: xx-large;" class="page-link" href='${url1}'>Previous</a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:url var="url2" value="/my/tourOrder.do">
				<c:param name="pageNum" value="${i}"/>
				</c:url>
						<a style="font-size: xx-large;" class="page-link" href='${url2}'>${i}</a>
				</c:forEach>
				
				<c:if test="${endPage < pageCount}">
					<c:url var="url3" value="/my/tourOrder.do">
						<c:param name="pageNum" value="${startPage+pageBlock}"/>
					</c:url>
						<a style="font-size: xx-large;" class="page-link" href='${url3}'>Next</a>
				</c:if>
			</c:if>
			</ul>
		</div>
	</div>
	<br>
	<br>
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>