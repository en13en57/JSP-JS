<%@page import="kr.green.session.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인이 되어있는지를 판단해서 
	// 로그인이 되어있으면 로그아웃을 보이고,
	// 로그인이 되어있지 않으면 로그인으로 표시해라.
	MemberVO vo = (MemberVO)session.getAttribute("member");
	boolean isLogin = vo==null ? false : true;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function formCheck(){
		var obj=document.getElementById("userid");
		if(obj.value==null || obj.value.trim().length==0){
			alert('아이디는 반드시 입력해야 합니다.');
			obj.value="";
			obj.focus();
			return false;
		}
		var obj=document.getElementById("password");
		if(obj.value==null || obj.value.trim().length==0){
			alert('비밀번호는 반드시 입력해야 합니다.');
			obj.value="";
			obj.focus();
			return false;
		}
	}
</script>
<style type="text/css">
	table{margin: auto;border: 1px solid gray;}
	#password, #userid { width: 100px; border: 1px solid gray;}
	#loginBtn { width: 70px; height: 50px; }
	.title{text-align: center;color:white;background-color: black;padding: 10px;}
</style>
</head>
<body>
	<%
		if(!isLogin){ // 로그인이 되어있지 않으면
			
	%>
	<form action="loginOk.jsp" method="post" onsubmit="return formCheck();">
	<table>
		<tr>
			<td colspan="2" class="title">로그인</td>
		</tr>
		<tr>
			<td> 
				<input type="text" name="userid" id="userid" tabindex="1" placeholder="아이디입력" required="required"/>
			</td>
			<td rowspan="2">
				<input type="submit" value="로그인" id="loginBtn" tabindex="3"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="password" id="password" placeholder="비밀번호 입력" required="required" tabindex="2"/>
			</td>
		</tr>
	</table>
	</form>
	<% }else{ // 로그인이 되었으면 로그아웃을 보여준다. %>
	 <table>
		<tr>
			<td colspan="2" class="title">로그인</td>
		</tr>
		<tr>
			<td> 
				${member.userID }(${member.userName })님 반갑습니다.
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
	<% } %>
</body>
</html>