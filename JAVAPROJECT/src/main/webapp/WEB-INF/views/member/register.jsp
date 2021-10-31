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
	<%@ include file="../include/loginMenu.jsp" %>
		<div class="container-fluid p-5 text-center">
     	  <div class="card login-form border-0">
           <div class="card-body">
					<form method="post" action="<c:url value="/member/register"/>">
					<table align="center">
						<tr>
							<td><label class="control-label" for="id">아이디</label></td>
							<td><input class="form-control" type="text" id="id" name="id" style="width:200px; height:30px;"/><br></td>
							<td><button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N" style="float: left;">중복확인</button></td>
						</tr>
						<tr>
						  <td><label class="control-label" for="password">비밀번호</label></td>
					  	  <td><input class="form-control" type="password" id="password" name="password" /><br></td>
						</tr>
						  <tr>
						   <td><label class="control-label" for="name">성명</label></td>
						   <td><input class="form-control" type="text" id="name" name="name" /><br></td>
						  </tr>
						<tr>
						   <td><label class="controll-label" for="email">이메일</label></td>
						   <td><input class="form-control" type="text" id="email" name="email"/></td>
						</tr>
					</table>
						<button class="btn" name="back" value="back" type="button" th:text="back" onClick="document.location.href='<c:url value="/"/>'">이전</button>
						<button id="submit" class="btn" name="Submit" value="회원가입" type="submit" th:text="register">회원가입</button>
					</div>
				</form>
			</div>
         </div>
       </div>	
	</body>
</html>