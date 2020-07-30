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
    <title>write</title>
    <jsp:include page="../inc/Bootstrap.jsp"></jsp:include>  
    <link rel="stylesheet" href="../css/join.css">
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address4").value = extraAddr;
                
                } else {
                    document.getElementById("address4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address').value = data.zonecode;
                document.getElementById("address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address3").focus();
            }
        }).open();
    }
    
    function checkBirth(){
   	 var birth = $("#birth").val();
   	 var checkSpan = $("#checkbirth");
   	 var reg = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
   	
   	 if(!reg.test(birth)){
   		 checkSpan.html("<b style='color:silver'>생년월일 8자리를 입력해주세요.</b>");
   		 result_birth = false;
   	 }else{
   		 checkSpan.html("<b style='color:blue'></b>");
   		 result_birth = true;
   	 }
   }
   function checkPwd(){
   	 var pwd1 = $("#passwd").val();
   	 var checkSpan = $("#checkPwd1");
   	 var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
   	
   	 if(!reg.test(pwd1)){
   		 checkSpan.html("<b style='color:silver'>영문,특수문자,숫자 조합으로 8자 이상으로 작성하세요.</b>");
   		 result_pwd = false;
   	 }else{
   		 checkSpan.html("<b style='color:blue'>사용가능한 비밀번호 입니다.</b>");
   		 result_pwd = true;
   	 }
   }

   function checkPhone(){
   	var phone = $("#phone").val();
   	var checkSpan2 = $("#checkPhone");
   	var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
   	
   	if(!regPhone.test(phone)){
   		checkSpan2.html("<b style='color:silver'>형식이 맞지 않습니다.</b>");
   	}else{
   		checkSpan2.html("<b style='color:blue'>사용가능한 전화번호</b>");
   	}
   }
   
   function checkName(){
		var name = $("#name").val();
		var checkSpan3 = $("#checkName");
		var regName = /^[가-힣]{2,4}$/;
		
	 	if(!regName.test(name)){
	 		checkSpan3.html("<b style='color:silver'>형식이 맞지 않습니다.</b>");
	 	}else{
	 		checkSpan3.html("<b style='color:blue'>사용가능 합니다.</b>");
	 	}
	}
    </script>
    
</head>

<body>

   <!--::header part start::-->
	<jsp:include page="../inc/adminHeader.jsp"/>
    <!-- Header part end-->
<!-- 로긴폼 -->

<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="id" value="${sessionScope.id }"/>

<div class="container-fluid">
	<div class="row">
	<jsp:include page="../inc/adminSidebar.jsp"/> 	
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
		
		<div class="col-sm-11">
			<form action="${contextPath}/adm/memberViewPro.do" method="post" style="border: 1px solid white; text-align:center" >
			<br>
			<h1>회원정보 수정</h1>
			<hr>
			<label for="id"><b>Id</b></label> 
			<input type="text" name="id" value="${vo.id}" readonly><br>
			
			<label for="psw"><b>Password</b></label>
			 <input type="password" id="passwd" name="passwd" value="${vo.passwd}" onblur="checkPwd()" required><br> 
			 <span id="checkPwd1">&nbsp;</span><br>
			 
			<label for="name"><b>Name</b></label>
			<input type="text" name="name" id="name" value="${vo.name}" onblur="checkName()" required><br>
			<span id="checkName">&nbsp;</span><br>
			
			<label for="birth"><b>Birth</b></label>
			<input type="text" name="birth" id="birth"value="${vo.birth}" onblur="checkBirth()" required><br>
			<span id="checkbirth">&nbsp;</span><br>
			
			<label for="email"><b>Email</b></label>
			<input type="email" name="email" id="email" value="${vo.email}" required><br>
			
			 <label for="phone"><b>Phone</b></label>
			<input type="text" name="phone" id="phone" value="${vo.phone}" onblur="checkPhone()" required><br>
			<span id="checkPhone">&nbsp;</span><br>
			 
			<label for="address"><b>Address</b></label><br>
			<div style="text-align:center">
			<input type="text" name="address" id="address" style="width:20%" value="${vo.address}" readonly required >
			<button class="btn btn-success" type="button" style="width:14%" onclick="sample6_execDaumPostcode()">우편번호 찾기<br></button>
			</div>
		
			<input type="text" name="address2" id="address2" value="${vo.address2}" readonly required>
			<input type="text" name="address3" style="width:40%" id="address3" value="${vo.address3}" readonly required>
			<input type="text" name="address4" style="width:40%" id="address4" value="${vo.address4}" readonly required><br>
			
			
			
			<button type="submit" style="float:center; width:30%">회원정보 수정</button>
			
			</form>
		</div>
	</div>
</div>

<!--     footer part start -->
    
<!--     footer part end --> 
</body>
<jsp:include page="../inc/footer.jsp"/>
</html>