<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
</head>
<body>
	<section>
		<b>제라툴</b>
			<table class="joinmemberbutton">
	<tr>
		<td>
			<a href="<c:url value="/joinMemberForm.do"/>">글쓰기</a>
		</td>
	</tr>
</table>
</section>
</body>
</html>