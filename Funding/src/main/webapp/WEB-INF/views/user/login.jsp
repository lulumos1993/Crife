<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
	var msg = "${msg}";
	
	if(msg==="registered"){
		alert("가입축하합니다! 이메일인증 후, 로그인 할 수 있습니다.");
	}else if(msg==="sns"){
		alert("가입축하합니다! 로그인 해주세요!")
	}

	
	
</script>
<meta charset="UTF-8">
<title>로그인</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- Custom styles for this template -->
<link href="../css/user.css" rel="stylesheet">

</head>
<body class="text-center">
<%@ include file="../include/navbar.jsp"%>

<div class="container">

<form class="form-login" id="loginform" action="${path}/user/loginPOST" method="post" >
	<h1 class="h3 mb-3 font-weight-norma"> Login </h1>
	
	<label for="inputEmail" class="sr-only"> Email address </label>
	<input type="email" name="mem_email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
	<label for="inputPassword" class="sr-only"> Password </label>
	<input type="password" name="mem_password" id="inputPassword" class="form-control" placeholder="Password" required>
	<div class="checkbox mb-3">
		<label>
		<input type="checkbox" name="useCookie" id="useCookie"> 자동로그인
		</label>
	</div>
	<button id="loginBtn" class="btn btn-lg btn-outline-secondary btn-block" type="submit">Login</button>
	<br>
	<div id="naver_id_login" style="text-align:center;">
	<a href="${naverURL }">
		<img  height="50" src="../images/NAVER.png" alt="login_naver" />
	</a>
	</div>
</form>
<div class="dropdown-divider"></div>
  <a class="dropdown-item" href="join">회원가입</a>
  <a class="dropdown-item" href="userfind">이메일 찾기 & 비밀번호 재발급</a>
  	<br>	<br>	<br>
</div>
	
</body>
</html>