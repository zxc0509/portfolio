<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

  <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/join.css">
<script src="http://code.jquery.com/jquery.js"></script> <%--유효성떄메 --%> 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

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
	
	function checkPwd2(){
		   	var pwd1 = document.getElementById("passwd").value;
		    var pwd2 = document.getElementById("passwd-repeat").value;
		    var checkSpan = document.getElementById("checkPwd2");
		    if(pwd2 != ""){
			   	if(pwd1 == pwd2){
			    	checkSpan.innerHTML = "<b style='color:blue'>비밀번호가 일치합니다.</b>";
			    	result_pwd2 = true;
			   	}else{
			   		checkSpan.innerHTML = "<b style='color:silver'>비밀번호가 일치하지 않습니다.</b>";
			   		result_pwd2 = false;
			    }
		    }
		    setTimeout("checkPwd2()",0);
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

	function checkId(){
		 var _id = $("#id").val();
		 var checkSpan4 = $("#checkId");
		 var regId = /^[a-zA-Z0-9]{4,12}$/;
		 
		 // var idInfo = '{"id":"'+_id+'"}';
		 
		 if(!regId.test(_id)){//실패
			 checkSpan4.html("<b style='color:silver'>아이디는 4~12글자로 대/소문자와 숫자만 사용가능합니다.</b>");
		 	$("#id").focus();
		 	return;
			 // document.getElementById("signupbtn").disabled=true;
		 }else{//만족
			 
			 $.ajax({
				 type : 'get',
				 async : false,
				 url : '${contextPath}/mem/joincheckId.do',
				 data : {id : _id},
				 success : function(data){
					console.log(data);
					
					 var str1;
					 if(data == "success"){
						 str1 = "<b style='color:blue'>사용 가능한 아이디 입니다.</b>";
						 $('#checkId').html(str1);
						
						 
					 }else{
						 str1 = "<b style='color:red'>이미 사용중인 아이디 입니다.</b>";
						 $('#checkId').html(str1);
						 $("#id").focus();
						 
						 
					 }}, error : function(){
						 alert("에러!!");
					 }
			 });
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
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>    

<form action="${contextPath}/mem/joinPro.do" name="f" method="post" style="border:1px solid #ccc; width:100%; text-align:center;">
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
	<div>
    <label for="id"><b>Id</b></label><br>
    <div>
    <input type="text" style="width:80%" id="id" placeholder="아이디를 입력하세요." name="id" required onblur="checkId()">
    
    </div>
    <span id="checkId">&nbsp;</span>
	</div><br>
	<div>
    <label for="psw"><b>Password</b></label><br>
    <input type="password" id="passwd" placeholder="비밀번호를 입력하세요." name="passwd" onblur="checkPwd()" required><br>
    <span id="checkPwd1">&nbsp;</span>
	</div><br>
	<div>
    <label for="psw-repeat"><b>Repeat Password</b></label><br>
    <input type="password" id="passwd-repeat" placeholder="비밀번호를 재확인하세요." name="passwd-repeat" required onblur="checkPwd2()"><br>
    <span id="checkPwd2">&nbsp;</span>
	</div><br>
	<div>
	<label for="name"><b>Name</b></label><br>
	<input type="text" placeholder="이름을 입력하세요." name="name" id="name" onblur="checkName()" required><br>
	<span id="checkName">&nbsp;</span><br>
	</div><br>
	<div>
	<label for="birth"><b>Birth</b></label><br>
	<input type="text" placeholder="생년월일을 8자리로 입력하세요." name="birth" id="birth" required onblur="checkBirth()"><br>
	<span id="checkbirth">&nbsp;</span><br>
	</div><br>
	<div>
	<label for="email"><b>Email</b></label><br>
	<input type="email" name="email" id="email" placeholder="이메일을 입력하세요." required >
	</div><br>
	<div>
	<label for="phone"><b>Phone</b></label><br>
	<input type="text" name="phone" id="phone" placeholder="휴대폰번호를 입력하세요." required onblur="checkPhone()"><br>
	<span id="checkPhone">&nbsp;</span>
	</div><br>
	
	<label for="address"><b>Address</b></label><br>
	<div style="text-align:center">
	<input type="text" name="address" id="address" style="width:20%" placeholder="우편번호" readonly required >
	<button class="btn btn-success" type="button" style="width:12%" onclick="sample6_execDaumPostcode()">우편번호 찾기<br></button>
	</div>

	<input type="text" name="address2" id="address2" placeholder="주소" readonly required >
	<input type="text" name="address3" style="width:40%" id="address3" placeholder="상세주소" readonly required>
	<input type="text" name="address4" style="width:40%" id="address4" placeholder="기타주소" readonly required>
	
	

	<br>
    <label>
      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
    </label>

    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
    
  </div>
</form>
</body>
</html>