<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="${pageContext.request.contextPath}/resources/css/withdrawal.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>인생은 점진적 과부하 - 회원탈퇴</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
   <main class="form-signin">
      <form id="withdrawalform" action="${pageContext.request.contextPath}/member/withdrawal" method="post">
         <img class="mb-4" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="인생은 점진적 과부하 로고" width="72" height="57">
         <h1 class="h3 mb-3" style="font-weight: bold; text-align: center; color: #f0ff94;">점진적 과부하를 떠나시게요?</h1>
         
         <div class="form-floating">
            <input name="id" type="text" class="form-control" id="id" placeholder="아이디 입력...">
            <label for="id">탈퇴할 회원의 아이디</label>
         </div>
         <div class="form-floating">
            <input name="pwd" type="password" class="form-control" id="pwd" placeholder="Password">
            <label for="pwd">탈퇴할 회원의 비밀번호</label>
         </div>
         
         <button class="w-49 btn btn-lg btn-primary btncustom" id="homebtn" type="button">Home</button>
         <button class="w-49 btn btn-lg btn-primary btncustom" id="withdrawalbtn" type="button">회원탈퇴</button>
         <p class="mt-5 mb-3 made">Made By Yaliny</p>
      </form>
   </main>
   
<script>
	$(document).ready(function() {
		var msg = "${msg}";
		if(msg == "pwdmiss"){
			alert("비밀번호를 확인해 주세요.");
		} else if(msg == "idmiss"){
			alert("아이디를 확인해 주세요.");
		}
		
		$("#homebtn").on("click", function () {
			location.href = "${pageContext.request.contextPath}"+"/";
		});
		
		$("#withdrawalbtn").on("click", function () {
			if( $("#id").val().length == 0 || $("#pwd").val().length == 0){
				alert("아이디와 비밀번호를 입력해주세요.");
				return false;
			}
			
			$("#withdrawalform").submit();
		});
		
	});
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>