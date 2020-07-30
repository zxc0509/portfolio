<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자주 묻는 질문</title>
<jsp:include page="/inc/Bootstrap.jsp"></jsp:include>

<!-- 아이콘을 위한 css -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script type="text/javascript">
	$(function() {
		$(".bt").on(
				'click',
				function() {
					$(".card").attr("style", "display:none");
					var index = $(".bt").index(this);
					if (index == 0) {
						$(".card").attr("style", "display:flex");

					} else {
						index = index * 5;
						for (var i = 1; i < 6; i++) {
							$(".card:eq(" + (index - i) + ")").attr("style",
									"display:flex");
						}

					}

				});
		$("[name=searchbtn]").on(
				"click",
				function() {
					$(".card").attr("style", "display:none");
					var leng = $(".card").length;
					for (var i = 0; i < leng; i++) {

						var cardlink = $(".card-link:eq(" + i + ")").text();
						var cardbody = $(".card-body:eq(" + i + ")").text();
						var search = $("[name=search]").val();
						if (cardlink.indexOf(search) != -1
								|| cardbody.indexOf(search) != -1) {
							$(".card:eq(" + i + ")").attr("style",
									"display:flex");
						}

					}

				});
	});
</script>

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="/inc/header.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container-flude" style="min-height: 630px" id="con1" >
		<div class="row">
			<div class="col-sm-2"></div>
  		<div class="col-sm-1 w-100" style="padding-top: 92px">
				<a href="${contextPath}/not/notice.do" class="btn btn-dark w-100 mb-1" >공지사항</a><br>
				<a href="${contextPath}/not/faq.do" class="btn btn-dark w-100 mb-1">자주 묻는 질문</a><br>
				<a href="${contextPath}/que/question.do" class="btn btn-dark w-100 mb-1">문의 게시판</a>
				<c:choose>
	   				<c:when test="${sessionScope.id != null}">
				<a href="${contextPath }/que/myquestion.do" class="btn btn-dark w-100 mb-1">나의문의내역</a>
					</c:when>
					<c:when test="${sessionScope.id == null}">
				<a href="${contextPath }/mem/login.do" class="btn btn-dark w-100 mb-1">나의문의내역</a>
					</c:when>
				</c:choose>
			</div>

			<div class="col-sm-6 border pb-3 mt-2">
				<br>
				<h2 class="ml-3" align="center">자주 묻는 질문</h2>
				<br> <br>
				<div class="btn-group w-100">
					<a href="#" class="btn btn-dark btn-lg bt">전체</a> <a href="#" class="btn btn-dark btn-lg bt">예약/변경</a> <a href="#" class="btn btn-dark btn-lg bt">서비스</a> <a href="#"
						class="btn btn-dark btn-lg bt">결제</a> <a href="#" class="btn btn-dark btn-lg bt">기타</a>
				</div>
				<br> <br>
				<div class="row mx-2">
					<div class="input-group">
						<input type="text" class="form-control" name="search" placeholder="검색어">
						<div class="input-group-prepend">
							<span class="input-group-prepend"><button class="btn btn-danger" type="button" name="searchbtn">검색</button> </span>
						</div>
					</div>
				</div>
				<br> <br>
				<div id="service" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse1"> 인터넷에서 일부 승객 예약 변경은 어떻게 하나요? </a>
						</div>
						<div id="collapse1" class="collapse" data-parent="#service">
							<div class="card-body">예약센터(010-9669-2934)로 문의 해주시기 바랍니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse2"> 할인제도가 궁금합니다. </a>
						</div>
						<div id="collapse2" class="collapse" data-parent="#service">
							<div class="card-body">예약센터(010-9669-2934)로 문의 해주시기 바랍니다.
								</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse3"> 단체예약은 어떻게 합니까? </a>
						</div>
						<div id="collapse3" class="collapse" data-parent="#service">
							<div class="card-body">홈페이지와 예약센터를 통하여 예매하실 수 있습니다. 단체예약(10명이상) 문의는 010-9669-2934번으로 문의하여 주시기 바랍니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse4"> 예약센터를 통해 예매해도 인터넷 할인 받을 수 있나요? </a>
						</div>
						<div id="collapse4" class="collapse" data-parent="#service">
							<div class="card-body">예약센터를 통한 예매인 경우에는 인터넷 할인을 적용 받으실 수 없습니다. 또한, 예약센터, 공항지점 등 인터넷 이외의 지점에서 예약을 하시고 인터넷으로 구매하시는 경우에는 인터넷 할인이 적용되지 않습니다. 인터넷 할인을 받기 원하시는 경우에는 예약과 구매를 모두 인터넷을 통해서 하셔야 합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse5"> 좌석을 변경하고 싶습니다 .  </a>
						
						</div>
						<div id="collapse5" class="collapse" data-parent="#service">
							<div class="card-body">홈페이지를 통한 변경 또는 예약센터(010-9669-2934)로 문의 해주시기 바랍니다.
								</div>
						</div>
					</div>

				</div>
				<div id="reserve" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse6"> 교통약자를 위한 서비스가 있나요? </a>
						</div>
						<div id="collapse6" class="collapse" data-parent="#reserve">
							<div class="card-body">이동이 불편한 장애인, 노약자, 임산부 등을 위해 열차를 타고 내리실 때 불편함이 없도록 기차역 안내원이 안내해드립니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse7"> 열차 내에서 와이파이 이용이 가능한가요? </a>
						</div>
						<div id="collapse7" class="collapse" data-parent="#reserve">
							<div class="card-body">KTX,KTX-산천,ITX-새마을,ITX-청춘에서 와이파이 서비스를 제공하고 있습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse8"> 열차가 지연,취소 되었을 때  어떠한 조치를 하나요? </a>
						</div>
						<div id="collapse8" class="collapse" data-parent="#reserve">
							<div class="card-body">결항의 사유 및 상황에 따라 조치 내역이 다릅니다. 천재지변 기상, 기차역 등의 불가항력적인 사태로 인하여 결항되었을 경우 문자서비스와 전화로 안내하고 있습니다. 고객님의 불편을 최소화 하도록 노력하겠습니다. 감사합니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse9"> 열차 안에 휴대폰 충전기가 설치 되어 있나요? </a>
						</div>
						<div id="collapse9" class="collapse" data-parent="#reserve">
							<div class="card-body"> KTX 열차 안의 창문사이 벽에 충전용 콘센트 및 USB포트가 설치되어 있으며, KTX산천은 좌석 아래에 콘센트가 설치되어 있습니다.
								</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse10"> KTX 수유실은 어디에 있나요? </a>
						</div>
						<div id="collapse10" class="collapse" data-parent="#reserve">
							<div class="card-body"> KTX의 수유실 및 기저귀 교환장소는 2개의 호차(8호차,16호차)에 설치되어 있으며 KTX산천은 4호차에 있습니다.
								.</div>
						</div>
					</div>

				</div>
				<div id="pay" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse11"> 영수증은 어디에서 받을 수 있나요? </a>
						</div>
						<div id="collapse11" class="collapse" data-parent="#pay">
							<div class="card-body">예약센터(010-9669-2934)로 문의 해주시기 바랍니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse12"> 인터넷 예약 도중 이중(중복) 결제가 되었는데 어떻게 해야 하나요? </a>
						</div>
						<div id="collapse12" class="collapse" data-parent="#pay">
							<div class="card-body">예약센터(010-9669-2934)로 연락주시면, 카드 결제 및 발권 여부 확인 후 처리를 도와드리겠습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse13"> 인터넷 구매시 카드 승인은 정상적으로 이뤄졌으나, 예약 조회가 되지 않을 때 어떻게 해야하나요? </a>
						</div>
						<div id="collapse13" class="collapse" data-parent="#pay">
							<div class="card-body">예약센터(010-9669-2934)로 연락주시거나 홈페이지에서 고객문의를 남겨주시면, 확인 후 처리를 도와드리겠습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse14"> 인터넷으로 결제 시 무통장으로 입금할 수 있는 방법은 없나요? </a>
						</div>
						<div id="collapse14" class="collapse" data-parent="#pay">
							<div class="card-body">현재 무통장 입금 방법은 채택하고 있지 않습니다 대신, 카카오페이 방법을 통하여 결제하실 수 있습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse15"> 다른 사람카드를 통해 예약/결제도 가능한가요? </a>
						</div>
						<div id="collapse15" class="collapse" data-parent="#pay">
							<div class="card-body">예약센터(010-9669-2934)로 연락주시거나 홈페이지에서 고객문의를 남겨주시면, 확인 후 처리를 도와드리겠습니다.</div>
						</div>
					</div>
				</div>
				<div id="other" class="view">
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse16"> 탑승확인서 및 탑승 후 영수증은 어떻게 발급할 수 있나요? </a>
						</div>
						<div id="collapse16" class="collapse" data-parent="#other">
							<div class="card-body">에어부산을 이용하신 후 탑승확인서 및 영수증이 필요하신 손님은 당사 예약센터 010-9669-2934 으로 연락주셔서 본인확인 절차를 거치신 후 발급이 가능합니다. 본인확인 시 신분증을 팩스로 요청할 수 있으며, 탑승확인서는 본인에게만 발급이 가능함을 참고하여 주시기 바랍니다. 만약, 공항 현장에
								나가실 수 있는 손님은 공항 지점에서도 발급이 가능합니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse17"> 회원정보를 변경하고 싶어요. 방법을 알려 주세요. </a>
						</div>
						<div id="collapse17" class="collapse" data-parent="#other">
							<div class="card-body">다음과 같은 절차로 회원정보를 변경하실 수 있습니다. &lt;홈페이지&gt; 1) 홈페이지 우측상단의 ‘내정보'를 클릭합니다. 2)  원하시는 내용을 변경하고 우측 하단의 "수정" 버튼을 클릭하시면 완료됩니다.
								</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse18"> 열차에 애완용 동물과 함께 승차할 수 있나요? </a>
						</div>
						<div id="collapse18" class="collapse" data-parent="#other">
							<div class="card-body">애완용 동물은 가방 등에 넣어 보이지 않도록 하고 광견병 예방접종 등 필요한 예방접종을 한 경우에 한하여 동승 할 수 있습니다.</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse19"> 출발 당일 언제까지 기차역에 도착해야 하나요? </a>
						</div>
						<div id="collapse19" class="collapse" data-parent="#other">
							<div class="card-body">출발 전 인원확인 및 열차번호 확인에는 시간이 필요합니다. 그러므로 출발30분 전까지 여유 있게 기차역에 도착하시기 바랍니다. </div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<i class="far fa-question-circle" style="color: green"></i> <a class="card-link" data-toggle="collapse" href="#collapse20">  마일리지 적립이 되나요? </a>
						</div>
						<div id="collapse20" class="collapse" data-parent="#other">
							<div class="card-body">현재 보라투어는 마일리지제도가 별도로 제공되지 않으나 좀 더 합리적인 가격으로 고객님께 제공해 드리고 있으며, 추후 추가 예정입니다.</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<%-- Footer Start --%>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>