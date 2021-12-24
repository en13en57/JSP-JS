<%@page import="java.util.Set"%>
<%@page import="kr.green.hanja.vo.HanjaUtil"%>
<%@page import="kr.green.hanja.vo.HanjaVO"%>
<%@page import="java.util.List"%>
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
		String path = application.getRealPath("data");
		// 전체 읽기
		List<HanjaVO> list = HanjaUtil.readHanja(path);
		out.println(list.size() + "개 읽음<br>");
		
		// 급수만 읽기
		Set<String> gradeSet = HanjaUtil.readGrade(path);
		out.println("급수 : <select>");
		for(String grade : gradeSet){
			out.println("<option>" + grade + "</option>");
		}
		out.println("</select>");
		
		// 회차만 읽기
		Set<String> gradeSet2 = HanjaUtil.readGrade(path, "1급" );
		out.println("시험회차 : <select>");
		for(String grade : gradeSet2){
			out.println("<option>" + grade + "</option>");
		}
		out.println("</select><br><hr>");
		// 1급 68회 시험문제만 뽑아서 출력해보자
		List<HanjaVO> list2 = HanjaUtil.getQ(path, "1급", "68회");
		if(list2!=null && list2.size()>0){ // 데이터가 있다면
			for(HanjaVO vo : list2){
				out.println(vo + "<br>");
			}
		}
	%>
</body>
</html>