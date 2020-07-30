<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>상품 목록</title>
    <jsp:include page="../inc/Bootstrap.jsp"></jsp:include>
     
</head>

<body>
   <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->

  	<div class="container-flude" style="min-height: 630px" id="con1" >
		<div class="row">
			<div class="col-sm-2"></div>

			<div class="col-sm-6" align="center">
				<br>
				<h2>공지 사항</h2>
				<br>
				<table class="table mx-3 table-hover">
					<thead class="thead-light">
						<tr style="text-align: center">
							<th width="15%">상품번호</th>
							<th width="20%">상품이름</th>
							<th width="15%">출발일</th>
							<th width="15%">도착일</th>
							<th width="15%">이동수단</th>
							<th width="15%">숙박시설</th>
							<th width="15%">예약인원</th>
							<th width="15%">가격</th>
						</tr>
												
						<c:if test="${articleList == null }">																								
						<tr>
							<td colspan="5">게시판 글이 없습니다.</td>
						</tr>
						</c:if>												
					</thead>
					<c:if test="${articleList != null }">
					<tbody>
						<c:forEach var="article" items="${articleList }" >
							<tr align="center">
								<td>${article.tour_num }</td>
								<td>${article.tour_name }</td>
								<td><fmt:formatDate value="${article.start_date }"/></td>
								<td><fmt:formatDate value="${article.end_date }"/></td>
								<td>${article.transport }</td>
								<td>${article.stay }</td>
								<td>${article.reserv_member }</td>
								<td>${article.price }</td>
							</tr>
						</c:forEach>						
					</tbody>
					</c:if>	
					<tfoot>
						<tr>
							
							
							<td colspan="2">
								<ul class="pagination">								  
						      <c:if test="${count > 0}">   
						      <c:if test="${startPage > pageBlock}">     
						         <c:url var="url1" value="/to/tourProduct.do">       
						            <c:param name="pageNum" value="${startPage-pageBlock}"/>           
						         </c:url>        
						      </c:if>        
						      <c:if test="${endPage < pageCount}">
						         <c:url var="url3" value="/to/tourProduct.do">
						            <c:param name="pageNum" value="${startPage+pageBlock}"/>
						         </c:url>
						        
						      </c:if>
						   </c:if>	
					
         							<c:forEach var="i" begin="${startPage}" end="${endPage}">
      
     							 <c:url var="url2" value="/to/tourProduct.do">
      
      						<c:param name="pageNum" value="${i}"/>
      							</c:url>
										<li class="page-item active"><a class="page-link" href="${url2}">${i}</a></li>																	
									</c:forEach>
				
								</ul>
								
							</td>
							<td colspan="2">
									<button onclick="location.href='${contextPath}/to/tour.do'" class="btn btn-dark float-right btn-sm"><i class="fas fa-pen-fancy"></i>목록으로</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div> 

<!--     footer part start -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end -->
   
</body>

</html>