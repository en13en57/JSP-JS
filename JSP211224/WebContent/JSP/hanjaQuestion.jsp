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
	function viewExample(){
		var grade = document.getElementById("grade").value;
		var times = document.getElementById("times").value;
		// alert(grade + " " + times);
		// IE에서는 한글을 반드시 인코딩해서 보내야 에러가 아니다.
		// 자바스크립트에서 인코딩하는 함수로 encodeURIComponent()를 이용하여 인코딩한다.
		location.href = '?g=' + encodeURIComponent(grade) + "&t=" + encodeURIComponent(times);
	}
</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		// 회차와 급수를 넘겨받자
		request.setCharacterEncoding("UTF-8");
		String grade = request.getParameter("g"); // 급수 받기
		if(grade==null || grade.trim().length()==0){ // 급수가 넘어오지 않았으면
			grade = "1급"; // 기본값으로 "1급" 가지기
		}
		String times = request.getParameter("t"); // 회차 받기
		if(times==null || times.trim().length()==0){ // 회차가 넘어오지 않았으면
			times = "68회"; // 기본값으로 "68회" 가지기
		}
		// 데이터를 가져오자!!
		// 1. 급수
		String path = application.getRealPath("data");
		Set<String> gradeSet = HanjaUtil.readGrade(path);
		// 2. 회차
		Set<String> timesSet = HanjaUtil.readGrade(path, grade);
		// 3. 해당 급수의 해당 회차 문제를 가져오자!!
		List<HanjaVO> list = HanjaUtil.getQ(path, grade, times);
		// for(HanjaVO vo : list) System.out.println(vo);
	%>
	<h1>한자 급수 시험 모의고사</h1>
	<hr />
	급수 : 
	<select name="grade" id="grade">
		<%
			// 읽어온 급수를 넣자
			for(String g : gradeSet){
				out.print("<option value='" + g + "'" + (g.equals(grade) ? " selected='selected'" : "") + ">");
				out.print(g);
				out.println("</option>");
			}
		%>
	</select>
	회차 : 
	<select name="times" id="times">
		<%
			// 읽어온 회차를 넣자
			for(String t : timesSet){
				out.print("<option value='" + t + "'" + (t.equals(grade) ? " selected='selected'" : "") + ">");
				out.print(t);
				out.println("</option>");
			}
		%>
	
	</select>
	<button onclick="viewExample()">시험보기</button>
	<hr />
	<h2><%=grade %> <%=times %> 모의고사 보기</h2>
	<hr />
	<%-- 문제를 출력하자!!! --%>
	<form action="result.jsp" method="post">
		<%-- 급수와 회차를 숨겨서 보내기 --%>
		<input type="hidden" name="g" value="<%=grade%>"/>
		<input type="hidden" name="t" value="<%=times%>"/>
		<%-- 문제 출력 --%>
		<%
			for(int i=0;i<list.size();i++){
				HanjaVO vo = list.get(i);
				out.println(vo.getN() + ". " + vo.getQ());
				if(vo.getE1()==null || vo.getE1().trim().length()==0){
					// 항목에 값이 없으면 단답형이다.
					out.println("<input type='text' name='answer"+i+"' size='5'><br>" );
				}else{
					// 항목에 값이 있으면 사지선다형이다.
					out.println("<br>");
					if(vo.getE1()!=null && vo.getE1().trim().length()!=0 )
						out.println("<label><input type='radio' value='1' checked='checked' name='answer"+i+"'/>"+ vo.getE1() +"</label><br>" );
					
					if(vo.getE2()!=null && vo.getE2().trim().length()!=0)
						out.println("<label><input type='radio' value='2' name='answer"+i+"'/>"+ vo.getE2() +"</label><br>" );
					
					if(vo.getE3()!=null && vo.getE3().trim().length()!=0)
						out.println("<label><input type='radio' value='3' name='answer"+i+"'/>"+ vo.getE3() +"</label><br>" );
					
					if(vo.getE4()!=null && vo.getE4().trim().length()!=0)
						out.println("<label><input type='radio' value='4' name='answer"+i+"'/>"+ vo.getE4() +"</label><br>" );
				}
				out.println("<hr><br>");
			}
		%>
		<hr /><br />
		<input type="submit" value="채점하기" />
		<input type="reset" value="다시하기" />
	</form>
</body>
</html>