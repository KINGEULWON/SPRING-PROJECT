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
		})
	</script>
<meta charset="UTF-8">
<title>회원정보변경 완료</title>
</head>
<body>
	회원님의 정보가 정상적으로 변경되었습니다.
	<button class="cencle btn" type="button">다시 로그인하기</button>
</body>
</html>