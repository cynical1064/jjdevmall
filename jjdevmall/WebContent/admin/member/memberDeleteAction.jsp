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
	String url = "jdbc:mysql://localhost:3306/jjdevmall?"+"useUnicode=true&characterEncoding=euckr";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;	
	PreparedStatement insertStmt = null;
	
	try{
		
		Class.forName(driver);
		
		conn = DriverManager.getConnection(url, dbUser, dbPw);
		
		String delAddressSql = "delete from address where member_no = ?";
		String delMemberSql = "delete from address where member_no = ?";
		PreparedStatement delAddressPstmt = conn.prepareStatement(delAddressSql);
		PreparedStatement delMemberPstmt = conn.prepareStatement(delMemberSql);
		
		int delChk1 = delAddressPstmt.executeUpdate();
		int delChk2 = delMemberPstmt.executeUpdate();
	
		System.out.println(delChk1+"<--delChk1");
		System.out.println(delChk2+"<--delChk2");
	}catch(Exception e){
		
		
	}finally{
		
		
	}
%>
</body>
</html>