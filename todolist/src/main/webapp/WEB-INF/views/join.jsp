<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>인생은 점진적 과부하 - 회원가입</title>
<style>  
   body {
     display: flex;
     align-items: center;
     padding-bottom: 40px;
   }
   
   .form-signin {
     width: 100%;
     max-width: 600px;
     padding: 15px;
     margin: auto;
   }
   
   .form-signin .checkbox {
     font-weight: 400;
   }
   
   .form-signin .form-floating:focus-within {
     z-index: 2;
   }
   
   .form-signin input[type="email"] {
     margin-bottom: -1px;
     border-bottom-right-radius: 0;
     border-bottom-left-radius: 0;
   }
   
   .form-signin input[type="password"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
   }
   
   .fw-normal {
    	text-align: center;
    }
    
    .w-49 {
    	width: 49%;
	}
	
	.mb-4 {
   		width: 50%;
    	height: 230px;
    	display: block;
    	margin: 0px auto;
	}
	
	.col-lg-2{
		margin: 10px auto;
	}
	
	.form-group{
		margin-left: 15%;
	}
	
	.col-lg-offset-2{
		margin-top: 30px;
	}
	
	.btn-primary{
		width: 100%;
		background-color: #ffc107!important;
		border-color: #ffc107!important;
		color: black!important;
	}
	
	.btncustomer{
		font-weight: bold!important;
    	font-size: 25px!important;
	}
	
	label {
    	font-size: 18px;
    	font-weight: bold;
    	color: white;
	}
	
	.gomain, .gomain:hover {
		cursor: pointer;
	}
	
	.form-horizontal{
		width: 80%;
    	margin: 0px auto;
	}
	
	.idclass{
		width: 78%!important;
	}
	
	.idcheck{
		width: 20%;
    	float: right;
    	margin-top: -38px;
    	font-weight: bold!important;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body style="background-color:#091E7B">
	<div class="container"><!-- 좌우측의 공간 확보 -->
	    <img class="mb-4 gomain" id="gomain" src="${pageContext.request.contextPath}/resources/logo.png" alt="">
	    <hr style="height: 3px; color: #ffc107; opacity: 0.6;"/>
	    <!-- 본문 들어가는 부분 -->             
	    <form id="joinform" class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath }/member/join">
	        <div class="form-group" id="divId">
	        	<label for="inputId" class="col-lg-2 control-label">아이디</label>
	        	<span id="msg_id_check"></span>
	            <div class="col-lg-10">
	            	<input name="id" type="text" class="form-control onlyAlphabetAndNumber idclass" id="id" data-rule-required="true" placeholder="15자 이내의 알파벳 , 숫자만 입력 가능합니다." maxlength="15">
	            	<button type="button" class="btn btn-primary idcheck" id="idCheck">중복검사</button>
	            </div>
	        </div>
	        <div class="form-group" id="divPassword">
	            <label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
	            <div class="col-lg-10">
	                <input type="password" class="form-control" id="pwd" name="pwd" data-rule-required="true" placeholder="비밀번호" maxlength="30">
	            </div>
	        </div>
	        
 	        <div class="form-group" id="divPasswordCheck">
	            <label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호 확인</label>
	            <span id="msg_pwd_check"></span>
	            <div class="col-lg-10">
	                <input type="password" class="form-control" id="pwd_check" data-rule-required="true" placeholder="비밀번호 확인" maxlength="30">
	            </div>
	        </div> 
	        <div class="form-group" id="divName">
	            <label for="inputName" class="col-lg-2 control-label">이름</label>
	            <div class="col-lg-10">
	                <input name="name" type="text" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="이름을 입력해주세요." maxlength="15">
	            </div>
	        </div>
	        
	        <div class="form-group" id="divBirth">
	            <label for="inputName" class="col-lg-2 control-label">생년월일</label>
	            <div class="col-lg-10">
	                <input name="birth" type="date" class="form-control" id="birth" data-rule-required="true" placeholder="ex)2022-07-29" maxlength="10">
	            </div>
	        </div>
	            
	        <div class="form-group" id="divEmail">
	            <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
	            <div class="col-lg-10">
	                <input name="email" type="text" class="form-control" id="email" data-rule-required="true" placeholder="ex)email@naver.com" maxlength="40">
	            </div>
	        </div>
	        <div class="form-group" id="divPhoneNumber">
	            <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
	            <div class="col-lg-10">
	                <input name="tel" type="text" class="form-control onlyNumber" id="tel" data-rule-required="true" placeholder="ex)010-1234-1234" maxlength="13">
	            </div>
	        </div>
	        <div class="form-group">
	        	<label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
	            <div class="col-lg-10">
	            	<select name="gender" class="form-control" id="gender">
	            		<option value="남">남</option>
	            		<option value="여">여</option>
	            	</select>
	            </div>
	        </div>   
	        
	        <div class="form-group">
	            <div class="col-lg-offset-2 col-lg-10">
	                <button id="gojoin" type="button" class="btn btn-primary btncustomer">회원가입</button>
	            </div>
	        </div>
	        
	    </form>
	</div>

<script>
	var pwdCheckcnt = 0; // 비밀번호 일치 여부
	
	// 이미지 클릭시 메인으로 이동
	$("#gomain").on("click", function () {
		location.href = "${pageContext.request.contextPath }/";
	});
	
	// 아이디 중복검사
	$("#idCheck").on("click", function () {
		let id = $("#id").val();
		
		$.ajax({
				url : "/overload/member/idCheck",
				type : "post",
				data : {
					id : id
				},
				cache : false,
				success : function(result) {
					if (result == 1) {
						$('#msg_id_check').text('중복된 아이디 입니다.').css("color","red").css("font-weight", "bold");
					} else {
						$('#msg_id_check').text('사용할 수 있는 아이디 입니다.').css("color","green").css("font-weight", "bold");
					} 
				} 
			}); // ajax

	});
	
	// 비밀번호 일치여부 확인
	$("#pwd, #pwd_check").on("keyup", function(){
    	if($('#pwd').val() != '' && $('#pwd_check').val() != '' && $('#pwd').val() == $('#pwd_check').val() ){
    		$('#msg_pwd_check').text('비밀번호가 일치합니다.').css("color","green").css("font-weight", "bold");
    		pwdCheckcnt = pwdCheckcnt + 1;
    	} else if($('#pwd').val() != '' && $('#pwd_check').val() != '' && $('#pwd').val() != $('#pwd_check').val() ){
    		$('#msg_pwd_check').text('비밀번호가 일치하지 않습니다.').css("color","red").css("font-weight", "bold");
    		pwdCheckcnt = 0;
    	}
	});
	
	// 회원가입 form 전송 전에 체크 작업
	$("#gojoin").on("click", function () {		
		// 정규표현식
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var regTel = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
		var regId = /^[a-zA-Z0-9]{5,15}$/;
		var regPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/;

		if( $("#id").val() == "" || $("#pwd").val() == "" || $("#name").val() == "" || $("#birth").val() == "" ||
			$("#email").val() == "" || $("#tel").val() == "" || $("#gender").val() == ""
		) {
			alert("입력하지 않은 사항이 있습니다.");
			return false;
		}
		
		// 아이디 유효성 검사
		if($("#id").val().match(regId) == null){
			alert("아이디는 알파벳과 숫자 조합으로 최소 5자~최대 12자까지 가능합니다.");
			return false;
		}
		
		// 비밀번호 유효성 검사
		if($("#pwd").val().match(regPwd) == null){
			alert("비밀번호는 6자 이상 20자 이하 숫자, 대문자, 소문자, 특수문자를 포함하여야 합니다.");
			return false;
		}
		
		// 이메일 유효성 검사
		if($("#email").val().match(regEmail) == null){
			alert("이메일 입력 양식을 확인해주세요.");
			return false;
		}
		
		// 휴대폰 번호 유효성 검사
		if($("#tel").val().match(regTel) == null){
			alert("휴대폰 번호 입력 양식을 확인해주세요.");
			return false;
		}
		
		// 아이디 중복검사 여부
		if( $("#msg_id_check").text() == '중복된 아이디 입니다.' || $("#msg_id_check").text() == ''){
			alert("아이디 중복검사를 확인해 주세요.");
			return false;
		}
		
		// 비밀번호 일치 여부
		if(pwdCheckcnt == 0){
			alert("비밀번호가 일치한지 확인해 주세요.");
			return false;
		}
		
		// 모든 if문을 pass 했다면 회원가입 완료!
		alert("인생은 점진적 과부하에 회원가입이 완료되었습니다!");
		$("#joinform").submit();
				  
	});
	


	/*
	// form 전송시 체크
	function joinFormCheck() {
		// 정규표현식
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var regTel = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
		var regId = /^[a-zA-Z0-9]{6,15}$/;
		var regPwd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/;

		if( $("#id").val() == "" || $("#pwd").val() == "" || $("#name").val() == "" || $("#birth").val() == "" ||
			$("#email").val() == "" || $("#tel").val() == "" || $("#gender").val() == ""
		) {
			alert("입력하지 않은 사항이 있습니다.");
			return false;
		}
		
		// 아이디 유효성 검사
		if($("#id").val().match(regId) == null){
			alert("아이디는 알파벳과 숫자 조합으로 최소 6자~최대 12자까지 가능합니다.");
			return false;
		}
		
		// 비밀번호 유효성 검사
		if($("#pwd").val().match(regPwd) == null){
			alert("비밀번호는 6자 이상 20자 이하 숫자, 대문자, 소문자, 특수문자를 포함하여야 합니다.");
			return false;
		}
		
		// 이메일 유효성 검사
		if($("#email").val().match(regEmail) == null){
			alert("이메일 입력 양식을 확인해주세요.");
			return false;
		}
		
		// 휴대폰 번호 유효성 검사
		if($("#tel").val().match(regTel) == null){
			alert("휴대폰 번호 입력 양식을 확인해주세요.");
			return false;
		}
		
		// 아이디 중복검사 여부
		if(idCheckcnt == 0){
			alert("아이디 중복검사를 해주세요.");
			return false;
		}
		
		return true;
	}
	*/
		

	
	/*
	// 아이디 중복 검사 함수
	function idCheck() {
		let id = $("#id").val()
		$.ajax({
				url : "/overload/member/idCheck",
				type : "post",
				data : {
					id : id
				},
				cache : false,
				success : function(result) {
					if (result == 1) {
						$('#msg_id_check').text('중복된 아이디 입니다.').css("color","red").css("font-weight", "bold");
						idCheckcnt = idCheckcnt + 1;
					} else {
						$('#msg_id_check').text('사용할 수 있는 아이디 입니다.').css("color","green").css("font-weight", "bold");
						idCheckcnt = 0;
					}
				}
			});
	} // idCheck
	*/
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>