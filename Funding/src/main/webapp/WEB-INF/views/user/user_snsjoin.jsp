<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/bootstrap.min.css" rel="stylesheet"	crossorigin="anonymous">
<link href="../css/form-validation.css" rel="stylesheet">

<!-- 유효성 검사 -->
<script>window.jQuery || document.write('<script src="../css/jquery-slim.min.js"><\/script>')</script>
<script src="../css/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../css/form-validation.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var msg = "${msg}";

	if (msg === "0") {
		alert("가입되어 있지 않은 회원입니다. 회원가입을 해 주세요.");
	}else if (msg === "3") {
		alert("탈퇴를 신청했던 계정입니다.");
		self.location = '<c:url value="/user/login"/>';
	}

	$(document).ready(function() {
		var chk = 0;
		var chkpw = 0;
		

		//이메일 중복확인	
		$("#emailcheck").on({
		click:function(){
			var mem_email = $("#mem_email").val();
			//console.log("mem_eamil : "+mem_email);
			
			 $.ajax({
				url : "/funding/user/emailCheck",
				type : "post",
				data : mem_email,
				dataType : 'text',
				contentType:"application/json", //추가해줘야 특수문자 그대로 이동함! 필수!
				success : function(data){
					//console.log("결과 : "+data);
					if(data > 0){
						$("#check").text("가입된 이메일 입니다.");
						$("#check").css("color","red");
					}else{
						$("#check").text("사용가능한 이메일 입니다.");
						$("#check").css("color","green");

						chk = 1;
					}
				},
				error : function(){
					console.log("이메일 중복확인 실패");
				}
			});
		}
		});

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

	 	//이메일 중복확인 &비밀번호 일치 을 해야됨
		$("#btnSave").click(function(e){
			if(chk!=1 ){
				alert("이메일 중복을 확인 해주세요.");
				return false;
			}
			document.getElementById('SNSjoinform').submit();
		});

	});
</script>
<meta charset="UTF-8">
<title>sns회원가입</title>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>

<br>
<br>

<div class="container">
	<form id="SNSjoinform" class="needs-validation" action="/funding/user/snsjoinPOST" method="post" novalidate>
	
		<h1 class="h3 mb-3 font-weight-norma"> sns회원가입</h1>
			<input type="hidden" name="naver_idx" id="naver_idx" value="${snsUser.naver_idx}">
		
		<div class="mb-3">
			<label for="email"> Email <span id="check" ></span> </label>
			<div  class="input-group mb-3">
				<input type="email" class="form-control" id="mem_email" name="mem_email" 
					placeholder="you@example.com" value required autofocus>
			<div class="input-group-append">
    			<button class="btn btn-outline-secondary" type="button" id="emailcheck">이메일 중복확인</button>
  			</div>
			<div class="invalid-feedback">이메일을 입력해 주세요</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 mb-3">
			<label for="password">비밀번호       <span id="pwc"></span></label> 
			<input type="password" class="form-control" id="mem_password" name="mem_password" 
					placeholder="비밀번호" value required maxlength="15" minlength="8">
			<div class="invalid-feedback">비밀번호를 입력해 주세요</div>
			</div>
			<div class="col-md-6 mb-3">
			<label for="repassword">비밀번호 재입력       <span id="repwc"></span></label> 
			<input type="password" class="form-control" id="mem_repassword" name="mem_repassword" 
					placeholder="비밀번호 재입력" value required maxlength="15" minlength="8">
			<div class="invalid-feedback">비밀번호를 다시 입력해 주세요</div>
			</div>
		</div>	

		<div class="mb-3">
			<label for="name">이름 </label> 
			<input type="text" class="form-control" id="mem_name" name="mem_name" 
					placeholder="이름" value required>
			<div class="invalid-feedback">이름을 입력해 주세요</div>
		</div>
		
		<div class="mb-3">
			<label for="phone">전화번호</label> 
			<input type="text" class="form-control" id="mem_phone" name="mem_phone" 
					placeholder="전화번호 : 숫자만 입력하세요" value required maxlength="13">
			<div class="invalid-feedback">전화번호를 입력해 주세요</div>
		</div>
			
		<div class="mb-3">
			<label for="birth_sex">주민번호</label> 
			<div class="input-group">
			<input type="text" class="form-control" id="mem_birth" name="mem_birth" 
					placeholder="생년월일" value required maxlength="6" minlength="6"> 
				<div class="invalid-feedback">6자리 숫자를 입력해 주세요</div>
			 - 
			<input type="text" class="form-control" id="mem_sex" name="mem_sex"	
					placeholder="성별"  value required maxlength="1">
			<div class="input-group-append"><span class="input-group-text">XXXXXX</span></div>
				<div class="invalid-feedback">1자리 숫자를 입력해 주세요</div>
			</div>
		</div>
		
		<button type="button" id="btnSave" class="btn btn-lg btn-primary btn-block">확인</button>
	</form>
</div>

</body>
</html>