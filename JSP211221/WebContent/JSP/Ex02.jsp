<%@page import="kr.green.util.MyUtil"%>
<%-- page contentType='생성될 문서의 타입' --%>
<%@ page contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%-- JSP 주석이다. <%=new Date() %> --%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- 실행시간 : <%=new Date() %> -->
<%-- 
	JSP주석안의 자바 코드는 실행되지도 않고, 소스보기에서 보이지도 않는다.
 	하지만 HTML주석안의 자바 코드는 실행되고 실행결과가 소스보기에서 보인다.
 
 	%@로 시작하면 '디렉티브' 라고 한다. 설정정보를 나타냅니다.
 	%=로 시작하면 '표현식'이 라고 한다. 출력할때 사용합니다.
 	%로	시작하면 '스크립트릿' 이라고 하고 자바코드를 적습니다.
 	%!로 시작하면 '선언문' 이다. 메서드를 선언할때 사용합니다.		
 --%>
 <%
 	// %로 시작되었으므로 '스크립트릿'
 	String name = "한사람";
 	int age = 32;
 	
 %>
 <%! // %!로 시작하면 선언부 : 메서드 선언할때 사용
 	public static String show(String name, int age) {
	 	return "이름 : " + name + "씨(" + age + "세) <br />";
 	}
 %>

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
	<%-- 출력 : 표현식 (;없다.) --%>
	이름 : <%=name %>씨(<%=age %>세) <br />
	<%=show(name, age) %>
	<%=MyUtil.display("박문수", 21) %>
</body>
</html>