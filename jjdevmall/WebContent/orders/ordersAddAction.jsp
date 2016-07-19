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
	
	request.setCharacterEncoding("utf-8");

	int itemNo = Integer.parseInt(request.getParameter("itemNo"));
	int memberNo = (Integer)session.getAttribute("memberNo");
	int orderQuantity = Integer.parseInt(request.getParameter("orderQuantity"));
	double itemRate = Double.parseDouble(request.getParameter("itemRate"));
	
	System.out.println(itemNo+"<--itemNo");
	System.out.println(memberNo+"<--memberNo");
	System.out.println(orderQuantity+"<--orderQuantity");
	System.out.println(itemRate+"<--itemRate");
	
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?";
	String dbUser = "root";
	String dbPw = "java0000";
	Connection conn = null;
	PreparedStatement ordersStmt = null;
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, dbUser, dbPw);

	String ordersSql = "INSERT INTO orders(item_no, member_no, orders_quantity, orders_rate, orders_date)VALUES (?, ?, ?, ?, NOW())";
	ordersStmt = conn.prepareStatement(ordersSql);
	
	ordersStmt.setInt(1, itemNo);
	ordersStmt.setInt(2, memberNo);
	ordersStmt.setInt(3, orderQuantity);
	ordersStmt.setDouble(4, itemRate);
	
	ordersStmt.executeUpdate();
%>
	<script>
		alert("주문완료!");
		location.href = "<%= request.getContextPath()%>/index.jsp";
	</script>
<%	
%>
</body>
</html>