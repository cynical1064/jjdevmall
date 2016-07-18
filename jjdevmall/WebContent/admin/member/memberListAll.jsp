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

	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?"+"useUnicode=true&characterEncoding=euckr";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;	
	PreparedStatement insertStmt = null;
	
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	
	
	String listSql = "select * from member";
	PreparedStatement pstmt = conn.prepareStatement(listSql);
	
	ResultSet rs = pstmt.executeQuery();
%>
<table>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>성별</th>
		<th>나이</th>
	</tr>
<%	
	while(rs.next()){
%>
	<tr>
		<td><a href="./memberAddr.jsp?memberNo=<%= rs.getInt("member_no")%>"><%= rs.getString("member_id") %></a></td>
		<td><%= rs.getString("member_pw") %></td>
		<td><%= rs.getString("member_name") %></td>
		<td><%= rs.getString("member_gender") %></td>
		<td><%= rs.getInt("member_age") %></td>
	</tr>
<%		
	}
%>
</table>
</body>
</html>