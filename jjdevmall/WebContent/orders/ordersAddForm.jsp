<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String loginMemberChk = (String)session.getAttribute("loginMemberChk");
	if(loginMemberChk == null){

		response.sendRedirect(request.getContextPath()+"/index.jsp");
	
	}else{
		
		//주문폼
		
	}
%>
</body>
</html>