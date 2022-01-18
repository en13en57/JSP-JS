<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록보기</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
<script src="https://kit.fontawesome.com/58dd72094a.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
	.title { border: none; font-size: 20pt; text-align: center;}
	.sub_title {border: none; text-align: right;}
	td {padding: 5px; border: none; text-align: center;}
	#btn { float: right;}
	
	a:link 		{color: black; text-decoration: none;} /* 링크가 걸린 모양*/
	a:visited 	{color: black; text-decoration: none;} /* 방문했던 링크*/
	a:hover 	{color: black; text-decoration: none; font-weight: bold;} /* 마우스오버시 모양*/
	a:active 	{color: orange; text-decoration: none;} /* 마우스 클릭시 모양*/
	
</style>
</head>
<body>
	<table class= "table table-striped">
		<thead>
		    <tr>
		      <th class="title" scope="col" colspan="6">자유게시판</th>
		    </tr>
		    <tr>
		      <th class="sub_title" colspan="6" style="font-weight: lighter;">${pv.pageInfo }</th>
		    </tr>
		    <tr>
		   		<th>
		   			<input type= "text" name="search" id="search"> 
					<i class="fas fa-search"></i>
		   		</th>
	   	  		<th colspan="4"></th>
	   	  		<th><button class="btn btn-outline-success btn-sm" id="btn" 
					onclick='sendPost("insert.jsp",{"p" : ${p },"s" : ${s },"b" : ${b }})'>글쓰기</button></th>
		    </tr>
		</thead>		    
		<tbody>
			    <tr>
			      <th style="border: none;">No</th>
			      <td width="40%">제목</td>
			      <td>작성자</td>
			      <td>작성일</td>
			      <td>조회수</td>
			      <td>IP</td>
			    </tr>
			    	<c:if test="${pv.totalCount==0 }">
			    		<tr>
			    			<td scope='row' colspan='6' align='center'>등록된 글이 없습니다. </td>
			    		</tr>
			    	</c:if>
			    	<c:if test="${pv.totalCount>0 }">
			    		<%-- 번호 계산 --%>
			    		<c:set var="no" value="${pv.totalCount - (pv.currentPage - 1) * pv.pageSize }"></c:set>
			    		<c:forEach var="vo" items="${pv.list }" varStatus="vs">
			    			<tr>
			    				<th style="border: none;">${no }
			    					<%-- 번호 감소 --%>
						    		<c:set var="no" value="${no - 1 }"></c:set>
			    				</th>
			    				<td style="text-align: left">
			    					<a href="#" onclick='sendPost("view.jsp",{"p" : ${p },"s" : ${s },"b" : ${b },"idx" : ${vo.idx},"h" : 1})'>
			    					<c:out value="${vo.subject }"/>
			    					</a>
			    				</td>
			    				<td>
			    					<c:out value="${vo.subject }"/>
			    				</td>
			    				<td>
			    					<fmt:formatDate value="${vo.regDate }" pattern="yy-MM-dd"/>
			    				</td>
			    				<td>${vo.hit }</td>
			    				<td>${vo.ip }</td>
			    			</tr>
			    		</c:forEach>
			    		<tr>
			    			<td colspan='6' align='center' style='border:none;'>
			    				${pv.pageList }
			    			</td>
			    		</tr>
			    	</c:if>
			   <%-- 
			   	  <tr>
			      <th style="border: none;"><%=vo.getIdx() %></th>
			      <td style="text-align: left;">
					  <%
						// 태그 사용 금지, 20자 이상 막기
						String subject = vo.getSubject();
						subject = subject.replaceAll("<", "&lt;");
						if(subject.length()>=20){
							subject = subject.substring(0, 20) + "....";
						  }
				  	  %>
					  <a title="<%=vo.getSubject() %>" href="view.jsp?p=${pv.currentPage }&s=${pv.pageSize }&b=${pv.blockSize }&idx=<%=vo.getIdx() %>&h=1"><%=subject %></a>
			   	  </td>
			      <td>
						<%
							// 태그 사용 금지
							String name = vo.getName();
							name = name.replaceAll("<", "&lt;");
							out.println(name);
						%>
						</td>
						<td>
						<%
						SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd hh:mm");
						out.println(sdf.format(vo.getRegDate())); 
						%>
				  </td>
			      <td><%=vo.getHit() %></td>
			      <td><%=vo.getIp() %></td>
			      </tr>
				      <%
			       		}
			    	}
				      %>
			   --%>
		</tbody>
	</table>
</body>
</html>