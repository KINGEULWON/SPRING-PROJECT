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
			$("#logoutBtn").on("click", function(){
			location.href="logout";
			})
			$("#memberDeleteBtn").on("click", function(){
				location.href="memberDeleteView";
			})				
			$("#submit").on("click", function(){
				if($("#pw").val() !== $("#pw2").val()){
					alert("새 비밀번호가 서로 다릅니다.");
					$("#pw").val("").focus();
					$("#pw2").val("");
					return false;
				}else if($("#password").val()==""){
					alert("기존 비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}else if($("#pw").val()==""){
					alert("새 비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}else if($("#pw2").val()==""){
					alert("새 비밀번호를 입력해주세요.");
					$("#pw2").focus();
					return false;
				}else if($.trim($("#pw").val()) !== $("#pw").val()){
					alert("공백은 입력이 불가능합니다.");
					return false;
				}
				$.ajax({
					url : "/member/pwChk",
					type : "POST",
					dataType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){			
						if(data==0){
							alert("기존 비밀번호가 틀렸습니다.");
							return;
						}else{
							if(confirm("회원 정보를 수정 하시겠습니까?")){
								$("#updateForm").submit();
							}					
						}
					}
				})		
			});	
		})
	</script>
	<body>
		<section id="container">
			<form action="/member/memberUpdate" method="post" id="updateForm">
				<input type="button" value="TASKWITH" onClick="document.location.href='<c:url value="/"/>'">
				<button id="logoutBtn" type="button">로그아웃</button>
				<div class="form-group">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${member.id}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label class="control-label" for="name">이름</label>
					<input class="form-control" type="text" id="name" name="name" value="${member.name}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email" value="${member.email}" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label class="control-label" for="password">이전 비밀번호</label>
					<input class="form-control" type="password" id="password" name="password" />
				</div>	
				<div class="form-group">
					<label class="control-label" for="pw">새 비밀번호</label>
					<input class="form-control" type="password" id="pw" name="pw" />
				</div>
				<div class="form-group">
					<label class="control-label" for="pw2">새 비밀번호 확인</label>
					<input class="form-control" type="password" id="pw2" name="pw2" />
				</div>			
			</form>
				<div class="form-group has">
					<button class="cencle btn" type="button">취소</button>
					<button id="memberDeleteBtn" type="button">회원 탈퇴</button>
					<button class="btn-success" type="button" id="submit">변경내용 저장</button>
				</div>
		</section>	
	</body>
</html>