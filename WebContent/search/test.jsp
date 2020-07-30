<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
   function sub(){
	    document.checkReservationok.action="./viewReservationList.bo";
	    document.checkReservationok.submit();
/* 	   window.location.replace("viewReser_0_Main.jsp");    */
   }

</script>


<div id="wrap" class="myreservation">

		
	<div id="container">
		<div id="content">
			<!-- location -->
			<div id="location" class="" style="top: 0px;">
				<ol class="location_area">
					<li><a href="/CW/KO/main.do" id="Home">Ȩ</a></li>
					<li><a href="javascript:document.reservationList1.submit();" class="menuDepth2">���� ��ȸ</a></li>
					<li class="current"><span class="menuDepth3" href="#none">
		                                
		                              ���� ��ȸ/����/ȯ��</span>
						<div class="btn_lnb"><a href="#none" id="ReservationMenu">���� ��ȸ/���� ���� �޴�</a><span class="hidden-title">����</span></div>
						<div class="lnb_area" style="display: none;">
							<ul class="location_lnb">
								<li class="on"><a href="#none" class="menuDepth3_1">
		                                
		                              ���� ��ȸ/����/ȯ��</a></li>
								<li><a href="#none" class="menuDepth3_2">
		                                
		                              �¶��� üũ��</a></li>
							</ul>
						</div>
					</li>
				</ol>
			</div>
			<!-- content_inner -->
			<div class="content_inner">
				<h1 class="pagetitle" name="lblReservationInquiryChange">���� ��ȸ</h1>
				<!-- tab ���� (S) -->
				<div class="tab_section02 tab_2w first">
					<ul class="js-tab-section">
						<li class="OnOffTab on">
							<div class="tab_area">
								
								<div class="tab_content country">
									<!-- �������� ���೻�� ������ (S) -->
									<p id="noti7">����� ���༾�Ϳ��� �����Ͻ� ���� ��ȸ�� �����մϴ�.</p>
									<div class="tbl-input-row01 mgt20">
									
										<table>
										
											<caption id="noti8">�������� ���೻�� ������ ǥ | ��������, �����ȣ, ���࿩��, ž���Ϸ� �����Ǿ��ֽ��ϴ�.</caption>
											<colgroup>
												<col style="width:18.2%">
												<col>
												<col style="width:18.2%">
												<col>
											</colgroup>
											<tbody>
											<c:choose>
						                      <c:when test="${requestScope.vsize != 0 }">
						                        <c:forEach var="v" items="${requestScope.v}">
											<tr>
												<th scope="row"><label for="lastname" id="EngName">��������</label></th>
												<td colspan="3">
													<div>
														<span class="inp-txt mgr01"><input type="text" name="txtLastName" style="width:226px;text-transform:uppercase;ime-mode:inactive;ime-mode:disabled" id="txtLastName" title="Last Name(��) �Է¶�" value="${v.booking_eng_lastname}" readonly="readonly"></span>
														<span class="inp-txt"><input type="text" name="txtFirstName" style="width:226px;text-transform:uppercase;ime-mode:inactive;ime-mode:disabled" id="txtFirstName" title="First Name(�̸�) �Է¶�" value="${v.booking_eng_firstname}" readonly="readonly"></span>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtReservationNumber" id="ReservationNo">�����ȣ</label></th>
												<td colspan="3">
													<div>
														<span class="inp-txt"><input type="text" name="txtReservationNumber" style="width: 226px;text-transform:uppercase;" id="txtReservationNumber" maxlength="8" value="${v.booking_number}" readonly="readonly"></span>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtDepAirport" id="ReservationItinerary">���࿩��</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking js-radioLayer01">
																<input type="text" name="txtDepAirport" id="txtDepAirport" value="${v.booking_start}"title="����� �Է¶�" readonly="readonly" class="ui-autocomplete-input" autocomplete="off">																		
															</div>
															<div class="booking js-radioLayer01">
																<input type="text" name="txtArrAirport" id="txtArrAirport" value="${v.booking_arr}"title="������ �Է¶�" readonly="readonly">
															</div>
														</div>
														<div id="divBookingJourneyLayer" class="booking-journey-layer">
															
														
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">�����/������</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_start_date}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_arr_date}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															
															
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">��� �ð�/���� �ð�</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_start_time}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_arr_time}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															
															
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">�װ��� ���</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_flight_name}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
														
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">���� ��ȣ</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_passportnumber}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
														
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">���� �¼� / �⳻��</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_optseat}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_optfood}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
														
														</div>
														
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="txtOnlineDepartureDate3" name="lblRowBoardingDate">���� �ݾ�</label></th>
												<td colspan="3">
													<div class="booking-journey js-radioLayer01-wrap">
														<div class="bookgin_input">
															<div class="booking_date js-radioLayer01">
																<input type="text" name="txtOnlineDepartureDate3" id="txtOnlineDepartureDate3" value="${v.booking_total_price}"style="undefined;ime-mode:disabled" readonly="readonly">
															
															</div>
														
														</div>
														
													</div>
												</td>
											</tr>
											 </c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<th><label>����� ������ �����ϴ�.</label></th>
							</tr>
							</c:otherwise>
							</c:choose>
											
											</tbody>
											 
										</table>
									</div>
									<div class="btn_article">
										<ul>											
											<li><button type="button" id="btnConfirm" class="btn-type01-col01" onclick="sub();">Ȯ��</button></li>
										</ul>
									</div>
									
									<ul class="uList01 mgt40">
										<li name="lblNoti2">�����ȣ �� ���������� ��Ȯ�ϰ� �Է��ϼž� Ȯ�� �����մϴ�. ��) 12345678 �Ǵ� ABCDE</li>
										<li name="lblNoti3">ž�°��� ���������� ��Ȯ�� �Է��Ͽ��� Ȯ�� �����մϴ�.</li>
										<li name="lblNoti4">�� �����̶� ������� ���� ���� ��ȸ�� �Ұ����մϴ�.</li>
										<li id="noti9">����縦 ���� ������ Ȯ���� �Ұ��մϴ�.</li>
										<li name="lblNoti1">Ȩ������ �� ������� ���ؼ� �����Ͻ� ������ �α��� �� ���� ��ȸ, ����, ��� ���� �����մϴ�.</li>
										<li id="noti10" class="point-color01">Ȩ������ �� ����Ͽ��� ��ȸ������ �����Ͻ� ���, [��ȸ�� �α��� ������ȸ] �޴����� �����ȣ �� e-mail �Է� �� ���� ��ȸ �� ��Ұ� �����մϴ�.</li>
									</ul>
									<!-- �������� ���೻�� ������ (E) -->
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- tab ���� (E) -->
			</div>
		</div>
	</div>
	<p name="viewLayerLogin" href="I/KO/viewTwoLoginPnr1" class="jsOpenLayer" style="display:none;"></p>
	<form id="checkReservationok" name="checkReservationok" method="post"></form>

</div>
