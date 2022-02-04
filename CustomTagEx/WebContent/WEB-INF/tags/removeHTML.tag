<%@tag language="java" pageEncoding="UTF-8" body-content="scriptless" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="length" type="java.lang.Integer"%>
<%@ attribute name="trail" %>
<%@ attribute name="trim" %>

<%-- 넘어온 몸체의 내용을 변수에 저장 --%>
<jsp:doBody var="content" scope="page"/> <%--넘어온 몸체의 내용을 변수에 저장 --%>
<%
	// 변수의 내용을 읽어서 자바 변수에 저장
	String content = (String)jspContext.getAttribute("content");

	// trim 속성이 true라면 앞뒤의 공백을 제거
	if(trim!=null && trim.equals("true")){
		content = content.trim();
	}
	
	// 존재하는 태그를 모두 지운다.
	content = content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?>", "");
	   
	// length속성의 값이 있으면서 현재 문자열 길이가 length보다 길다면 
    if (length != null && length.intValue() > 0 && content.length() > length.intValue()) {
    	// 길이만큼 잘라내고
        content = content.substring(0, length.intValue());
    	// trail속성이 있다면 잘라낸 문자열 뒤에 붙여준다.
        if (trail != null) {
            content = content + trail;
        }
    }
	// 출력
	out.println(content);
%>