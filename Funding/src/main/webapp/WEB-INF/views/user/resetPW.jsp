<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>    
<link href="../css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="../css/form-validation.css" rel="stylesheet">
<link href="../css/user.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	var msg = "${expired}";
	if(msg=="expired"){
		alert("만료된 링크입니다.");
		self.location='<c:url value="/"/>';
	} 
	
	$(document).ready(function() {

		var pw = 0;
		var chkpw = 0;

		//pw 유효성 검사 : 8자리 이상, 15자리 이하, 문자+숫자+특문
		var pwCheck = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/);
		$("#mem_password").keydown(function(){
			var mem_password = $("#mem_password").val();
			if(!pwCheck.test(mem_password)){
				$("#pwc").text("최소 8자리 이상, 최소 1개의 문자, 숫자, 특수문자");
				$("#pwc").css("color","red");
			}else{
				pw = 1;
				$("#pwc").text("");
			}
			console.log(pw);
		});
		

		//pw와 repw일치
		$("#mem_repassword").keyup(function(){
			var mem_password = $("#mem_password").val();
			var mem_repassword = $("#mem_repassword").val();
			
			if(mem_password == mem_repassword){
				$("#repwc").text("비밀번호가 일치합니다.");
				$("#repwc").css("color","green"); 
				chkpw = 1;
			}else {
				$("#repwc").text("비밀번호가 불일치");
				$("#repwc").css("color","red");
			}
		});
		
		$("#btn").click(function() {

			
			if(pw!=1){
				alert("비밀번호가 양식에 일치하지 않습니다. \n비밀번호는 8글자 이상, 15글자 이하 \n 최소 1개의 문자, 숫자, 특수문자로 구성되어야 합니다. ");
				return false;
			}else if (chkpw != 1) {
				alert("비밀번호 입력값이 다릅니다. 확인해 주세요.");
				document.getElementById('resetpwform').mem_password.focus();
				return;
			}
			document.getElementById('resetpwform').submit();
		});
	});
</script>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>

<br><br><br>

<div class="container">

<form id="resetpwform" action="/funding/user/resetpw" method="post">

<input type="hidden" name="email_key" value="${email_key }">
<input type="hidden" name="mem_email" value="${mem_email }">

		<h1 class="h3 mb-3 font-weight-norma"> 비밀번호 재설정 </h1>

		<div class="mb-3">
			<label for="password">비밀번호       <span id="pwc" class="message"></span></label> 
			<input type="password" class="form-control" id="mem_password" name="mem_password" 
					placeholder="비밀번호" value required maxlength="15" minlength="8">
			<div class="invalid-feedback">비밀번호를 입력해 주세요</div>
		</div>
		<div class="mb-3">
			<label for="repassword">비밀번호 재입력        <span id="repwc" class="message"></span></label> 
			<input type="password" class="form-control" id="mem_repassword" name="mem_repassword" 
					placeholder="비밀번호 재입력" value required maxlength="15" minlength="8">
			<div class="invalid-feedback">비밀번호를 다시 입력해 주세요</div>
		</div>
		
		<button type="button" id="btn" class="btn btn-lg btn-outline-secondary btn-block">완료</button>

		</table>
</form>

</div>
</body>
</html>