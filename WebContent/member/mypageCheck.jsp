<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    
  <link rel="stylesheet" href="../css/mycheck.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
</head>

<body >

<form action="${contextPath}/mem/myPage.do" method="post" style="text-align:center; 
	height:200px;
    margin: auto;
    width: 800px;
    margin-top: 350px;">
  <h3>회원 정보 수정을 위해 비밀번호를 입력해주세요</h3>
  
  <div class="input-container">
    <input class="input-field" type="password" placeholder="Password" name="passwd">
  </div>

  <button type="submit" class="btn">확인</button>

</form>

</body>
</html>