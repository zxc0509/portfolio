<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>글수정</title>
<jsp:include page="../inc/Bootstrap.jsp"></jsp:include>
<script src="../ckeditor/ckeditor.js"></script>

    
</head>

<body>	
  <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
<!-- 로긴폼 -->
<c:url var="url1" value="/mypage/updateReviewPro.do">
<c:param name="num" value="${num}"/>
</c:url>
 	<div class="container" style="margin-top: 10px;">
		<div class="col-sm-12">						
			<form action="${url1}" align="center" color="blue" method="post" enctype="multipart/form-data">	
			
					<h2 align="center">리뷰 게시판 글 수정</h2>
					<br>
					<c:set var="vo" value="${vo}"/>
					<table class="table">
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>작성자</b>
							</h5></th>	
							<td><input type="text" class="form-control" name="id" id="id" value="${vo.id}" readonly>
							</td>
							</tr> 							
						<tr>
						<th  width="100px" style="padding: auto;"><h5>
									<b>제목</b>								
								</h5></th>
							<td><input type="text" class="form-control" name="title"  value="${vo.title}"></td>
						</tr>     
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>파일</b>
							</h5></th>
							<td><input type="file" class="form-control" name="image" id="image" value="${contextPath}/upload/${vo.num}/${vo.image}"></td>
						</tr>
						<tr>
							<th width="100px" style="padding: auto;"><h5>
									<b>내용</b>
								</h5></th>
							<td>
								<textarea class="form-control" name="content" id="content" rows="5" cols="30">${vo.content }</textarea>					    					          
				            </td>
						</tr>
						<tr>
							<td colspan="2" align="right">												
										<input type="submit" class="btn btn-dark" value="수정하기" />																																					
								<a class="btn btn-danger" onclick="location.href='${contextPath}/mypage/reviewContent.do?num=${vo.num}'">취소</a>
							</td>
						</tr>
					</table>
				</form>
		</div>
	</div>

<!--     footer part start -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end -->
	</body>
</html>