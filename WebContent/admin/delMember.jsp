<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    
<!doctype html>
<html lang="en">
<body>

	<script>
		window.alert("회원탈퇴가 완료되었습니다.");
		location.href = "${contextPath}/adm/listMembers.do";
	
	</script>
</body>
</html>