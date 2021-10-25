<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원정보 변경</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){			
				location.href = "/";					    
			})	
			$("#memberDeleteBtn").on("click", function(){
				location.href="memberDeleteView";
			})				
			$("#submit").on("click", function(){
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
			});	
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/member/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${member.id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="name">이름</label>
					<input class="form-control" type="text" id="name" name="name" value="${member.name}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email" value="${member.email}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="password">패스워드</label>
					<input class="form-control" type="password" id="password" name="password" />
				</div>	
				<div class="form-group has-feedback">
					<button class="cencle btn btn-danger" type="button">취소</button>
					<button class="btn btn-success" type="submit" id="submit">변경내용 저장</button>
				    <button id="memberDeleteBtn" type="button">회원 탈퇴</button>
				</div>
			</form>
		</section>	
	</body>
</html>