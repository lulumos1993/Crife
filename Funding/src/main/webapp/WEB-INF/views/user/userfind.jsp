<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>  
<link href="../css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="../css/user.css" rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet"	crossorigin="anonymous">
<link href="../css/form-validation.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript">

	var msg = "${msg}";
	var mem_email = "${mem_email}";
	var findpw = "${findpw}";
	
		if(msg=='noid'){
			alert(mem_email+"는 존재하디 않는 입니다. 회원가입해 주세요.");
			self.location='<c:url value="/user/join"/>';
		}else if(msg=='id'){
			alert(mem_email+"는 존재하는 회원 입니다. 로그인해 주세요.");
			self.location='<c:url value="/user/login"/>';
		}else if(msg=='email'){
			alert(mem_email+"로  발송완료. 비밀번호를 재설정 해주세요.");
		}else if(msg=='noemail'){
			alert(mem_email+"은 가입된 이메일이 아닙니다. 확인해 주세요.");
			self.location='<c:url value="/user/userfind"/>';
		}


	$(document).ready(function() {
		
		//이메일 유효성 검사
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		$("#mem_email").on({
			keydown : function(){
			var mem_email = $("#mem_email").val();
				if(!getMail.test(mem_email)){
					$("#check").text("이메일 형식이 아닙니다.");
					$("#check").css("color","red");
				}else{
					$("#check").text("");
				}
			}

		});

		//이메일 유효성 검사
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		$("#findpw").on({
			keydown : function(){
			var mem_email = $("#findpw").val();
				if(!getMail.test(mem_email)){
					$("#check1").text("이메일 형식이 아닙니다.");
					$("#check1").css("color","red");
				}else{
					$("#check1").text("");
				}
			}

		});
		
		$("#btnid").click(function() {
			var mem_email = $("#mem_email").val();
			if (mem_email == "") {
				alert("email을 입력해 주세요.");
				document.getElementById('findidform').mem_email.focus();
			}else{
				document.getElementById('findidform').submit();
			}
			
		});

		$("#btnpw").click(function() {
			var findpw = $("#findpw").val();
			if (findpw == "") {
				alert("email을 입력해 주세요.");
				document.getElementById('findpwform').findpw.focus();
			}else{
				document.getElementById('findpwform').submit();
			}
			
		});
	});

</script>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>

<br><br><br>

<div class="container" >

	<form id="findidform" action="/funding/user/userfind_id" method="post" >
	
		<h1 class="h3 mb-3 font-weight-norma"> 아이디 찾기 <span id="check" class="message"></span> </h1>
		<div class="mb-3">
			<input class="form-control" name="mem_email" id="mem_email" type="email" placeholder="이메일 계정" autofocus> 
		</div>
		<div class="mb-3">		
			<button class="btn btn-outline-secondary" type="button" id="btnid">확인</button>
		</div>

	</form>
	
	<div class="dropdown-divider"></div>
	
  	<form id="findpwform" action="/funding/user/userfind_pw" method="post">
  		
  		<h1 class="h3 mb-3 font-weight-norma"> 비밀번호 재설정 <span id="check1" class="message"></span> </h1>
  		<p>
  			가입하셨던 이메일 계정을 입력하시면,
  			비밀번호를 새로 만들 수 있는 링크를 
  			이메일로 발송해드립니다.
  		</p>
		<div class="mb-3">
			<input class="form-control" name="findpw" id="findpw" type="email" placeholder="이메일  계정"> 	
		</div>
		<div class="mb-3">		
			<button class="btn btn-outline-secondary" type="button" id="btnpw">확인</button>
		</div>

	</form>

</div>


</body>
</html>