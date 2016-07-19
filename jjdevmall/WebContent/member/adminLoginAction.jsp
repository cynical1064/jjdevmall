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

	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	
	System.out.println(adminId+" <-- adminId");
	System.out.println(adminPw+" <-- adminPw");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
try{	
	
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	String sql = "select * from admin";
	
	String dbAdminId = null;
	String dbAdminPw = null;
	
	stmt = conn.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	while(rs.next()){
		
		dbAdminId = rs.getString("admin_id");
		dbAdminPw = rs.getString("admin_pw");
		
		System.out.println(dbAdminId+" <-- dbAdminId");
		System.out.println(dbAdminPw+" <-- dbAdminPw");
		if(dbAdminId.equals(adminId)){
			
			System.out.println("아이디 일치");
			
			if(dbAdminPw.equals(adminPw)){
				
				session.setAttribute("loginChk", dbAdminId);
				
				response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
				System.out.println("비번 일치");
				
			}else{
				
				System.out.println("비번 불일치");	
				
		%>
		<script>
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			location.href = "<%=request.getContextPath()%>/admin/adminIndex.jsp";
		</script>
		<%	
		
			}
			
		}else{
			
			System.out.println("아이디 불일치");
			%>
			
			<script>
				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				location.href = "<%=request.getContextPath()%>/admin/adminIndex.jsp";
			</script>
			
			<%				
			
		}			
		
	}
	
}catch(Exception e){
	
	
}finally{
	
	rs.close();
	stmt.close();
	conn.close();
	
}	
%>
</body>
</html>