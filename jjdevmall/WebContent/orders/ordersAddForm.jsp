<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		var itemPrice = $('input[name="itemRatedPrice"]').val();
		var itemQuantity = $('#orderQuantity').val();
		
		$('#totalPrice').text(itemPrice * itemQuantity);
		
		$('#orderQuantity').click(function(){
			
			itemQuantity = $('#orderQuantity').val();
			
			$('#totalPrice').text(itemPrice * itemQuantity);
		
		});
		
		$('#totalOrder').click(function(){
			
			$('form').submit();
			
		});
		
	});
</script>
<style>
	input{border:0;}
</style>
</head>
<body>
<table>
	<tr>
		<th>상품ID</th>
		<th>상품명</th>
		<th>구매자ID</th>
		<th>상품가격</th>
		<th>상품할인율</th>
		<th>할인된 가격</th>
		<th>수량</th>
		<th>최종가격</th>
	</tr>
<%

	request.setCharacterEncoding("utf-8");
	
	String loginMemberChk = (String)session.getAttribute("loginMemberChk");
	
	int itemNo = Integer.parseInt(request.getParameter("itemNo"));
	
	System.out.println(loginMemberChk+"<--loginMemberChk");
	System.out.println(itemNo+"<--itemNo");
	
	if(loginMemberChk == null){

		response.sendRedirect(request.getContextPath()+"/index.jsp");
	
	}else{

		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jjdevmall?"+"useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPw = "java0000";
		
		Connection conn = null;
		PreparedStatement itemStmt = null;
		ResultSet itemRs = null;
		
		try{
			
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, dbUser, dbPw);
			
			String itemSql = "select * from item where item_no = ?";
			
			itemStmt = conn.prepareStatement(itemSql);
			itemStmt.setInt(1, itemNo);
			itemRs = itemStmt.executeQuery();
			
			System.out.println(itemRs.next());
			
			String itemName = itemRs.getString("item_name");
			int itemPrice = itemRs.getInt("item_price");
			double itemRate = itemRs.getDouble("item_rate");
			
			System.out.println(itemName+"<--itemName");
			System.out.println(itemPrice+"<--itemPrice");
			System.out.println(itemRate+"<--itemRate");
			
%>

<tr>
	<form action="<%=request.getContextPath()%>/orders/ordersAddAction.jsp" method="post">
		<td><input type="text" name="itemNo" value="<%= itemNo %>" readonly /></td>
		<td><input type="text" name="itemName" value="<%= itemName %>" readonly /></td>
		<td><input type="text" name="memberId" value="<%= loginMemberChk %>" readonly /></td>
		<td><input type="text" name="itemPrice" value="<%= itemPrice %>" readonly /></td>
		<td><input type="text" name="itemRate" value="<%= itemRate %>" readonly /></td>
		<td><input type="text" name="itemRatedPrice" value="<%= itemPrice*(1-itemRate) %>" readonly /></td>
		<td>
			<select id="orderQuantity" name="orderQuantity">
				<option value="1">1개</option>
				<option value="2">2개</option>
				<option value="3">3개</option>
				<option value="4">4개</option>
				<option value="5">5개</option>
			</select>
		</td>
		<td id="totalPrice">
		
		</td>
	</form>	
</tr>
	
<%		
		
		}catch(Exception e){

			conn.rollback();
			e.printStackTrace();
			
		}finally{
			
			itemRs.close();
			itemStmt.close();
			conn.close();
			
		}
		
	}
%>
</table>
<div>
<input type="button" id="totalOrder" value="최종구매"/>		
			<a href="<%= request.getContextPath() %>/member/item/itemList.jsp"><input type="button" id="cancelOrder" value="결제취소"/></a>
</div>
</body>
</html>