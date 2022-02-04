<%@tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:doBody/> <%-- 직접 출력 --%>
<hr>
<jsp:doBody var="body" scope="request"/> <%-- 변수에 저장 후 EL로 출력 --%>
${body }
