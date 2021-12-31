<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid")!=null){ // 로그인이 되어 있다면 메인페이지로 보낸다.
		response.sendRedirect("main.jsp");
		return;
	}

	String userid = "";
	boolean isSave = false; // 아이디 저장 유무 판단
	// 쿠키를 읽어 userid쿠키값이 있다면 변수에 저장을 해준다.
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("userid")){
				userid = cookie.getValue();
				isSave = true;
				break;
			}
		}
	}
	
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
	<form action="loginOk.jsp" method="post" onsubmit="return formCheck();">
	<table>
		<tr>
			<td colspan="2" class="title">로그인</td>
		</tr>
		<tr>
			<td> 
				<input type="text" name="userid" id="userid" tabindex="1" placeholder="아이디입력" required="required" value="<%=userid%>"/>
			</td>
			<td rowspan="2">
				<input type="submit" value="로그인" id="loginBtn" tabindex="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="password" id="password" placeholder="비밀번호 입력" required="required" tabindex="2"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<label>
					<input type="checkbox" name="saveid" value="1" tabindex="3" <%=isSave ? " checked='checked' ":"" %>/>아이디 저장
				</label>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>