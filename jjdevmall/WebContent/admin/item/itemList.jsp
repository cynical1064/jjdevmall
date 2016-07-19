<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td{border:1px solid #ccc; border-collapse: collapse;}
</style>
</head>
<body>
<table>
	<tr>
		<th>품명</th>
		<th>가격</th>
		<th>할인율</th>
	</tr>
<% 

	Connection conn = null;	
	PreparedStatement listStmt = null;	
	ResultSet listRs = null;
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	String listSql = "select * from item";
	listStmt = conn.prepareStatement(listSql);
	listRs = listStmt.executeQuery();
	
	while(listRs.next()){
%>	
	<tr>
		<td><%= listRs.getString("item_name") %></td>
		<td><%= listRs.getInt("item_price") %></td>
		<td><%= listRs.getDouble("item_rate") %></td>
	</tr>	
<%		
	}
	
%>
</table>
</body>
</html>