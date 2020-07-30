<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>write</title>
    <jsp:include page="../inc/Bootstrap.jsp"></jsp:include>  
    
    <c:url var="url2" value="/mypage/deleteReview.do">
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>



<script type="text/javascript">
    	//웹브라우저가 json1.jsp의 HTML코드를 모두 로딩 했을떄... function(){}함수가 실행되게 선언
    	$(function(){
    		
    			// id속성값이 checkJson인 <a>영역을 선택해서 가져와서 
    			// 클릭하는 행위(이벤트)를 등록함.
    			// -> 사용자가 <a>요소를 클릭하는 순간? function(){}<---이벤트처리기 함수가 자동으로 수행됨
    			$("#reviewComment").click(function(){ //★ id있는곳은 댓글등록 버튼 id로 주어야함.★
    				var id = $("#c_id").val(); 
    				var content = $("#c_content").val();   // 댓글폼이 id가 commentForm이어야 함.
    				var bnum = $('#bnum').val();
    				
					var _comment = '{"id":"'+id+'","content":"'+ content +'","bnum":"'+ bnum +'"}';
					console.log(id);
					console.log(content);
					console.log(bnum);
    			 	$.ajax({
    							type : "post",
    							async : true, //false  동기방식
    							url : "${contextPath}/comment/comment.do",
    							data:{
									comment : _comment
    							},
  							 	 success : function(data,textStatus){
     								
    								//서버페이지인? 서블릿에서 응답한 data매개변수 값은 
    								//JSONObject객체 형태의 문자열이다.
    								
    								//참고 : JSONObject객체형태의 문자열을 파싱해서 
    								//      JSONObject객체로 변환한다.
    								var comment = JSON.parse(data);
    								
    								var commentInfo = "";
    								
    								commentInfo += '<tr id="reply' + comment.cnum + '"><td>' + comment.c_id + '</td>';
    								commentInfo += '<td>' + comment.c_content + '</td>';
    								commentInfo += "<td>"+comment.now +'&nbsp&nbsp&nbsp';
    								commentInfo += '<button type="button" onclick="deleteComment('+comment.cnum+','+bnum+')">삭제</button></td></tr>';
        							
    								
    								
    								$(".table1").append(commentInfo);
    								$("#c_content").val("");
    								
    								if($("#replyEmpty")){
    									$("#replyEmpty").remove();
    								} 
    							},
    							error : function(){
    								alert("통신에러가 발생했습니다.");
    							}  
    				 	   }); 
    			});
    	}); 
    	
    	function deleteComment(cnum, bnum){
    			var id = $("#c_id").val();
				
				var _deleteComment = '{"id":"'+id+'","cnum":"'+ cnum +'","bnum":"'+ bnum +'"}';
								
			 	$.ajax({
							type : "post",
							async : true, //false  동기방식
							url : "${contextPath}/comment/deleteComment.do",//comment/ 일땐 널값 안뜸.
							data:{
								deleteComment : _deleteComment
							},
							 	 success : function(data,textStatus){
									console.log(data);
									if(data == "success"){
										var del = "<td></td><td>댓글이 삭제되었습니다.</td>";
										$("#reply"+ cnum).html(del).fadeOut(1000, function(){
											$(this).remove();
																			
										
											if($(".table1").find("tr").length == 0){
												
												var emptydel = "";
												
												emptydel += '<div id="replyEmpty">';
												emptydel += ' 	<p>등록된 댓글이 없습니다.</p>';
												emptydel += '</div>';
												
												$(".table1").append(emptydel);
											}
										});
									} else {
										alert("댓글이 정상적으로 삭제되지 않았습니다.");
									}
			 					},
								
								error : function(){
									alert("통신에러가 발생했습니다.");
								}  
					}); 
    		}
    	
    	
	
    </script>
 <style type="text/css">
 
  .table1 {width: 1140px !important; 
     margin: auto;}
 
  .table1 td {text-align:left !important; }
  
  .table th {
          /*  border:1px solid red; */
         width: 100px !important; 
         padding: 5px 0 !important; 
         font-size: 1.2em;
         text-align: center !important;
         vertical-align: middle !important;
  }
  
   .table td textarea {width: 100%; }
  
  
  
  .table1 tr td:nth-of-type(1) {width: 100px;}
  .table1 tr td:nth-of-type(2) {width:auto;}
  .table1 tr td:nth-of-type(3) {width: 150px;}
  
  
  
  
  
  .table b{margin:auto;}
 
 </style>   
    
</head>

<body>

   <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
<!-- 로긴폼 -->
 	
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="vo" value="${vo}"/>
	<div class="container">
		<form action="${contextPath}/mypage/reviewContent.do" 
			method="post" enctype="multipart/form-data">
			<div>
				<br>
				<h2 align="center">리뷰 게시판</h2>
				<hr>
				<table class="table">
					<tr>
						<th>
								<b>이름</b></th>
						<td><input type="text" class="form-control" id="id" name="id"
							value="${vo.id }" readonly>
						</td>
					</tr>
					<tr>
						<th>
								<b>제목</b>
							</th>
						<td><input type="text" class="form-control" name="title"
							value="${vo.title}" readonly></td>
					</tr>
					<tr>
						<th>
								<b>이미지</b></th>
						<td><img align="left"
							src="${contextPath}/upload/${vo.num}/${vo.image}"
							style="width: 300px; height: 200px;"></td>
					</tr>
					<tr>
						<th>
								<b>내용</b></th>
						<td><textarea rows="10" readonly>${vo.content }</textarea></td>
					</tr>

				</table>
			</div>
		</form>
	</div>

	<br><br>
	<div style="text-align:center; font-size:20px"><b>댓글</b></div>
	<br>
	<div class="table table-sm" style="text-align:center;">
	
	<table class="table1" style="border: 1px solid white;">
	<c:if test="${commentList.size() == 0}">
	
		<div id="replyEmpty">
				<p>등록된 댓글이 없습니다.</p>
		</div>
		<br><br>
	</c:if>
	
	<c:if test="${commentList.size() > 0}">
	
	
	<c:forEach var="comment" items="${commentList}">
	
    			<tr id="reply${comment.cnum}">
    			
    				<td>${comment.c_id}</td>
      			   	<td>${comment.c_content}</td>
      			   	<input type="hidden" id="cnum" name="cnum" value="${comment.cnum }">
      				<fmt:formatDate value="${comment.c_date}" var="ard" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${ts}" var="now" pattern="yyyy-MM-dd"/>				
					<c:if test="${ard == now}">
					<td><fmt:formatDate value="${comment.c_date}" pattern="HH:mm"/>
					</c:if>
					<c:if test="${ard != now}"> 
					<td><fmt:formatDate value="${comment.c_date}" pattern="yyyy-MM-dd"/>
					</c:if>&nbsp;
					<c:if test="${sessionScope.id == comment.c_id}">
					<button type="button" onclick="deleteComment('${comment.cnum}', '${comment.bnum}')">삭제</button>
					</c:if>	</td>
									
				</tr>
		</c:forEach>	

	</c:if>
	</table>
	</div>
	
	
	<c:if test="${id != null }">
	<div class="container">
	<div class="row">
	<form action="${contextPath}/comment/comment.do" name ="commentForm" method="post">
	<table class="table table-hover" id="tx" style="text-align:center; width:50%; margin:auto; border: 1px solid white;">
		<tbody>	
			<tr>
			<td  colspan="2"><input type="type" id="c_id" name="c_id" value="${sessionScope.id}" readonly>
			<input type="hidden" id="bnum" name="bnum" value="${vo.num}">
			<textarea name="c_content" id="c_content" align="center" rows="5" cols="130" placeholder="댓글을 입력해주세요."></textarea>
			<input type="button" class = "button alt" id="reviewComment"  style="cursor: pointer; float:right" value="댓글등록" > <br></td>
			</tr>	
					
		</tbody>
	</table>	
	</form>
	</div>
	</div>	
	</c:if>
			
			
			<div class="float-mid mb-3" style="text-align:center">
				<!-- 수정 삭제는 admin에게만 보임 -->
				<c:if test="${!id.equals('admin')}">
				<c:if test="${id == vo.id}">
				<c:url var="url1" value="/mypage/updateReview.do">
					<c:param name="num" value="${num}" />
				</c:url>
				<button onclick="location.href='${url1}'" class="btn btn-dark">수정하기</button>
				<button onclick="fn_del()" class="btn btn-danger">삭제</button> 
				</c:if>
				</c:if>
				
				<c:if test="${id.equals('admin')}">
				<c:url var="url1" value="/mypage/updateReview.do">
					<c:param name="num" value="${num}" />
				</c:url>
				<button onclick="location.href='${url1}'" class="btn btn-dark">수정하기</button>
				<button onclick="fn_del()" class="btn btn-danger">삭제</button> 
				</c:if>
				<button onclick="location.href='${contextPath}/mypage/review.do'" class="btn btn-default border">목록</button>
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
<!--     footer part start -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end --> 
</body>

</html>