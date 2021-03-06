<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>TASKWITH</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<input type="button" value="TASKWITH" onClick="document.location.href='<c:url value="/"/>'">
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
	<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="id"></label>
				<input type="text" id="id" name="id">
			</div>
			<div>
				<label for="password"></label>
				<input type="password" id="password" name="password">
			</div>
			<div>
				아이디를 잊으셨나요?<a href="/member/findIdForm">아이디 찾기</a><br>
				비밀번호를 잊으셨나요?<a href="/member/findPw">비밀번호 찾기</a>
			</div>
			<div>
				<button type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.id}</p>
				<button id="memberUpdateBtn" type="button">회원정보 변경</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
</body>
</html>

 