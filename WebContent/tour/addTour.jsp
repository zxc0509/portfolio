<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
    <link rel="icon" href="../img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="../css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="../css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="../css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="../css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="../css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="../css/style.css"> 

     <link type="text/css" rel="stylesheet" href="../css/board.css" />
</head>

<body>
   <!--::header part start::-->
	<jsp:include page="../inc/header.jsp"/>
    <!-- Header part end-->
	<div class="container-fluid">  
	    <div class="row" >&nbsp;</div>
    <div class="row" id="main_img">
		  <div class="content">
		    <h2>패키지 상품 등록</h2>
		  </div>
		</div>
   		 </div>
	
<c:set var="id" value="${sessionScope.id }"/>
	
	<div class="container">
	  <form name="fr" method="post" action="${contextPath }/to/addTourPro.do">
	    <div class="row">
	      <div class="col-20">
	        <label for="tour_num">Tour No.</label>
	      </div>
	      <div class="col-30-1">
	        <input type="text" id="tour_num" name="tour_num" placeholder="상품번호를 입력하세요">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="tour_name">Tour Name</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="tour_name" name="tour_name" placeholder="상품이름을 입력하세요">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="start_date">Start Date</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="start_date" name="start_date" placeholder="출발일을 입력하세요(yyyy-MM-dd HH:mm:ss)">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="end_date">End Date</label>
	      </div>
	      <div class="col-80">
	       <input type="text" id="end_date" name="end_date" placeholder="도착일을 입력하세요(yyyy-MM-dd HH:mm:ss)">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="transport">Transport</label>
	      </div>
	      <div class="col-80">
	       <input type="text" id="transport" name="transport" placeholder="이동수단을 입력하세요">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="stay">Stay</label>
	      </div>
	      <div class="col-80">
	       <input type="text" id="stay" name="stay" placeholder="숙박시설을 입력하세요">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="price">Price</label>
	      </div>
	      <div class="col-80">
	       <input type="text" id="price" name="price" placeholder="가격을 입력하세요">
	      </div>
	    </div>
	    <br><br>
	      <div id = "btnarea">
			<div class="btn-div">
				<button type="submit" class="btn wrbtn" id="btn1">상품 등록</button>
				<button type="button" class="btn wrbtn" id="btn3" 
							onclick="location.href='${contextPath}/to/tour.do'">목록으로</button>
			</div>
		</div>
	  </form>
	</div>
    <jsp:include page="../inc/footer.jsp"></jsp:include>
<!--     footer part end -->

    <!-- jquery plugins here-->
    <script src="../js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="../js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="../js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="../js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="../js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="../js/jquery.ajaxchimp.min.js"></script>
    <script src="../js/jquery.form.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../js/mail-script.js"></script>
    <script src="../js/contact.js"></script>
    <!-- custom js -->
    <script src="../js/custom.js"></script>
</body>

</html>