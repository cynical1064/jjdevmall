<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	//값 변수에 담기
	request.setCharacterEncoding("utf-8");
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	String memberGender = request.getParameter("memberGender");
	int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	String memberAddr = request.getParameter("memberAddr");
	//값 확인
	System.out.println(memberId+"<--memberId");
	System.out.println(memberPw+"<--memberPw");
	System.out.println(memberName+"<--memberName");
	System.out.println(memberGender+"<--memberGender");
	System.out.println(memberAge+"<--memberAge");
	System.out.println(memberAddr+"<--memberAddr");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?"+"useUnicode=true&characterEncoding=euckr";
	String dbUser = "root";
	String dbPw = "java0000";
	
	Connection conn = null;
	PreparedStatement insertStmt = null;

	PreparedStatement addrInsertStmt = null;
	
	int chkRs = 0;
	ResultSet rs = null;
	try{		
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, dbUser, dbPw);
		conn.setAutoCommit(false);
		
		String insertMemberSql = "insert into member(member_id, member_pw, member_name, member_gender, member_age)values(?,?,?,?,?)";
		
		insertStmt = conn.prepareStatement(insertMemberSql, Statement.RETURN_GENERATED_KEYS);//입력 즉시 값을 받아옴
		
		insertStmt.setString(1, memberId);
		insertStmt.setString(2, memberPw);
		insertStmt.setString(3, memberName);
		insertStmt.setString(4, memberGender);
		insertStmt.setInt(5, memberAge);
		
		chkRs = insertStmt.executeUpdate();
		rs = insertStmt.getGeneratedKeys();
		int lastKey = 0;
		if(rs.next()){
			
			lastKey = rs.getInt(1);
			System.out.println(lastKey);
		}
		
		System.out.println(chkRs+"<--chkRs");
		
		if(chkRs > 0 ){
			
			String insertAddrSql = null;
			insertAddrSql = "insert into address(member_no, member_address) values (?,?)";
			addrInsertStmt = conn.prepareStatement(insertAddrSql);			
			addrInsertStmt.setInt(1, lastKey);
			addrInsertStmt.setString(2, memberAddr);
			
			addrInsertStmt.executeUpdate();
			
		}
		
		conn.commit();
		response.sendRedirect(request.getContextPath()+"/admin/member/memberListAll.jsp");
	}catch(Exception e){
		
		conn.rollback();
		e.printStackTrace();
	
	}finally{
		
		rs.close();
		addrInsertStmt.close();
		insertStmt.close();
		conn.close();
	}

%>
</body>
</html>