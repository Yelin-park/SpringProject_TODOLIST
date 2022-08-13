<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/todolist.css?after" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>인생은 점진적 과부하 - ToDoList</title>
</head>
<body style="background-color: #091E7B;">
  <div>
    <img class="logo" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="인생은 점진적 과부하 로고" width="10%" height="80px" style="float: left;">
	<button id="withdrawalbtn" class="w-49 btn btn-lg btn-primary logout" type="button">회원탈퇴</button>
	<button id="logoutbtn" class="w-49 btn btn-lg btn-primary btncustom" type="button">로그아웃</button>
  </div>

  <div class="container py-5 h-100">
  	
    <div class="row d-flex justify-content-center align-items-center h-100 mobile">
      <div class="col col-xl-10">

        <div class="card">
          <div class="card-body p-5">

            <form method="post" id="todolistform" action="${pageContext.request.contextPath }/todolist" class="d-flex justify-content-center align-items-center mb-4">
              <div class="form-outline flex-fill">
                <input type="text" name="todoname" id="form2" class="form-control" placeholder="할 일을 추가하세요!"/>
              </div>
              <button type="button" id="todolistbtn" class="btn btn-info ms-2">추가</button>
            </form>

            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-4 pb-2" id="ex1" role="tablist">
              <li class="nav-item" role="presentation">
                <a class="nav-link active" id="ex1-tab-1" data-mdb-toggle="tab" role="tab"
                  aria-controls="ex1-tabs-1" aria-selected="true">전체</a>
              </li>
              <li class="nav-item" role="presentation">
                <a class="nav-link" id="ex1-tab-2" data-mdb-toggle="tab" role="tab"
                  aria-controls="ex1-tabs-2" aria-selected="false">할일</a>
              </li>
              <li class="nav-item" role="presentation">
                <a class="nav-link" id="ex1-tab-3" data-mdb-toggle="tab" role="tab"
                  aria-controls="ex1-tabs-3" aria-selected="false">완료</a>
              </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content" id="ex1-content">
            
              <!-- 전체 목록 -->
              <div class="tab-pane fade show active" id="ex1-tabs-1" role="tabpanel"
                aria-labelledby="ex1-tab-1">
                <ul class="list-group mb-0" id="ex1ul">
                  <c:if test="${not empty todoList || not empty completedList }">
                  <c:forEach var="todoList" items="${todoList }">
                  	<li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="${todoList.todono}" aria-label="..."  />
                    <p>${ todoList.todoname }<i class="bi bi-x-octagon del" onclick="deltodolist(${todoList.todono})"></i></p>
                  </li>
                  </c:forEach>
                  
                  <c:forEach var="completedList" items="${completedList }">
                  	<li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="${completedList.todono}" aria-label="..." checked />
                    <p>${ completedList.todoname }<i class="bi bi-x-octagon del" onclick="deltodolist(${completedList.todono})"></i></p>
                  </li>
                  </c:forEach>  
                  </c:if>
                
                  <c:if test="${empty todoList && empty completedList }">
                  	등록된 할 일이 없습니다.
                  </c:if>
                </ul>
              </div>
              
              <!-- 할일 목록 -->
              <div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                <ul class="list-group mb-0" id="ex2ul">
                  <c:if test="${not empty todoList}">
                  <c:forEach var="todoList" items="${todoList }">
                  	<li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="${todoList.todono}" aria-label="..."  />
                    <p>${ todoList.todoname }<i class="bi bi-x-octagon del" onclick="deltodolist(${todoList.todono})"></i></p>
                  </li>
                  </c:forEach>
                  </c:if>
                  
                  <c:if test="${empty todoList }">
					등록된 할 일이 없습니다.
                  </c:if>
                </ul>
              </div>
              
              <!-- 완료 목록 -->
              <div class="tab-pane fade" id="ex1-tabs-3" role="tabpanel" aria-labelledby="ex1-tab-3">
                <ul class="list-group mb-0" id="ex3ul">
                  <c:if test="${not empty completedList }">
				  <c:forEach var="completedList" items="${completedList }">
                  	<li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                    style="background-color: #f4f6f7;">
                    <input class="form-check-input me-2" type="checkbox" value="${completedList.todono}" aria-label="..." checked />
                    <p>${ completedList.todoname }<i class="bi bi-x-octagon del" onclick="deltodolist(${completedList.todono})"></i></p>
                  </li>
                  </c:forEach>
                  </c:if>

                  <c:if test="${empty completedList }">
					완료한 일이 없습니다.
                  </c:if>
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
	
	
	$("#todolistbtn").on("click", function () {
		var todoname = $("input[name='todoname']").val();
		if(todoname == "" || todoname == null){
			alert("할 일을 입력해주세요!");
		} else{
			$("#todolistform").submit();			
		}
		
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
	
	// 체크박스 ajax 처리	
	$("input[type='checkbox']").on("click", function () {
			
		var flag = $(this).prop("checked");
		var todono = $(this).val();
			
		$.ajax({
			url : "/overload/update/todolist",
			type : "post",
			data : {
				"todono" : todono,
				"flag" : flag
			},
			cache : false,
			success : function(result) {
				if(result == 1){
					if (flag) {
						$(this).next("p").css("text-decoration", "line-through");
					} else {
						$(this).next("p").css("text-decoration", "none");
					}
						
					location.href = "${pageContext.request.contextPath}"+"/todolist";
				} else {
					alert("수정 실패");
				}
			} 
		}); // ajax
			
	});
	
	// 로그아웃
	$("#logoutbtn").on("click", function () {
		location.href = "${pageContext.request.contextPath}"+"/member/logout";
	});
	
	// 회원탈퇴
	$("#withdrawalbtn").on("click", function () {
		location.href = "${pageContext.request.contextPath}"+"/member/withdrawal";
	});
	
	// todolist 삭제
	function deltodolist(todono) {	
		$.ajax({
			url : "/overload/delete/todolist",
			type : "post",
			data : {
				todono : todono
			},
			cache : false,
			success : function(result) {
				if (result == 1) {
					location.href = "${pageContext.request.contextPath}"+"/todolist";
				} else {
					alert("삭제 실패");
				} 
			} 
		}); // ajax
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>