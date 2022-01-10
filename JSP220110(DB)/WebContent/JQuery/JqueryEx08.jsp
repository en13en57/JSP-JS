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
		$("tr:eq(0)").css('background-color','silver');
		$("tr:gt(6)").css('color','red');
		$("tr:lt(7)").css('color','blue');
		$("td:nth-child(3n+1)").css('background-color','pink');
		$("td:nth-child(3n+2)").css('background-color','skyblue');
		$("td:nth-child(3n)").css('background-color','yellow');
		// td의 글자색상을 4가지로 번갈아 만들어 보시오
		/*
		$("td:nth-child(4n+1)").css('color','red');
		$("td:nth-child(4n+2)").css('color','green');
		$("td:nth-child(4n+3)").css('color','brown');
		$("td:nth-child(4n)").css('color','white');
		*/
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
			<th>나이</th>
		</tr>
		<!-- 
		(tr>td{$$$}+td{이름$$}+td{$$$})*10
		 -->
		<tr>
			<td>001</td>
			<td>이름01</td>
			<td>001</td>
		</tr>
		<tr>
			<td>002</td>
			<td>이름02</td>
			<td>002</td>
		</tr>
		<tr>
			<td>003</td>
			<td>이름03</td>
			<td>003</td>
		</tr>
		<tr>
			<td>004</td>
			<td>이름04</td>
			<td>004</td>
		</tr>
		<tr>
			<td>005</td>
			<td>이름05</td>
			<td>005</td>
		</tr>
		<tr>
			<td>006</td>
			<td>이름06</td>
			<td>006</td>
		</tr>
		<tr>
			<td>007</td>
			<td>이름07</td>
			<td>007</td>
		</tr>
		<tr>
			<td>008</td>
			<td>이름08</td>
			<td>008</td>
		</tr>
		<tr>
			<td>009</td>
			<td>이름09</td>
			<td>009</td>
		</tr>
		<tr>
			<td>010</td>
			<td>이름10</td>
			<td>010</td>
		</tr>
		
	</table>
</body>
</html>