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
	
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	
	
	String listSql = "select m.member_id, m.member_name, a.member_address from member m inner join address a on m.member_no = ?;";
	PreparedStatement pstmt = conn.prepareStatement(listSql);
	pstmt.setInt(1, memberNo);
	ResultSet rs = pstmt.executeQuery();
	
	System.out.println(rs.next());
	
%>	
<table>
<%
	while(rs.next()){
		
%>		
	<tr>
		<td><%=rs.getString("m.member_id") %></td>
		<td><%=rs.getString("m.member_name") %></td>
		<td><%=rs.getString("a.member_address") %></td>
	</tr>
<%		
	}
%>
</table>
</body>
</html>