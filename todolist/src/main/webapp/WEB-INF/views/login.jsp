<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>인생은 점진적 과부하 - 로그인</title>
<style>
   
   html, body {
     height: 100%;
   }
   
   body {
     display: flex;
     align-items: center;
     padding-top: 40px;
     padding-bottom: 40px;
     /*background-color: #0dcaf0!important;*/
     background-color: #091E7B!important;  
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
      
   .form-signin input[type="password"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
     border-radius: 10px;
   }
   
   .form-signin input[type="text"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
     border-radius: 10px;
   }
   
   .fw-normal {
    	text-align: center;
    }
    
    .w-49 {
    	width: 49%;
	}
	
	.mb-4{
		width: 100%;
    	height: auto;
    	border: 5px solid #ffc107;
    	border-radius: 15px;
	}
	
	.form-floating {
    	margin-bottom: 20px;
	}
	
	.btncustom{
		color: black!important;
    	background-color: #ffc107!important;
    	border-color: #ffc107!important;
    	font-weight: bold!important;
    	font-size: 25px!important;
	}
	
	.made {
		opacity: 0.3;
 		color: white!important;
	}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
   <main class="form-signin">
      <form id="loginform" action="${pageContext.request.contextPath}/member/login" method="post">
         <img class="mb-4" src="${pageContext.request.contextPath}/resources/logo.png" alt="" width="72" height="57">
         <h1 class="h3 mb-3" style="font-weight: bold; text-align: center; color: #ffb307;">주저하지말고 로그인!</h1>
         
         <div class="form-floating">
            <input name="id" type="text" class="form-control" id="id" placeholder="아이디 입력...">
            <label for="id">아이디</label>
         </div>
         <div class="form-floating">
            <input name="pwd" type="password" class="form-control" id="pwd" placeholder="Password">
            <label for="pwd">비밀번호</label>
         </div>
         
         <button class="w-49 btn btn-lg btn-primary btncustom" id="loginbtn" type="button">로그인</button>
         <button class="w-49 btn btn-lg btn-primary btncustom" id="joinbtn" type="button">회원가입</button>
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
		
		// 이미지 클릭시 메인으로 이동
		$("#joinbtn").on("click", function () {
			location.href = "${pageContext.request.contextPath}"+"/member/join";
		});
		
		$("#loginbtn").on("click", function () {
			if( $("#id").val().length == 0 || $("#pwd").val().length == 0){
				alert("아이디와 비밀번호를 입력해주세요.");
				return false;
			}
			
			$("#loginform").submit();
		});
		
	});
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>