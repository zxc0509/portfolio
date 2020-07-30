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
<title>장바구니</title>
</head>
<body>
	<h2 align="center">${id}의 위시리스트</h2>
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
						<td>유형</td>
						<td>번호</td>
						<td>패키지 번호</td>
						<td>출발일</td>
						<td>종료일</td>
						<td>상품명</td>
						<td>운송수단</td>
						<td>숙박</td>
						<td>가격</td>
						<td>대표이미지</td>
						<td>삭제</td>
					</tr>
				</thead>
				<tbody>
				
		<c:if test="${articleList== null}">
			<tr height="10" >
				<td colspan="10"  align="center"><!-- 
					<p align="center"> -->
						<b><span style="font-size:9pt;">장바구니 내역이 없습니다.</span></b>
					<!-- </p> -->
				</td>
			</tr>
		</c:if>
		<c:if test="${articleList != null}">
			<c:forEach var="article" items="${articleList}">
			<input type="hidden"  name="tour_num"  value="${article['basket_num']}">
				<tr align="center"  onclick="location.href='${contextPath}/bas/tourContent.do?tour_num=${article['tour_num']}'">
					<td width="10%">패키지상품</td>
					<td width="10%">${article['basket_num']}</td>
					<td width="10%">${article['tour_num']}</td>
					<td width="10%"><fmt:formatDate value="${article['start_date']}" pattern="yyyy-MM-dd kk:mm"/></td>
					<td width="10%"><fmt:formatDate value="${article['end_date']}" pattern="yyyy-MM-dd kk:mm"/></td>
					<td width="10%">${article['tour_name']}</td>
					<td width="5%">${article['transport']}</td>			
					<td width="5%">${article['stay']}</td>
					<td width="5%">${article['price']}</td>
					<td><img alt="" src="${contextPath}/tourImage/${article['i_num']}/${article['img1']}" style="width:100px; height:100px"></td>
					<td><a href="delBasket.do?num=${article['basket_num']}"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
</svg></a></td>
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
					<c:url var="url1" value="/bas/list.do">
						<c:param name="pageNum" value="${startPage-pageBlock}"/>
					</c:url>
						<a style="font-size: xx-large;" class="page-link" href='${url1}'>Previous</a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:url var="url2" value="/bas/list.do">
				<c:param name="pageNum" value="${i}"/>
				</c:url>
						<a style="font-size: xx-large;" class="page-link" href='${url2}'>${i}</a>
				</c:forEach>
				
				<c:if test="${endPage < pageCount}">
					<c:url var="url3" value="/bas/list.do">
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