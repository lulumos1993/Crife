<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link href="../css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="../css/form-validation.css" rel="stylesheet">

<!-- 유효성 검사 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="../css/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
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
      .img_wrap{
      	width: 300px;
      	margin-top: 50px;
      }
      .img_wrap img{
      	max-width: 100%;
      }
    </style>

<meta charset="UTF-8">
<title>내정보</title>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>


<div class="container">

<form id="myinfoform" method="post" class="needs-validation" enctype="multipart/form-data" target="ifr">

	<h1 class="h3 mb-3 font-weight-norma"> 내 정보 </h1>
	<div class="mb-3">
			<label for="email">Email </label> 
			<div class="input-group mb-3">
			<input type="email" class="form-control" id="mem_email" name="mem_email" 
					value="${myinfo.mem_email }" readonly="readonly">
			</div>
	</div>
	
	<div class="row">
			<div class="col-md-6 mb-3">
			<label for="password">비밀번호  </label> 
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
			<label for="name">이름 <span id="name" class="message"> </label> 
			<input type="text" class="form-control" id="mem_name" name="mem_name" 
					placeholder="이름" value="${myinfo.mem_name }" value required>
			<div class="invalid-feedback">이름을 입력해 주세요</div>
	</div>
	<div class="mb-3">
			<label for="phone">전화번호 <span id="phone" class="message"></label> 
			<input type="text" class="form-control" id="mem_phone" name="mem_phone" 
					placeholder="전화번호 : 숫자만 입력하세요" value="${myinfo.mem_phone }" value required maxlength="13">
			<div class="invalid-feedback">전화번호를 입력해 주세요</div>
	</div>
	
	<div class="mb-3">
			<label for="birth_sex">주민번호 <span id="num" class="message"></label> 
			<div class="input-group">
			<input type="text" class="form-control" id="mem_birth" name="mem_birth" 
					placeholder="생년월일" value="${myinfo.mem_birth }" value required maxlength="6" minlength="6"> 
				<div class="invalid-feedback">6자리 숫자를 입력해 주세요</div>
			 - 
			<input type="text" class="form-control" id="mem_sex" name="mem_sex"	
					placeholder="성별" value="${myinfo.mem_sex }" value required maxlength="1">
			<div class="input-group-append"><span class="input-group-text">XXXXXX</span></div>
				<div class="invalid-feedback">1자리 숫자를 입력해 주세요</div>
			</div>
	</div>
	
	<div class="mb-3">
			<label for="address">주소</label>
			<div class="input-group">
				<input type="text" class="form-control" name="mem_zipcode" id="sample4_postcode" placeholder="우편번호" value="${myinfo.mem_zipcode}" >
				<input type="button"  onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			</div>
		<div class="row">
			<div class="col-md-6 mb-3">
			<label for="password">도로명주소  </label> 
				<input type="text" class="form-control" name="mem_address1" id="sample4_roadAddress" placeholder="도로명주소" value="${myinfo.mem_address1}">
			</div>
			<div class="col-md-6 mb-3">
			<label for="password">지번주소  </label> 
				<input type="text" class="form-control" name="mem_address2" id="sample4_jibunAddress" placeholder="지번주소" value="${myinfo.mem_address2}">
			</div>
		</div>
				<span id="guide" style="color:#999;display:none"></span>
			<div class="input-group">
				<input type="text" class="form-control" name="mem_address3" id="sample4_detailAddress" placeholder="상세주소" value="${myinfo.mem_address3}">
				<input type="text" class="form-control" name="mem_address4" id="sample4_extraAddress" placeholder="참고항목" value="${myinfo.mem_address4}">
			</div>
		<br>
	<div class="row">
	<div class="col-md-6 mb-3">
		<button type="button" id="btn_up" class="btn btn-lg btn-outline-secondary btn-block"> 수정 </button>
	</div>
	<div class="col-md-6 mb-3">
		<button type="button" id="btn_del" class="btn btn-lg btn-outline-secondary btn-block"> 탈퇴 </button>
	</div>
	</div>
</form>

</div>


	
<script type="text/javascript">
$(function() {

	var msg = "${msg}";
	if(msg=="project"){
		alert("진행중인 프로젝트가 있습니다. 완료 후, 탈퇴신청해주세요.");
	}
		
	//비밀번호 입력후에 수정&탈퇴 가능
	var chkPW = "${chkPW}";
	if(chkPW==="false"){
		alert("비밀번호 불일치. 비밀번호 확인해");
		document.getElementById('myinfoform').mem_password.focus();
	}

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
	$('#mem_name').keydown(function(event){
		 var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
         var v = $(this).val();
         if (regexp.test(v)) {
        	 $("#name").text("한글만 입력해 주세요.");
			 $("#name").css("color","red");
             $(this).val(v.replace(regexp, ''));
         }else{
        	 $("#name").text("");
         }

	});

	//전화번호 자동 하이픈 & 숫자만 입력
	$('#mem_phone').keydown(function(event) {
		//특수문자, 영어 입력 안됨! 숫자와 한글만 입력됨ㅜㅜ 한글도 입력하지 않도록?
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
	$('#mem_birth').keydown(function(event){
		var regexp = /[^0-9]/gi;
        var v = $(this).val();
        if (regexp.test(v)) {
        	$("#num").text("6자리 숫자만 입력해 주세요.");
			$("#num").css("color","red");
            $(this).val(v.replace(regexp, ''));
        }else{
        	$("#num").text("");
        }

	});
	$('#mem_sex').keydown(function(event){
		var regexp = /[^0-9]/gi;
        var v = $(this).val();
        if (regexp.test(v)) {
        	$("#num").text("숫자만 입력해 주세요.");
			$("#num").css("color","red");
            $(this).val(v.replace(regexp, ''));
        }else{
        	$("#num").text("");
        }
	});

	//수정
	$("#btn_up").click(function() {
		var pw = $("#mem_password").val();
		var repw = $("#mem_repassword").val();
		if (pw == "") {
			alert("비밀번호를 입력해주셔야 수정이 완료됩니다.");
			document.getElementById('myinfoform').mem_password.focus();
			return;
		}
		if (repw == "") {
			alert("비밀번호를 입력해주셔야 수정이 완료됩니다.");
			document.getElementById('myinfoform').mem_repassword.focus();
			return;
		}
		document.getElementById('myinfoform').action = "/funding/user/myinfo_up?mem_idx=${myinfo.mem_idx}";
		document.getElementById('myinfoform').submit();
	});

	//탈퇴
	$("#btn_del").click(function() {
		var pw = $("#mem_password").val();
		var repw = $("#mem_repassword").val();
		if (pw == "") {
			alert("비밀번호를 입력해주셔야 탈퇴신청이 완료됩니다.");
			document.getElementById('myinfoform').mem_password.focus();
			return;
		}
		if (repw == "") {
			alert("비밀번호를 입력해주셔야 탈퇴신청이 완료됩니다.");
			document.getElementById('myinfoform').mem_repassword.focus();
			return;
		}
		document.getElementById('myinfoform').action = "/funding/user/myinfo_del?mem_idx=${myinfo.mem_idx}";
		document.getElementById('myinfoform').submit();
	});

	
	
});


</script>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>



</body>
</html>