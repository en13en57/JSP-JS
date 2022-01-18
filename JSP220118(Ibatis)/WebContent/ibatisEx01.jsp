<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.green.ibatis.IbatisApp"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ibatis를 이용한 DB작업</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		SqlMapClient sqlMapClient = IbatisApp.getSqlMapClient(); // 연결 얻기
		out.println("연결 성공 : " + sqlMapClient);
		try{
			sqlMapClient.startTransaction(); // 트랜젝션시작
			// -----------------------------------------------------------
			// 이부분만 변경된다.		
			// 맵퍼의 네임스페이스가 test이고 id가 now인 SQL명령을 실행해서 결과를 가져온다.
			String today = (String)sqlMapClient.queryForObject("test.now");
			out.println("DB의 날짜 : " + today + "<br>");
			
			HashMap<String, Integer> map = new HashMap<>();
			map.put("num1", 34);
			map.put("num2", 55);
			map.put("num3", 12);
			
			// 맵퍼의 네임스페이스가 test이고 id가 calc인 SQL명령을 실행해서 결과를 가져온다.
			int result = (Integer)sqlMapClient.queryForObject("test.calc", map);
			out.println("계산 결과 : " + result);
			
			out.println("<br><hr>");
			
			List<MemoVO> list = sqlMapClient.queryForList("test.selectList");
			for(MemoVO vo : list){
				out.println(vo + "<br>");
			}
			// -----------------------------------------------------------
			sqlMapClient.commitTransaction(); // 트랜젝션 적용
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			// 닫기를 해주지 않는다. 왜? 알아서 닫아준다.
			sqlMapClient.endTransaction(); // commitTransaction()호출되지 않았으면 롤백을 해준다.
		}
	%>
</body>
</html>