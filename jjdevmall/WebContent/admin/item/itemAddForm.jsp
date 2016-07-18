<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$('#addBtn').click(function(){
			
			if($('#itemName').val() == ''){
				
				$('#nameHelper').text('상품명을 입력해주세요.');
				
			}else if($('#itemPrice').val() == '' || isNaN($('#itemPrice').val()) ){
				
				$('#nameHelper').text('');
				$('#priceHelper').text('가격을 입력해주세요.');
				
			}else if($('#itemRate').val() == ''){
				
				$('#nameHelper').text('');
				$('#priceHelper').text('');
				$('#rateHelper').text('할인율을 설정해주세요');
				
			}else{
				
				$('form').submit();
				
			}
			
		})
		
	});
</script>
</head>
<body>
<h2>상품등록</h2>
<form action="itemAddAction.jsp" method="post">
	<div>
		<label>상품명 : </label>
		<input type="text" name="itemName" id="itemName" />
		<span id="nameHelper"></span>
	</div>
	<div>
		<label>상품가격 : </label>
		<input type="text" name="itemPrice" id="itemPrice" />
		<span id="priceHelper"></span>
	</div>
	<div>
		<label>할인율 : </label>
		<select name="itemRate" id="itemRate">
			<option value="">:::할인율 선택:::</option>
			<option value="0.1">90% 할인</option>
			<option value="0.2">80% 할인</option>
			<option value="0.3">70% 할인</option>
			<option value="0.4">60% 할인</option>
			<option value="0.5">50% 할인</option>
			<option value="0.6">40% 할인</option>
			<option value="0.7">30% 할인</option>
			<option value="0.8">20% 할인</option>
			<option value="0.9">10% 할일</option>
		</select>
		<span id="rateHelper"></span>
	</div>
	<div>
		<input type="button"  id="addBtn" value="상품등록"/>
	</div>
</form>
</body>
</html>