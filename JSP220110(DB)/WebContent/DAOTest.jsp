<%@page import="java.util.List"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="kr.green.memo.vo.PagingVO"%>
<%@page import="kr.green.memo.dao.MemoDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = JDBCUtil.getConnection();
	
	int totalCount = MemoDAO.getInstance().selectCount(conn);
	
	PagingVO<MemoVO> pagingVO = new PagingVO<>(1,10,10,totalCount); // 객체 생성과 동시에 계산 완료
	List<MemoVO> list = MemoDAO.getInstance().selectList(conn, pagingVO.getStartNo(), pagingVO.getPageSize());
	pagingVO.setList(list);
 
	JDBCUtil.close(conn);
	

%>
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
	전체 개수 : <%=pagingVO.getTotalCount() %>개 <br /><hr />
	<%=pagingVO.getPageInfo() %> <br /><hr />
	<%
		if(pagingVO.getTotalCount()==0){
			out.println("등록된 글이 없습니다.<br>");
			
		}else{
			if(pagingVO.getList()!=null){
				for(MemoVO vo : pagingVO.getList()){
					out.println(vo+"<br>");
				}
			out.println("<br/><hr/>");
			out.println(pagingVO.getPageList());
			}
		}
	%>
</body>
</html>