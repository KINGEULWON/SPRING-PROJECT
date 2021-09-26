<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/reousrces/css/contentstyle.css"/>" rel="stylesheet" type="text/css">
</head>
<body>
<section>
<b>글내용 보기</b>
<br>
<form>
<table  class="contenttable">
	<tr>
		<th>글번호</th>
		<td>${article.num}</td>
		<th>조회수</th>
		<td>${article.readcount}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${article.uploader}</td>
		<th>작성일</th>
		<td>${article.regdate}</td>
	</tr>
	<tr>
		<th>글제목</th>
		<td colspan="3" class="contenttitle">${article.subject}</td>
	</tr>
	<tr>
		<th>글내용</th>
		<td colspan="3" class="content">
		<pre>${article.content}</pre></td>
	</tr>
	<tr>
		<th>파일</th>
		<td colspan="2" class="file"><a href="<c:url value="/board/download/${article.num}"/>">${article.filename}</a>
	</tr>
	<tr>
		<td colspan="1">
		<input type="button" value="목 록" onClick="document.location.href='<c:url value="/board/list?pageNum=${pageNum}"/>'">
			&nbsp;&nbsp;&nbsp;&nbsp;
	</tr>
</table>
</form>
</section>
</body>
</html>