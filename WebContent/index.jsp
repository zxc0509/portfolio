
  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!doctype html>
<html lang="en">

<head>

</head>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    

<body>
  <c:if test="${msg!=null}">
  	<script type="text/javascript">
  		window.alert('${msg}');
  	</script>
  </c:if>
    <!-- Header part end-->
	<jsp:include page="/inc/header.jsp"></jsp:include>
    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!-- booking part start-->
    <section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_menu">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <a class="nav-link active" id="hotel-tab" data-toggle="tab" href="#hotel" role="tab" aria-controls="hotel" aria-selected="true">자유여행 기차표 검색</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                	<c:if test="${not empty sessionScope.id}">
                                	<c:url var="url1" value="/json/">
                                	</c:url>
                                	</c:if>
                                	<c:if test="${empty sessionScope.id}">
                                	<c:url var="url1" value="/mem/nomember.do">
                                	</c:url>
                                	</c:if>
                                    <form name = "commentForm" action="${url1}" method="post">
                              
                                        <div class="form-row">
											<div class="input-group mb-3" style="width:25%; height:25%" >
												<input type="text" class="form-control"
													placeholder="출발역"
													aria-label="Recipient's username"
													aria-describedby="button-addon2"
													id="txtGoStart"
													name="txtGoStart"
													title="출발역" 
                                                	autocomplete="off"
                                                >
                                                <input type="hidden" id="code1" name="code1" >
												<div class="input-group-append">
													<button class="btn btn-outline-secondary" type="button"
														id="button-addon2" onclick="btnPopWin(1,'txtGoStart');">검색</button>
												</div>
											
											</div>
											<div class="input-group mb-3" style="width:25%; height:25%" >
												<input type="text" class="form-control"
													placeholder="도착역"
													aria-label="Recipient's username"
													aria-describedby="button-addon2"
													id="txtGoEnd"
													name="txtGoEnd"
													title="도착역" 
                                                	autocomplete="off"
                                                >
                                                <input type="hidden" id="code2" name="code2" >
												<div class="input-group-append">
													<button class="btn btn-outline-secondary" type="button"
														id="button-addon2" onclick="btnPopWin(2,'txtGoEnd');">검색</button>
												</div>
											</div>
                                           
  												<div class="form-group">
    											<select class="form-control" id="exampleFormControlSelect1" name="form_control">
                                                    <option selected>기차종류</option>
                                                    <option value="00">KTX</option>                                                    
                                                    <option value="01">새마을호</option>
                                                    <option value="02">무궁화</option>
                                                    <option value="03">통근열차</option>
                                                    <option value="04">누리로</option>
                                                    <option value="06">AREX직통</option>
                                                    <option value="07">KTX-산천</option>
                                                    <option value="08">ITX-새마을</option>
                                                    <option value="09">청춘</option>
                                                    <option value="10">KTX-산천</option>
                                                    <option value="15">ITX-청춘</option>
                                                    <option value="17">SRT</option>
                                                    
                                                </select>
                                            </div>
                                            
                                            <div class="form_group" style="margin-top: 5px">
                                                <input id="datepicker_1" placeholder="출발일" name="datepicker_1">
                                            </div>
                                            
                                            <div class="form_btn" style="padding-right: 20px">
                                            	<input type="submit" class="btn btn-secondary" value="검색"/>
                                                
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Header part end-->

    <!-- footer part start-->
   	<jsp:include page="/inc/footer.jsp"></jsp:include>
    <!-- footer part end-->

    <!-- jquery plugins here-->
    
    
    
    <script src="../js/search.js"></script>
    
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
