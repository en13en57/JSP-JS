<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
</style>
</head>
<body>
	<div>
		<form action="sendMail2.jsp" method="post">
			<table>
				<tr>
					<th colspan="2">JSP 메일 보내기(서버에 있는 파일 첨부)</th>
				</tr>
				<tr>
					<td>보내는 사람 Email</td>
					<td><input type="text" name="from" value="en3en7@naver.com"/></td>
				</tr>
				<tr>
					<td>보내는 사람 비밀번호</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td>받는 사람 Email</td>
					<td><input type="text" name="to" /></td>
				</tr>
				<tr>
					<td>subject</td>
					<td><input type="text" name="subject" /></td>
				</tr>
				<tr>
					<td>content</td>
					<td><textarea name="content"
							style="width: 170px; height: 200px;"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input
						type="submit" value="메일보내기" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>