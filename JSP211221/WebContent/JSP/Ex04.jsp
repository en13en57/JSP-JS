<%-- 생성 문서의 타입과 이 문서의 인코딩 타입 --%>
<%@ page contentType="application/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 세션을 사용하겠다 --%>
<%@ page session = "true" %>
<%-- 버퍼의 크기를 8kb로 하겠다. --%>
<%@ page buffer="8kb" %>
<%-- 만들어지는 문서의 상단에 있는 공백들을 지우겠다. --%>
<%@ page trimDirectiveWhitespaces="true"%>
<%-- 어떤 클래스를 사용하겠다. 콤마로 구분하여 한번에 여러개 지정 가능하다.--%>
<%@ page import="java.util.*, java.time.*"%>
<%-- 이 파일이 실행되고 나타나는 결과는 xml 파일이다.--%>
<computers>
	<computer>
		<cpu>586</cpu>
		<ram>16GB</ram>	
	</computer>
	<computer>
		<cpu>686</cpu>
		<ram>32GB</ram>	
	</computer>
</computers>
