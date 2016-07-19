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
			
			if($('#memberId').val()=='' || $('#memberPw').val() == ''){
				
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

	String loginMemberChk = (String)session.getAttribute("loginMemberChk");

%>

<%
if(loginMemberChk == null){
%>	
	<h2>회원 로그인</h2>
	<form action="<%= request.getContextPath() %>/member/memberLoginAction.jsp" method="post">
		<div>
			<label for="memberId">아이디 : </label>
			<input type="text" name="memberId" id="memberId"/>
		</div>
		<div>
			<label for="memberPw">비밀번호 : </label>
			<input type="password" name="memberPw" id="memberPw"/>
		</div>
		<div>
			<input type="button" id="loginBtn" value="로그인"/>
		</div>
	</form>
	<a href="<%= request.getContextPath()%>/admin/adminIndex.jsp">관리자 로그인</a>
	<div>
		<ul>
			<li><a href="<%= request.getContextPath()%>/member/item/itemList.jsp">상품 리스트</a></li>
		</ul>
	</div>
<%	
}else{
%>
	<span><%=loginMemberChk %>님 로그인</span>
	<a href="<%= request.getContextPath()%>/member/memberOne.jsp?memberId=<%=loginMemberChk %>">개인정보</a>
	<a href="<%= request.getContextPath()%>/member/memberLogoutAction.jsp">로그아웃</a>
	<div>
		<ul>
			<li><a href="<%= request.getContextPath()%>/member/item/itemList.jsp">상품 리스트</a></li>
		</ul>
	</div>
<%
}
%>
</body>
</html>