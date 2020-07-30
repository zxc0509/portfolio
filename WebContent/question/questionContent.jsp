<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>write</title>
    <jsp:include page="../inc/Bootstrap.jsp"></jsp:include>  
</head>

<body>

   <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
<!-- 로긴폼 -->
 	
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="id" value="${sessionScope.id }"/>
<c:url var="url2" value="/que/questionDelete.do?num=${vo.num}">
<c:param name="num" value="${num}"/>
</c:url>
<script type="text/javascript">
	function fn_del(){
		
		if(confirm("정말 삭제하시겠습니까?") == true){
			location.href="${url2}";
			console.log('success');
		}else{
			console.log("fail");
			return false;
		}
	}
</script>

<div class="container">
		<div class="col-sm-12">
			<br>
			<h2 align="center">문의 사항</h2>
			<hr>
			<div class="" style="padding:10px">
				<div class="float-left">
					<h5>${vo.title}</h5>
				</div>
				<div class="float-right">
					<small>조회수 ${vo.count}</small>
	
				</div>
			</div>
			<div class="clearfix mb-3"></div>
			<div class="col-sm-12 border mb-3 py-3" style="min-height: 500px">
				<p>${vo.content}</p>
			</div>
			<div class="float-right mb-3">
				<!-- 수정 삭제는 admin에게만 보임 -->
				<c:if test="${id == 'admin'}">
				<button onclick="location.href='${contextPath}/que/questionreply.do?num=${vo.num}&re_ref=${vo.re_ref}&re_lev=${vo.re_lev}&re_seq=${vo.re_seq}'" class="btn btn-dark">답글</button>
				</c:if>
					<c:if test="${vo.id == sessionScope.id }">
					<button onclick="location.href='${contextPath}/que/questionUpdate.do?num=${vo.num}'" class="btn btn-dark">수정하기</button>
					<button onclick="fn_del()" class="btn btn-danger">삭제</button> 
					</c:if>
				<button onclick="location.href='${contextPath}/que/question.do'" class="btn btn-default border">목록</button>
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
<!--     footer part start -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end --> 
</body>

</html>