<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
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
</head>
<body>
   <header class="main_menu">
        <div class="sub_menu">
            <div class="container">
                <div class="row">
                    
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_social_icon">                            <c:if test="${empty sessionScope.id}">
                            <a href="${contextPath }/mem/login.do"><i class="">로그인</i></a>
                            <a href="${contextPath }/mem/join.do"><i class="">회원가입</i></a>                          
                            <span><i class="flaticon-phone-call"></i>로그인 해주세요</a></span>
                            </c:if>
                           <c:if test="${not empty sessionScope.id }">
                            	<c:set var="id" value="${sessionScope.id }"/>
                            <span><b style="margin-left:-25px;">${id}님 환영합니다😍</b></span>
                            </c:if>
                            <c:if test="${not empty sessionScope.id }">
                              <a href="${contextPath }/mem/logout.do"><i class="" style="margin-right:-20px; margin-left:-5px">로그아웃 | </i></a>
                              <a href="${contextPath }/mem/myCheck.do"><i class="" style="margin-right:-20px;">회원정보 수정</i></a>                                             							
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="${contextPath }/mem/index.jsp"> <img src="../img/보라투어로고.png" style="width:180px; height:70px;" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="${contextPath}/mem/index.do">Train</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${contextPath}/to/tour.do">Package</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${contextPath}/mypage/review.do">Review</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="${contextPath}/my/order.do" id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            My Page
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="${contextPath}/my/order.do">기차 주문목록</a>
                                            <a class="dropdown-item" href="${contextPath}/my/tourOrder.do">패키지 주문목록</a>
                                            <a class="dropdown-item" href="${contextPath}/bas/list.do">위시리스트</a>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${contextPath}/not/notice.do">고객센터</a>
                                    </li>
                                    
                                    <c:set var="id" value="${sessionScope.id }"/>
                                    <c:if test="${id.equals('admin')}">
                                    <li class="nav-item dropdown">
                                           <a class="nav-link" href="${contextPath}/adm/adminIndex.do" 
                                            role="button"  aria-haspopup="true"
                                            aria-expanded="false">
                                           	관리자
                                        </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                           
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
</body>
</html>