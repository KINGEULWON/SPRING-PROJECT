<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>아이디 찾기 결과</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){			
				location.href = "/";					    
			})	
			$("#registerBtn").on("click", function(){
				location.href="member/register";
			})
			
		})
	</script>
	<body>		
				<input type="button" value="TASKWITH" onClick="document.location.href='<c:url value="/"/>'">
				<button id="registerBtn" type="button">회원가입</button>
				<label>고객님의 아이디는 "${id}" 입니다.</label>
				<button class="cencle btn" type="button">로그인하러가기</button>
	</body>
</html>