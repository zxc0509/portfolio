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
    <title>글쓰기</title>
<jsp:include page="../inc/Bootstrap.jsp"></jsp:include>
<script src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript">
		function readURL(input){
			
			console.debug(input);
			console.debug(input.files);
			
			if(input.files && input.files[0]){
				$("#tdImg").html("<img id='preview' src='#' width=200 height=200 />");
				var reader = new FileReader();
				
				//지정한 <img>태그에 첫번째 파일 input에 첨부한 파일에  대한 File객체의 내용을 읽어 들임.
				reader.readAsDataURL(input.files[0]);
				
				//파일의 모두 읽어 들였다면
				reader.onload = function(ProgressEvent){
					
					console.debug(ProgressEvent);
					
					$('#preview').attr('src',ProgressEvent.target.result);
				}
			}
		}
		
		function backToList(obj){ //아래의 <form>요소전체가 매개변수로 넘어온다.
			 
			 obj.action = "${contextPath}/board/listArticles.do";
			 obj.submit(); //<form>태그를 이용해 BoardController서블릿으로 전체글을 검색해줘~요청함.
		 }
	</script>

    
</head>

<body>	
  <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
<!-- 로긴폼 -->

 	<div class="container" style="margin-top: 10px;">
		<div class="col-sm-12">						
			<form action="${contextPath }/mypage/reviewWritePro.do" method="post" align="center" color="blue" method="post" enctype="multipart/form-data">	
																			
					<h2 align="center">리뷰 게시판 글 작성</h2>
					<br>
					<table class="table">
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>작성자</b>
							</h5></th>	
							<td><input type="text" class="form-control" readonly="readonly" name="id" id="id" value="${sessionScope.id }">
							</td>
							</tr> 							
						<tr>
						<th  width="100px" style="padding: auto;"><h5>
									<b>제목</b>								
								</h5></th>
							<td><input type="text" class="form-control" name="title" placeholder="제목을 입력하세요"></td>
						</tr>     
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>이미지</b>
							</h5></th>
							<td><input type="file" class="form-control" name="image" id="image" onchange="readURL(this);"></td>
						</tr>
						<tr>
							<th width="100px" style="padding : auto;"><h5>
								<b>미리보기</b>
							</h5></th>
							<td id="tdImg" align="left"></td>
						</tr>
						<tr>
							<th width="100px" style="padding: auto;"><h5>
									<b>내용</b>
								</h5></th>
							<td>
								<textarea class="form-control" cols="30" rows="5" name="content" id="content" placeholder="내용을 입력해주세요."></textarea>
				            </td>
						</tr>
						<tr>
							<td colspan="2" align="center">					
										<input type="submit" class="btn btn-dark" value="작성" />																														
								<a class="btn btn-danger" onclick="location.href='${contextPath}/mypage/review.do'">취소</a>
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