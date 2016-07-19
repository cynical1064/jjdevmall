<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	request.setCharacterEncoding("utf-8");	

	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	
	System.out.println(memberId+"<--memberId");
	System.out.println(memberPw+"<--memberPw");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;
	PreparedStatement loginStmt = null;
	ResultSet loginRs = null;
	
	try{
		
		Class.forName(driver);
		
		conn = DriverManager.getConnection(url, dbUser, dbPw);
		
		String loginSql = "select * from member where member_id =?  and member_pw = ?";
		
		loginStmt = conn.prepareStatement(loginSql);
		loginStmt.setString(1, memberId);
		loginStmt.setString(2, memberPw);
		
		loginRs = loginStmt.executeQuery();
		
		if(loginRs.next()){
			
			String chkMemberId = loginRs.getString("member_id");
			System.out.println("로그인 성공");
			session.setAttribute("loginMemberChk", chkMemberId);
			
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			
		}else{
			
			System.out.println("로그인 실패");
%>
		<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		location.href = "<%=request.getContextPath()%>/index.jsp";
		</script>
<%			
			
		}
		
	}catch(Exception e){
		
		conn.rollback();
		e.printStackTrace();
		
	}finally{
		
		
	}
%>
</body>
</html>