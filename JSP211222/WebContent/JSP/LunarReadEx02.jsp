<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="kr.green.lunar.vo.LunarVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음력데이터를 읽어보자</title>
<script type="text/javascript">
</script>
<style type="text/css">
	table{
		width: 80%; margin: auto;
		
	}

</style>
</head>
<body>
	<%
		// 해당 URL에 접속하여 문서를 얻어온다.
		String urlAddress ="https://astro.kasi.re.kr/life/pageView/5";
		Document document = Jsoup.connect(urlAddress).get();
		// 문서중에서 원하는 부분만 가져오자
		List<LunarVO> list = new ArrayList<>();
		Elements elements = document.select("table tbody tr");
		for(Element e : elements){ // 반복
			// 1줄이 날짜 하나이다
			LunarVO vo = new LunarVO();
			// vo를 채워주자
			vo.setSolar(e.select("td").get(0).text()); // tr안의 td중 첫번째가 양력이다.
			vo.setLunar(e.select("td").get(1).text());
			vo.setGanji(e.select("td").get(2).text());
			out.println(vo + "<br>"); // 되는지 출력만 해보자
			list.add(vo); // 날짜 한개를 리스트에 추가
		}
		out.println(list.size() + "개 읽음<br>");
		
		// JSON 파일로 저장해보자!
		String path = application.getRealPath("LunarData"); // 서버의 절대 경로 구하기
		out.println("저장 경로 : " + path + "<br>");
		String fileName = list.get(0).getSolarYear() + list.get(0).getSolarMonth() + ".json";
		
		Gson gson = new Gson();
		PrintWriter pw = new PrintWriter(path + File.separator + fileName);
		gson.toJson(list, pw);
		pw.flush();
		pw.close();
		out.println(path + File.separator + fileName + "저장완료 <br>");
		
				
	%>

</body>
</html>