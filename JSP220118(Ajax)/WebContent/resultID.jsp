<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
// id.txt파일을 읽어 콤마(,)로 구분하여 배열을 만들고 배열을 리스트로 만들었다. 그러면 모든 "금지어"가 리스트에 저장된다.
// 나중에는 DB에서 아이디 검색을 한다. 
List<String> list = Arrays.asList(Files.readString(Paths.get(application.getRealPath("id.txt"))).split(","));
// 데이터 받기
String word = request.getParameter("userid");
// 받은 데이터가 있으면
if(word!=null){
	// 반복
	for(String t : list){
		// 금지어를 포함하고 있으면 1을 찍어준다.
		if(word.equals(t)) {
			out.print(1);
			return ; // 여기서 종료
		}
	}
}
// 없으면 0을 찍어준다.
out.print(0);
%>