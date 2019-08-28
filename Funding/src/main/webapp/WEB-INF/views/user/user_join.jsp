<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/checkout/">

<link href="../css/bootstrap.min.css" rel="stylesheet"	crossorigin="anonymous">
<link href="../css/form-validation.css" rel="stylesheet">

<!-- 유효성 검사 -->

<script>window.jQuery || document.write('<script src="../css/jquery-slim.min.js"><\/script>')</script>
<script src="../css/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../css/form-validation.js"></script>
	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<%@ include file="../include/navbar.jsp"%>

<br>
<br>

<div class="container">
	
	<form id="formjoin" class="needs-validation" action="/funding/user/joinPOST" novalidate method="post">

		<h1 class="h3 mb-3 font-weight-norma">회원가입</h1>

		<div class="mb-3">
			<label for="email">Email    <span id="check" class="message"></span></label> 
			<div class="input-group mb-3">
			<input type="email" class="form-control" id="mem_email" name="mem_email" 
					placeholder="you@example.com" value required autofocus>
			<div class="input-group-append">
    		<button class="btn btn-outline-secondary" type="button" id="emailcheck">이메일 중복확인</button>
  			</div>
			<div class="invalid-feedback">이메일을 입력해 주세요</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 mb-3" id="half">
			<label for="password" id="half">비밀번호       <span id="pwc" class="message"></span></label> 
			<input type="password" class="form-control" id="mem_password" name="mem_password" 
					placeholder="비밀번호" value required maxlength="15" minlength="8">
			<div class="invalid-feedback">비밀번호를 입력해 주세요</div>
			</div>
			<div class="col-md-6 mb-3" id="half">
			<label for="repassword" id="half">비밀번호 재입력       <span id="repwc" class="message"></span></label> 
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
			<div class="input-group" >
			<input type="text" class="form-control" id="mem_birth" name="mem_birth" 
					placeholder="생년월일" value required maxlength="6" minlength="6"> 
				<div class="invalid-feedback">6자리 숫자를 입력해 주세요</div>
			 - 
			<input type="text" class="form-control" id="mem_sex" name="mem_sex"	
					placeholder="성별"  value required maxlength="1">
			<div class="input-group-append"><span class="input-group-text">XXXXXX</span></div>
				<div class="invalid-feedback" >1자리 숫자를 입력해 주세요</div>
			</div>
		</div>
		<button type="submit" id="btnSave" class="btn btn-lg btn-primary btn-block">확인</button>
	</form>
	
</div>
</body>

<script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
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


	//pw 유효성 검사 : 8자리 이상, 15자리 이하, 문자+숫자+특문
	var pwCheck = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/);
	$("#mem_password").keydown(function(){
		var mem_password = $("#mem_password").val();
		if(!pwCheck.test(mem_password)){
			$("#pwc").text("최소 8자리 이상, 최소 1개의 문자, 숫자, 특수문자");
			$("#pwc").css("color","red");
		}else{
			$("#pwc").text("");
		}
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
	
	//이름 한글만 입력
	

	//전화번호 자동 하이픈 & 숫자만 입력
	$('#mem_phone').keydown(function(event) {
	    var key = event.charCode || event.keyCode || 0;
	    $text = $(this);
	    if (key !== 8 && key !== 9) {
	        if ($text.val().length === 3) {
	            $text.val($text.val() + '-');
	        }
	        if ($text.val().length === 8) {
	            $text.val($text.val() + '-');
	        }
	    }
	    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
	}); 

	

	//생년월일 & 성별 숫자만 입력


 	//이메일 중복확인을 해야됨
	$("#btnSave").click(function(){
		if(chk!=1 ){
			alert("이메일 중복을 확인 해주세요.");
			return false;
		} else if(chkpw!=1){
			alert("비밀번호를 확인 해주세요.");
			return false;
		}

	});


		
});

</script>
<!-- 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	$("#formjoin").validate({
		onfocusout : function(element){
			$(element).valid();
		},
		rules : {
			mem_email : { required: true, email : true ,rangelength : [5,40]},
			mem_password : { required: true, rangelength : [8,15] , 
							regx : /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/ },
			mem_repassword : { required: true, equalTo : "#mem_password" },
			mem_name : { required: true, regx : /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g },
// phone 메소드 만들어서 추가하기!
			mem_phone : { required: true, rangelength : [11,13]},
			mem_birth : { required: true, digits : true, rangelength : [6,6]},
			mem_sex : { required: true, digits : true, range : [1,9]}		
			//digits vs number : digits는 양의 정수만 허용	
		},
		messages : {
			mem_email : { required: "이메일을 입력해 주세요.", email : "이메일 형식이 잘못되었습니다." 
							,rangelength : "5자 이상 40자 이하로 입력해주십시오."},
			mem_password : { required: "비밀번호를 입력해주세요." , rangelength : "8자리 이상 15자리 이하로 입력해주세요."  , 
							regx : "최소 1개의 문자, 숫자, 특수문자 조합이 필요합니다." },
			mem_repassword : { required: "비밀번호를 재입력해주세요.", equalTo : "비밀번호가 일치하지 않습니다."  },
			mem_name : { required: "이름을 입력해주세요.", regx : "한글로 입력해주세요"},
			mem_phone : { required: "전화번호를 입력해주세요." , rangelength : ""},
			mem_birth : { required: "생년월일을 6자로 입력해주세요.", digits : "숫자만 입력해주세요", rangelength : "6자리 숫자만 입력해주세요." },
			mem_sex : { required: "한글자 숫자로 입력해주세요." , digits : "숫자만 입력해주세요.", range : "한글자만 입력해주세요." }			
		},
		/* errorPlacement : function(error, element){
			if(element.hasClass("invalid-feedback")){
				error.insertBefore(element);
			} 
		}, */
		invalidHandler : function(form, validator){
			
		},
		submitHandler : function(form){
			
		}

	});
	
});

</script> -->

</html>