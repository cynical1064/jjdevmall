<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$('#loginBtn').click(function(){
			
			if($('#adminId').val()=='' || $('#adminPw').val() == ''){
				
				alert('아이디와 비번을 입력해주세요');
				
			}else{
				
				$('form').submit();
				
			}
			
		})
		
	});
</script>
</head>
<body>
<%
	
	String loginChk = (String)session.getAttribute("loginChk");
	
%>
<%

if(loginChk == null){

%>
<h2>관리자 로그인</h2>
<form action="<%= request.getContextPath()%>/member/adminLoginAction.jsp" method="post">
	<div>
		<label for="adminId">아이디</label>
		<input type="text" name="adminId" id="adminId" />
	</div>
	<div>
		<label for="adminPw">비밀번호</label>
		<input type="password" name="adminPw" id="adminPw" />
	</div>
	<div>
		<input type="button" value="로그인" id="loginBtn" />
	</div>
</form>
<%
}else{
%>

	<span><%=loginChk %>님 로그인</span><span><a href="<%= request.getContextPath()%>/member/adminLogoutAction.jsp">로그아웃</a></span>
	
	<ul>
		<li><a href="<%= request.getContextPath()%>/admin/item/itemList.jsp">상품관리</a></li>
		<li><a href="">주문관리</a></li>
		<li><a href="<%= request.getContextPath()%>/admin/member/memberListAll.jsp">회원관리</a></li>
	</ul>
<%
}
%>
</body>
</html>