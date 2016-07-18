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

	String itemName = request.getParameter("itemName");
	int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
	double itemRate = Double.parseDouble(request.getParameter("itemRate"));
	
	System.out.println(itemName+"<--itemName");
	System.out.println(itemPrice+"<--itemPrice");
	System.out.println(itemRate+"<--itemRate");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?"+"useUnicode=true&characterEncoding=euckr";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;	
	PreparedStatement insertStmt = null;
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	System.out.println(conn+"<--conn");
	
	String addSql = "insert into item (item_name,item_price,item_rate) values (?,?,?)";
	
	insertStmt = conn.prepareStatement(addSql);

	insertStmt.setString(1, itemName);
	insertStmt.setInt(2, itemPrice);
	insertStmt.setDouble(3, itemRate);
	
	insertStmt.executeUpdate();
		
/* catch(Exception e){
		
		conn.rollback();
		e.printStackTrace();
		
	}finally{ */
		
		

%>
</body>
</html>