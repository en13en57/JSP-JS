<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">
	table{margin: auto;border: 1px solid gray;}
	#password, #userid { width: 100px; border: 1px solid gray;}
	#loginBtn { width: 70px; height: 50px; }
	.title{text-align: center;color:white;background-color: black;padding: 10px;}
</style>
</head>
<body>
	 <table>
		<tr>
			<td colspan="2" class="title">로그인</td>
		</tr>
		<tr>
			<td> 
				${userid }님 반갑습니다.
			</td>
			<td rowspan="2">
				<input type="button" value="로그아웃" id="loginBtn" tabindex="4" onclick="location.href='logout.jsp'"/>
				
			</td>
		</tr>
		<tr>
			<td>
				포인트가어쩌구저쩌구
			</td>
		</tr>
	</table>
</body>
</html>