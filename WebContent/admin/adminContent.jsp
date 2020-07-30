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
	<jsp:include page="../inc/adminHeader.jsp"/>
    <!-- Header part end-->
<!-- 로긴폼 -->

<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="id" value="${sessionScope.id }"/>

<div class="container-fluid">
	<div class="row">
	<jsp:include page="../inc/adminSidebar.jsp"/> 	
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
		
		<div class="col-sm-11">
		
			<br>
			<h2 align="center">공지 사항</h2>
			<hr>
			<div>
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
					<button onclick="location.href='${contextPath}/not/noticeUpdate.do?num=${vo.num}'" class="btn btn-dark">수정하기</button>
					<button onclick="location.href='${contextPath}/adm/noticeAdmindel.do?num=${vo.num}'" class="btn btn-danger">삭제</button> 
				</c:if>
				<button onclick="location.href='${contextPath}/adm/adminNotice.do'" class="btn btn-default border">목록</button>
			</div>
			<div class="clearfix"></div>

		</div>
	</div>

<!--     footer part start -->
    
<!--     footer part end --> 
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>