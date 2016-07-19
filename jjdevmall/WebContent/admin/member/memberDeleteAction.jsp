<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	System.out.println(memberNo+"<--memberNo");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;	
		
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	
	String delAddressSql = "delete from address where member_no = ?";
	String delMemberSql = "delete from member where member_no = ?";
	
	PreparedStatement delAddressPstmt = conn.prepareStatement(delAddressSql);
	delAddressPstmt.setInt(1, memberNo);
	PreparedStatement delMemberPstmt = conn.prepareStatement(delMemberSql);
	delMemberPstmt.setInt(1, memberNo);
	
	delAddressPstmt.executeUpdate();
	delMemberPstmt.executeUpdate();
	
	response.sendRedirect(request.getContextPath()+"/admin/member/memberListAll.jsp");

%>
</body>
</html>