<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>인생은 점진적 과부하 - ToDoList</title>
<style>
	*{
		font-family: 'Noto Sans KR', sans-serif!important;
	}

	.gradient-custom {
		background-color: #091E7B;
	}
	
	.btncustom{
		background-color: #fd7e14!important;
		border-color: #fd7e14!important;
	}
	
	.btn-group-lg>.btn, .btn-lg {
		float: right;
    	margin: 5px;
	}
	
	
	ul>li>s, ul>li>p{
		width: 100%;
	}
	
	ul>li>p{
		margin: 0px auto;
	}
	
	.bi-x-octagon{
	    float: right;
	}
	
	.card{
		margin-top: 100px;
	}
	
	.logout{
		background-color: #dc3545!important;
		border-color: #dc3545!important;
	}	

	.ms-2{
		font-weight: bold!important;
	}
	
	.customfade{
		opacity: 0;
		fo
	}

</style>
<style>	
	@media (min-width: 767px) {
		.msg{
			display: none;
		}
	}
	
	@media (max-width: 767px) {
		.col-xl-10{
			display: none;
		}
		
		.msg{
			display: block;
			margin-top: 35%!important;
			margin-bottom: 25%;
			padding: 0 auto!important;
		}
		
		.msgspan{
			font-weight: bold;
			color: white;
			margin-left: 25%;
			font-size: 30px;
		}
		
		.h-100{
			width: 100%;
			margin-left: 10%;
		}
	}

	
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body style="background-color: #091E7B;">

<!-- <section class="vh-100 gradient-custom"> -->
<div>
<img class="logo" src="${pageContext.request.contextPath}/resources/logo.png" alt="" width="10%" height="80px" style="float: left;">
<button class="w-49 btn btn-lg btn-primary logout" type="button">회원탈퇴</button>
<button id="logoutbtn" class="w-49 btn btn-lg btn-primary btncustom" type="button">로그아웃</button>
</div>

  <div class="container py-5 h-100">
  	
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="msg">
      	<img class="logo" src="${pageContext.request.contextPath}/resources/logo.png" alt="">
      	<span class="msgspan">화면을 넓혀주세요!</span>
      </div>
      <div class="col col-xl-10">

        <div class="card">
          <div class="card-body p-5">

            <form class="d-flex justify-content-center align-items-center mb-4">
              <div class="form-outline flex-fill">
                <input type="text" id="form2" class="form-control" placeholder="과부하를 추가하세요!"/>
              </div>
              <button type="submit" class="btn btn-info ms-2">추가</button>
            </form>

            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-4 pb-2" id="ex1" role="tablist">
              <li class="nav-item" role="presentation">
                <a class="nav-link active" id="ex1-tab-1" data-mdb-toggle="tab" href="#ex1-tabs-1" role="tab"
                  aria-controls="ex1-tabs-1" aria-selected="true">전체</a>
              </li>
              <li class="nav-item" role="presentation">
                <a class="nav-link" id="ex1-tab-2" data-mdb-toggle="tab" href="#ex1-tabs-2" role="tab"
                  aria-controls="ex1-tabs-2" aria-selected="false">할일</a>
              </li>
              <li class="nav-item" role="presentation">
                <a class="nav-link" id="ex1-tab-3" data-mdb-toggle="tab" href="#ex1-tabs-3" role="tab"
                  aria-controls="ex1-tabs-3" aria-selected="false">완료</a>
              </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content" id="ex1-content">
            
              <div class="tab-pane fade show active" id="ex1-tabs-1" role="tabpanel"
                aria-labelledby="ex1-tab-1">
                <ul class="list-group mb-0" id="ex1ul">
                  <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." checked />
                    <p>아침 운동하기<i class="bi bi-x-octagon"></i></p>
                  </li>
                  <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." checked />
                    <p>스프링 강의 듣기<i class="bi bi-x-octagon"></i></p>
                  </li>
                  <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." />
                    <p>차량정기점검받으러가기<i class="bi bi-x-octagon"></i></p>
                  </li>
                  <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." />
                    <p>프로젝트 기능 구현하기<i class="bi bi-x-octagon"></i></p>
                  </li>
                  <li class="list-group-item d-flex align-items-center border-0 mb-0 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." />
                    <p>커피 주문하기<i class="bi bi-x-octagon"></i></p>
                  </li>
                </ul>
              </div>
              
              <div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                <ul class="list-group mb-0" id="ex2ul">
                  <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." />
                    <p>차량정기점검받으러가기<i class="bi bi-x-octagon"></i></p>
                  </li>
                  <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." />
                    <p>프로젝트 기능 구현하기<i class="bi bi-x-octagon"></i></p>
                  </li>
                  <li class="list-group-item d-flex align-items-center border-0 mb-0 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." />
                    <p>커피 주문하기<i class="bi bi-x-octagon"></i></p>
                  </li>
                </ul>
              </div>
              
              <div class="tab-pane fade" id="ex1-tabs-3" role="tabpanel" aria-labelledby="ex1-tab-3">
                <ul class="list-group mb-0" id="ex3ul">
                  <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." checked />
                    <p>아침 운동하기<i class="bi bi-x-octagon"></i></p>
                  </li>
                  <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." checked />
                    <p>스프링 강의 듣기<i class="bi bi-x-octagon"></i></p>
                  </li>
                </ul>
              </div>
              
            </div>
            <!-- Tabs content -->

          </div>
        </div>

      </div>
    </div>
  </div>
<!-- </section> -->

<script>
	$(document).ready(function () {
		$("input[type='checkbox']:checked").next("p").css("text-decoration", "line-through");
	});

	const all = $("#ex1-tab-1");
	const todo = $("#ex1-tab-2");
	const complete = $("#ex1-tab-3");
	
	all.on("click", function () {
		$(this).addClass("active");
		todo.removeClass("active");
		complete.removeClass("active");
		$("#ex1-tabs-1").addClass("show active");				
		$("#ex1-tabs-2").removeClass("show active");
		$("#ex1-tabs-3").removeClass("show active");
	});
	
	todo.on("click", function () {
		$(this).addClass("active");
		all.removeClass("active");
		complete.removeClass("active");
		$("#ex1-tabs-2").addClass("show active");	
		$("#ex1-tabs-1").removeClass("show active");
		$("#ex1-tabs-3").removeClass("show active");
	});
	
	complete.on("click", function () {
		$(this).addClass("active");
		all.removeClass("active");
		todo.removeClass("active");
		$("#ex1-tabs-3").addClass("show active");	
		$("#ex1-tabs-1").removeClass("show active");
		$("#ex1-tabs-2").removeClass("show active");
	});
	
	
	$("input[type='checkbox']").on("click", function () {
		if(	$(this).prop("checked") ){
			$(this).next("p").css("text-decoration", "line-through");
		} else {
			$(this).next("p").css("text-decoration", "none");
		}	
	});
	

	var member = "${member}" // 세션 확인용
	$("#logoutbtn").on("click", function () {
		/* alert(member); */ // 세션 확인용
		location.href = "${pageContext.request.contextPath}"+"/member/logout";
	});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>