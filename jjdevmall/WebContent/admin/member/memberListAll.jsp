<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$('#loginBtn').click(function(){
			
			if($('#adminId').val()=='' || $('#adminPw').val() == ''){
				
				alert('아이디와 비번을 입력해주세요');
				
			}else{
				
				$('form').submit();
				
			}
			
		})
		
	});
/* 	$(document).ready(function(){
		
		$('.memberId').hover(function(){
			
			var hiddenIdx = $('.memberId').index(this);			
			$('.thisAddr').eq(hiddenIdx).css('display', 'block');
			
		}, function(){
			
			var hiddenIdx = $('.memberId').index(this);
			$('.thisAddr').eq(hiddenIdx).css('display', 'none');
			
		});
		
	}); */
</script> 
</head>
<body>

<%
	
	String loginChk = (String)session.getAttribute("loginChk");
	
%>
<%

	if(loginChk == null){

%>
	<form action="<%= request.getContextPath()%>/member/adminLoginAction.jsp" method="post">
		<div>
			<label for="adminId">아이디</label>
			<input type="text" name="adminId" id="adminId" />
		</div>
		<div>
			<label for="adminPw">비밀번호</label>
			<input type="password" name="adminPw" id="adminPw" />
		</div>
		<div>
			<input type="button" value="로그인" id="loginBtn" />
		</div>
	</form>
<%
}else{
%>

	<span><%=loginChk %>님 로그인</span><span><a href="<%= request.getContextPath()%>/member/adminLogoutAction.jsp">로그아웃</a></span>
	
	<ul>
		<li><a href="<%= request.getContextPath()%>/admin/item/itemList.jsp">상품관리</a></li>
		<li><a href="">주문관리</a></li>
		<li><a href="<%= request.getContextPath()%>/admin/member/memberListAll.jsp">회원관리</a></li>
	</ul>

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
		<!-- <th>주소</th> -->
		<th>삭제</th>
	</tr>
	
	<%	
	while(rs.next()){
	%>
	<tr>
		<td class="memberId"><a href="./memberAddr.jsp?memberNo=<%= rs.getInt("member_no")%>"><%= rs.getString("member_id") %></a></td>
		<td><%= rs.getString("member_pw") %></td>
		<td><%= rs.getString("member_name") %></td>
		<td><%= rs.getString("member_gender") %></td>
		<td><%= rs.getInt("member_age") %></td>
		<%-- <td class="thisAddr" style="display:none;"><%= rs.getInt("member_no")%></td> --%>
		<td><a href="./memberDeleteAction.jsp?memberNo=<%= rs.getInt("member_no")%>">강퇴</a></td>
	</tr>
	<%		
		}
	}
%>

</table>
</body>
</html>