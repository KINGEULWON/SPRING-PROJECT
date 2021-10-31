<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
	<meta name="viewport" content="width=device-width">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
	<title>TASKWITH</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="member/register";
		})
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
	})
</script>
<body>
<%@ include file="../include/loginMenu.jsp" %>
<div class="container-fluid p-5 text-center">
     <div class="card login-form border-0">
           <div class="card-body">
           		<h1><img src="${pageContext.request.contextPath}/resources/images/center.png" 
				        style="height:100px;width:230px;"></h1><br><br>
	           <form name='homeForm' method="post" action="/member/login" class="form-signin">
				<c:if test="${member == null}">
					<label for="id"></label>
					<input type="text" id="id" name="id" placeholder="ID를 입력하세요" class="form-control my-3 login-text" style="margin:auto; width:300px;" autofocus>
					<label for="password"></label>
					<input type="password" id="password" name="password" placeholder="PW를 입력하세요" class="form-control mb-3 login-text" style="margin:auto; width:300px;">
				</c:if>
				<c:if test="${member != null }">
					<p>${member.id}</p>
					<button id="memberUpdateBtn" type="button">회원정보 변경</button>
					<button id="logoutBtn" type="button">로그아웃</button>
				</c:if>
				<div th:if="">
			  <c:if test="${msg == false}">
					<p class="error-message" th:text="">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			  </c:if>
			</div>
			<br>
			<a href="/member/findIdForm" style="margin-right:10px;">아이디 찾기</a>	<a href="/member/findPwForm" style="margin-left:10px;">비밀번호 찾기</a><br><br>
		
			<button class="btn" name="Submit" value="Login" type="submit" th:text="Login">로그인</button>
			<button id="registerBtn" type="button" class="btn" th:text="Regist" style="color:white;">회원가입</button>
			</form>
	       </div>
         </div>
       </div>
  </body>
</html>

 