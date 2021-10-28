<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>아이디찾기</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){			
				location.href = "/";					    
			})			
		})
</script>
<body>
<form method="post" class="form-signin" action="/member/findId" name="findform">
<input type="button" value="TASKWITH" onClick="document.location.href='<c:url value="/"/>'">
		<div class="form-label-group">
			<label for="name">이름</label>
			<input type="text" id="name" name="name" class="form-control"/>
		</div>
		
		<div class="form-label-group">
			<label for="email">email</label>
			<input type="text" id="email" name="email" class="form-control"/>
		</div>

		<div class="form-label-group">
			<button class="cencle btn" type="button">이전</button>
			<input class="btn check" type="submit" value="아이디 찾기">
		</div>

		<c:if test="${check == 1}">
			<script>
				opener.document.findform.name.value = "";
				opener.document.findform.email.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>
		<c:if test="${check == 0 }">
		<div class="form-label-group">
				<input class="btn check"
					type="button" value="OK" onclick="closethewindow()">
			</div>
		</c:if>
	</form>
	<script type="text/javascript">
		function closethewindow(){
			self.close();
		}
	</script>
</body>
</html>