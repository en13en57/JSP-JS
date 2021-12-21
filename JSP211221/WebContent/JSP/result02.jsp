<%@page import="java.util.Enumeration"%>
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
	<%
		request.setCharacterEncoding("UTF-8");
		// name속성의 값을 모를때는 어떻게 받을까?
		Enumeration<String>names = request.getParameterNames(); // 모든 name속성을 받는다.
		
		while(names.hasMoreElements()){
			// 이름 가져오기
			String name = names.nextElement();
	
			// 값 가져오기
			String values[] = request.getParameterValues(name);
			
			// 출력			
			out.println(name + " : ");
			if(values!=null && values.length>0){
				for(String value : values)
					out.println(value + " ");
				out.println("<br/>" + " ");
			}
		}
	%>
</body>
</html>