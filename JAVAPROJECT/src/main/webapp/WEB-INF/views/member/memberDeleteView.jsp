<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원탈퇴</title>
	</head>
	<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){		
			location.href = "/";				    
		})
		$("#submit").on("click", function(){
			if($("#password").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
		$.ajax({
			url : "/member/pwChk",
			type : "POST",
			dataType : "json",
			data : $("#delForm").serializeArray(),
			success: function(data){					
		    	if(data==0){
					alert("비빌번호가 틀렸습니다.");
					return;
				}else{
				if(confirm("정말 회원탈퇴를 하시겠습니까?")){
					$("#delForm").submit();
					}					
				  }
				}
			})		
		});						
	})
	</script>
	<body>
		<section id="container">
			<form action="/member/memberDelete" method="post" id="delForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${member.id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="name">성명</label>
					<input class="form-control" type="text" id="name" name="name" value="${member.name}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="password">패스워드</label>
					<input class="form-control" type="password" id="password" name="password" />
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</section>		
	</body>
</html>