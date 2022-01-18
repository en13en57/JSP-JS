<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript">
	function formCheck(){
		var obj = $("#name");
		if(obj.val()==null || obj.val().trim().length==0){
			alert("이름은 반드시 입력되야 합니다.")
			obj.val("");
			obj.focus();
			return false;
		}
		var obj = $("#password");
		if(obj.val()==null || obj.val().trim().length==0){
			alert("비밀번호는 반드시 입력되야 합니다.")
			obj.val("");
			obj.focus();
			return false;
		}
		var obj = $("#subject");
		if(obj.val()==null || obj.val().trim().length==0){
			alert("제목은 반드시 입력되야 합니다.")
			obj.val("");
			obj.focus();
			return false;
		}
		var obj = $("#content");
		if(obj.val()==null || obj.val().trim().length==0){
			alert("내용은 반드시 입력되야 합니다.")
			obj.val("");
			obj.focus();
			return false;
		}
	}
</script>
<style type="text/css">
	table { width: 1000px; margin: auto; padding: 5px;}
	th {padding: 5px; border: 1px solid gray; background-color: silver;text-align: center;}
	td {padding: 5px; border: 1px solid gray; }
	.title {border: none; font-size: 20pt; text-align: center;}
	.item { width: 100px; background-color: silver;}
	#but {float:right;}
	
	a:link 		{color: black; text-decoration: none;} /* 링크가 걸린 모양*/
	a:visited 	{color: black; text-decoration: none;} /* 방문했던 링크*/
	a:hover 	{color: black; text-decoration: none; font-weight: bold;} /* 마우스오버시 모양*/
	a:active 	{color: orange; text-decoration: none;} /* 마우스 클릭시 모양*/
</style>
</head>
<body>
	<form action="updateOk.jsp" method="post" onsubmit="return formCheck();">
	
	<input type="hidden" name="p" value="1" />
	<input type="hidden" name="s" value="${s }" />
	<input type="hidden" name="b" value="${b }" />
	<input type="hidden" name="m" value="1" />
<table class= "table table-striped">
	<thead>
		<tr>
			<th colspan="4" class="title" scope="col">자유게시판 글쓰기</th>
		</tr>
		<tr>
			<td colspan="3" style="border: none;"></td>
			<td style="border: none;">
				<input type="button" id="but" class="btn btn-outline-success btn-sm"
				onclick="location.href='index.jsp?p=${p}&s=${s}&b=${b}'" value="목록">
				<input type="submit" id="but" value="저장" class="btn btn-outline-success btn-sm" />
			</td>
		</tr>
	</thead>
		 <tr>
	    	<th class="item" scope="row">이름</th>
			<td>
				<input type="text" name="user" id="user" required="required" maxlength="30"/>
			</td>
			<th class="item">비밀번호</th>
			<td>
				<input type="password" name="password" id="password" required="required" maxlength="30"/>
			</td>
		</tr>
		<tr>
			<th class="item">제목</th>
			<td colspan="3">
				<input type="text" name="subject" id="subject" required="required" size="90" maxlength="100"/>
			</td>
		</tr>
		<tr>
			<th class="item">내용</th>
			<td colspan="3">
				<textarea name="content" id="content" rows="10" cols="93"></textarea>
			</td>
	    </tr>
	</table>
	</form>

</body>
</html>