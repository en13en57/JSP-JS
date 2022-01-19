<%@page import="kr.green.mybatis.vo.TestVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="kr.green.mybatis.jdbc.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		SqlSession sqlSession = null;
		try{
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			out.println("연결 성공 : " + sqlSession + "<br>");
			//--------------------------------------------------------------------
			// 서비스 클래스의 기본 모양으로 중간 부분이 바뀐다.
			// SqlSession 객체를 이용하여 맵퍼의 명령을 실행하고 결과를 받는다.
			// 결과의 타입은 resultType과 일치해야 한다.
			Date today = sqlSession.selectOne("test.today"); // 1개 받을때는 selectOne("네임스페이스.id",[인수])
			HashMap<String, Integer> map = new HashMap<>();
			map.put("num1", 1);
			map.put("num2", 2);
			map.put("num3", 3);
			
			int result = sqlSession.selectOne("test.calc", map);
			
			TestVO vo = sqlSession.selectOne("test.vo1", map);
			
			HashMap<String, Object> map2 = sqlSession.selectOne("test.vo2",map);
			// EL로 출력하기 위해 영역에 저장
			request.setAttribute("today", today);
			request.setAttribute("result", result);
			request.setAttribute("vo", vo);
			request.setAttribute("map2", map2);
			
			//--------------------------------------------------------------------
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
	
	%>
	DB의 날짜 : <fmt:formatDate value="${today }" pattern="yyy-MM-dd hh:mm:ss"/> <br />
	계산 결과 : ${result } <br />
	VO결과    : ${vo } <br />
	map 결과  : ${map2 } <br />
	<hr />
	today : <fmt:formatDate value="${vo.today }" pattern="yy-MM-dd hh:mm:ss"/> <br />
	계산  : ${vo.result } <br />
	<hr />
	today : <fmt:formatDate value="${map2.today }" pattern="yy-MM-dd hh:mm:ss"/> <br />
	계산  : ${map2.result } <br />
	
	
</body>
</html>