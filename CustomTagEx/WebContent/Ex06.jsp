<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptless 와 tagdependent차이</title>
</head>
<body>
	<c:set var="elText" value="EL로 출력 할 내용"/>
	<table border="1" width="500">
		<tr>
			<th>scriptless</th>
			<th>tagdependent</th>
		</tr>
	
		<tr>
			<td><my:scriptless> <b>일반 텍스트</b></my:scriptless></td>
			<td><my:tagdependent> <b>일반 텍스트</b></my:tagdependent></td>
		</tr>
		<tr>
			<td><my:scriptless> ${elText }</my:scriptless></td>
			<%-- tagdependent는 EL을 사용 못하고 --%>
			<td><my:tagdependent> ${elText }</my:tagdependent></td>
		</tr>
		<tr>
			<td>
				<my:scriptless>
					<jsp:body>jsp:body태그를 이용</jsp:body>
				</my:scriptless>
			</td>
			<td>
				<my:tagdependent>
					<jsp:body>jsp:body태그를 이용</jsp:body>
				</my:tagdependent>
			</td>
		</tr>
		
		<tr>
			<td>
				<%-- scriptless는 표현식 사용 불가 
				<my:scriptless>
					<%="표현식 사용" %>
				</my:scriptless>
				 --%>
			</td>
			<td>
				<my:tagdependent>
					<%="표현식 사용" %>
				</my:tagdependent>
			</td>
		</tr>
		
	</table>
</body>
</html>