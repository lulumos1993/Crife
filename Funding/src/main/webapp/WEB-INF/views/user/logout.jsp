<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript">
console.log("엥");
	var msg = "${msg}";
	if(msg=="del"){
		alert("그동안 이용해주셔서 감사합니다. :) ");
	}

	alert("잘가 ;( ");
	self.location='<c:url value="/"/>';
</script>