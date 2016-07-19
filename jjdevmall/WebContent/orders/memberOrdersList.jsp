<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td{border:1px solid #ccc; border-collapse: collapse;}
</style>
</head>
<body>
<%

	String loginMemberChk =request.getParameter("loginMemberChk");
	System.out.println(loginMemberChk+"<--loginMemberChk");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;	
	PreparedStatement insertStmt = null;
	
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	
	String listSql = "select m.member_no, m.member_id, m.member_name, i.item_name, i.item_price, i.item_rate, o.orders_quantity, o.orders_date, o.orders_state from orders o join item i join member m on o.member_no = m.member_no and o.item_no = i.item_no";
	PreparedStatement pstmt = conn.prepareStatement(listSql);

	ResultSet rs = pstmt.executeQuery();
	
	System.out.println(rs.next());
	System.out.println(rs.getInt("m.member_no")+"<--member_no");
	
%>	
<table>
	<tr>
		<th>주문자</th>
		<th>상품명</th>
		<th>정가</th>
		<th>할인율</th>
		<th>수량</th>
		<th>최종가격</th>
		<th>주문상태</th>
	</tr>
	<%do{
		if(rs.getString("m.member_id").equals(loginMemberChk)){
	%>
		<tr>
			<td><%=rs.getString("m.member_name") %></td>
			<td><%=rs.getString("i.item_name") %></td>
			<td><%=rs.getInt("i.item_price") %></td>
			<td><%=rs.getDouble("i.item_rate")*100+"%" %></td>
			<td><%=rs.getInt("o.orders_quantity") %></td>
			<td><%=(rs.getInt("i.item_price")*(1-rs.getDouble("i.item_rate")))*rs.getInt("o.orders_quantity") %></td>
			<td><%=rs.getString("o.orders_state") %></td>
		</tr>
	<%
		}
	}while(rs.next());
	%>
</table>
</body>
</html>