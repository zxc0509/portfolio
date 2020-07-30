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
    <title>문의 게시판</title>
    <jsp:include page="/inc/Bootstrap.jsp"></jsp:include>
     
</head>

<body>
   <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->

  	<div class="container-flude" style="min-height: 630px" id="con1" >
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-1 w-100" style="padding-top: 92px">
				<a href="${contextPath}/not/notice.do" class="btn btn-dark w-100 mb-1" >공지사항</a><br>
				<a href="${contextPath}/not/faq.do" class="btn btn-dark w-100 mb-1">자주 묻는 질문</a><br>
				<a href="${contextPath}/que/question.do" class="btn btn-dark w-100 mb-1">문의 게시판</a>
				<c:choose>
	   				<c:when test="${sessionScope.id != null}">
				<a href="${contextPath }/que/myquestion.do" class="btn btn-dark w-100 mb-1">나의문의내역</a>
					</c:when>
					<c:when test="${sessionScope.id == null}">
				<a href="${contextPath }/mem/login.do" class="btn btn-dark w-100 mb-1">나의문의내역</a>
					</c:when>
				</c:choose>
			</div>
			<div class="col-sm-6" align="center">
				<br>
				<h2>문의 게시판</h2>
				<br>
				<table class="table mx-3 table-hover">
					<thead class="thead-light">
						<tr style="text-align: center">
							<th width="7%" >번호</th>	
							<th width="7%">상태</th>					
							<th width="60%">제목</th>
							<th width="15%" >문의자</th>
							<th width="15%" >등록일</th>
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
							<c:url var="url1" value="/que/questionContent.do">
							<c:param name="num" value="${article.num }"/>
							</c:url>						
							<tr  onclick="location.href='${url1}'">
								<td>${article.num }</td>
								<td><c:if test="${article.status == 0}"><font color="crimson;">대기중</font></c:if>
								<c:if test="${article.status == 1}"><font color="limegreen;">완료</font></c:if>
								</td>
			
								<c:if test='${article.re_lev == 0}'>
									<td>${article.title }</td>			
								</c:if>
				<c:choose>
					<c:when test='${article.re_lev > 0}'><td>
	         			<c:forEach begin="1" end="${article.re_lev}" step="1">
	             			<span style="padding-left:10px"></span> 
	         			</c:forEach>
	         				<span style="font-size:12px;">[답변]</span>
                   		<a class='cls1' href="${contextPath}/que/questionContent.do?num=${article.num}">${article.title}</a>
                   		</td>
	          		</c:when>	 		         
	        	</c:choose>
								<td>${article.id }</td>
								<td><fmt:formatDate value="${article.date}"/></td>
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
						         <c:url var="url1" value="/que/question.do">       
						            <c:param name="pageNum" value="${startPage-pageBlock}"/>           
						         </c:url>        
						      </c:if>        
						      <c:if test="${endPage < pageCount}">
						         <c:url var="url3" value="/que/question.do">
						            <c:param name="pageNum" value="${startPage+pageBlock}"/>
						         </c:url>
						        
						      </c:if>
						   </c:if>	
					
         							<c:forEach var="i" begin="${startPage}" end="${endPage}">
      
     							 <c:url var="url2" value="/que/question.do">
      
      						<c:param name="pageNum" value="${i}"/>
      							</c:url>
										<li class="page-item active"><a class="page-link" href="${url2}">${i}</a></li>																	
									</c:forEach>
				
								</ul>
								
							</td>
							<td colspan="2">								
									<button onclick="location.href='${contextPath}/que/questionwrite.do'" class="btn btn-dark float-right btn-sm"><i class="fas fa-pen-fancy"></i>글 쓰기</button>								
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