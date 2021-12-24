<%@page import="kr.green.hanja.vo.HanjaVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.green.hanja.vo.HanjaUtil"%>
<%@page import="java.util.Set"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한자 급수시험 문제집</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		// 회차와 급수를 넘겨받자
		request.setCharacterEncoding("UTF-8");
		
		// post전송이 아니면 시험문제집으로 보내기
		if(!request.getMethod().equals("POST")){
			response.sendRedirect("hanjaQuestion.jsp");
			return;
		}
		
		String grade = request.getParameter("g"); // 급수 받기
		String times = request.getParameter("t"); // 회차 받기
		
		// 데이터를 가져오자!!
		// 3. 해당 급수의 해당 회차 문제를 가져오자!!
		String path = application.getRealPath("data");
		List<HanjaVO> list = HanjaUtil.getQ(path, grade, times);
	%>
	<h1>한자 급수 시험 모의고사 채점하기</h1>
	<hr />
	<h2><%=grade %> <%=times %> 모의고사 재점 결과</h2>
	<hr />
	<%-- 문제 출력 --%>
	<%
		int count = 0;
		for(int i=0;i<list.size();i++){
			HanjaVO vo = list.get(i);
			out.println(vo.getN() + ". " + vo.getQ() + "<br>");
			out.println("정답 : " + vo.getA() + "<br>");
			out.println("답안 : " + request.getParameter("answer" + i) + "<br>");
			if(vo.getA().equals(request.getParameter("answer" + i))){
				count++;
				out.println("축하합니다...<br>");
			}else{
				out.println("틀렸습니다. 노력하세요<br>");
			}
			out.println("<hr><br>");
		}
	%>
	<h2>
		<%=list.size() %>문제중 <%=count %>개를 맞추셨습니다. <br />
		<%=String.format("%.2f%%의 적중률입니다.", (double)count/list.size()*100) %> <br />
	</h2>
</body>
</html>