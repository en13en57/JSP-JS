<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery 필터선택자</title>
<!-- 다운 받지 않고 사용하려면 CDN을 이용하면 된다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() { 
		// h2태그중 짝수번째는 빨간색
		// h2태그중 홀수번째는 파란색으로 만들고 싶다.
		// index는 0부터다.
		$("h2:odd").css("color","red");
		$("h2:even").css("color","blue");
		$("h2:first").css("color","green");
		$("h2:last").css("color","pink");
		// 표 제목의 배경색은 회색으로
		// 짝수행의 배경색을 핑크로
		// 홀수행의 배경색을 하늘색으로
		$("tr:odd").css('background-color','skyblue')
		$("tr:even").css('background-color','pink')
		$("tr:first").css('background-color','silver')
		$("tr:last").css('background-color','silver')
		
	});

</script>
<style type="text/css">

</style>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<!-- 
		(tr>td{$$$}+td{이름$$})*10
		 -->
		<tr>
			<td>001</td>
			<td>이름01</td>
		</tr>
		<tr>
			<td>002</td>
			<td>이름02</td>
		</tr>
		<tr>
			<td>003</td>
			<td>이름03</td>
		</tr>
		<tr>
			<td>004</td>
			<td>이름04</td>
		</tr>
		<tr>
			<td>005</td>
			<td>이름05</td>
		</tr>
		<tr>
			<td>006</td>
			<td>이름06</td>
		</tr>
		<tr>
			<td>007</td>
			<td>이름07</td>
		</tr>
		<tr>
			<td>008</td>
			<td>이름08</td>
		</tr>
		<tr>
			<td>009</td>
			<td>이름09</td>
		</tr>
		<tr>
			<td>010</td>
			<td>이름10</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>이름</th>
		</tr>
	</table>
	<!-- 
	h2{$$. 나는 제목입니다.}*10
	 -->
	<h2>01. 나는 제목입니다.</h2>
	<h2>02. 나는 제목입니다.</h2>
	<h2>03. 나는 제목입니다.</h2>
	<h2>04. 나는 제목입니다.</h2>
	<h2>05. 나는 제목입니다.</h2>
	<h2>06. 나는 제목입니다.</h2>
	<h2>07. 나는 제목입니다.</h2>
	<h2>08. 나는 제목입니다.</h2>
	<h2>09. 나는 제목입니다.</h2>
	<h2>10. 나는 제목입니다.</h2>

</body>
</html>