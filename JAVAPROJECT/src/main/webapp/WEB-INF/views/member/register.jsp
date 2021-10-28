<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>메인</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
			});		
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"id" : $("#id").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	<body>
		<section id="container">
			<form method="post" action="<c:url value="/member/register"/>">
			<input type="button" value="TASKWITH" onClick="document.location.href='<c:url value="/"/>'">
				<div>
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" /><button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div>
					<label class="control-label" for="password">비밀번호</label>
					<input class="form-control" type="password" id="password" name="password" />
				</div>
				<div>
					<label class="control-label" for="name">성명</label>
					<input class="form-control" type="text" id="name" name="name" />
				</div>
				<div>
					<label class="controll-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email"/>
				</div>
				<div>
					<input type="button" value="이전" onClick="document.location.href='<c:url value="/"/>'">
					<button class="btn-success" type="submit" id="submit">회원가입</button>			
				</div>
			</form>
		</section>		
	</body>
</html>