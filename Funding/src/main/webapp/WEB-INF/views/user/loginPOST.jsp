<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript">
	var loginmsg = "${loginmsg}";

	if(loginmsg=="noid"){
		alert("가입된 이메일이 아닙니다. 회원가입해주세요.");
	}else if(loginmsg == "mispw"){
		alert("비밀번호를 확인해주세요.");
	}else if(loginmsg == "noemailauth "){
		alert("이메일 인증이 완료되지 않았습니다. 인증후 로그인해주세요.");
	}else if(loginmsg == "memtype_3"){
		alert("탈퇴를 신청했던 계정입니다.");
	}
	self.location='<c:url value="/user/login"/>';
	
	
</script>
