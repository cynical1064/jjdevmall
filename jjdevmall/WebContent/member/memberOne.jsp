<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th></th>
	</tr>
<%

	request.setCharacterEncoding("utf-8");
	String memberId = request.getParameter("memberId");

	System.out.println(memberId);
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;
	PreparedStatement oneStmt = null;
	ResultSet loginRs = null;
	
	try{
		
		Class.forName(driver);
		
		conn = DriverManager.getConnection(url, dbUser, dbPw);
		
		String oneSql = "select * from member where member_id =?";
		oneStmt = conn.prepareStatement(oneSql);
		oneStmt.setString(1, memberId);
		loginRs = oneStmt.executeQuery();
		
		if(loginRs.next()){
%>			
			<tr>
				<td><%= loginRs.getString("member_id") %></td>
				<td><%= loginRs.getString("member_pw") %></td>
				<td><%= loginRs.getString("member_name") %></td>
				<td><%= loginRs.getString("member_gender") %></td>
				<td><%= loginRs.getInt("member_age") %></td>
			</tr>
<%			
		}
			
		
	}catch(Exception e){
		
		conn.rollback();
		e.printStackTrace();
		
	}finally{
		
		
	}
%>
</table>
</body>
</html>