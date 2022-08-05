<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Hello! 인생은 점진적 과부하!</title>
<style>
	*{
		font-family: 'Noto Sans KR', sans-serif!important;
	}
   
   html, body {
     height: 100%;
   }
   
   body {
     display: flex;
     align-items: center;
     padding-top: 40px;
     padding-bottom: 40px;
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
    	width: 100%;
    	height: 100px;
	}
	
	.mb-4{
		width: 100%;
    	height: auto;
	}
	
	.form-floating {
    	margin-bottom: 20px;
	}
	
	.btncustom{
		color: black!important;
    	/* background-color: #ffc107!important;
    	border-color: #ffc107!important; */
    	background-color: #f0ff94!important;
    	border-color: #f0ff94!important;
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
      <form action="login.jsp" method="post">
         <img class="mb-4" src="${pageContext.request.contextPath}/resources/logo.png" alt="" width="72" height="57">
         <button class="w-49 btn btn-lg btn-primary btncustom" id="start" type="button">인생은 점진적 과부하 시작하기</button>
         <p class="mt-5 mb-3 made">Made By Yaliny</p>
      </form>
   </main>

<script>
	$("#start").on("click", function () {
		location.href = "${pageContext.request.contextPath}"+"/member/login";
	});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>