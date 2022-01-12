<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var max = 10, min = 2, count = 2;
	$(function () {
		$("#appendBtn").click(function() {
			if(count==max){
				alert('최대 ' + max + "만 첨부 가능합니다.");
				return;
			}
			// 태그 추가
			++count;
			$("#filebox").append($("<div>파일 " + (count<10 ? "0" + count : count+"")
								 + " : <input type ='file' name='fiel' /></div>"));
		});
		$("#removeBtn").click(function() {
			if(count==min){
				alert('최소 ' + min + "개는 첨부 해야합니다.");
				return;
			}
			// 태그 제거
			$("#filebox>div").last().remove();
			--count;
		});
	});


</script>
<style type="text/css">

</style>
</head>
<body>
	<h2>첨부파일</h2>
	<button id="appendBtn"> + </button>
	<button id="removeBtn"> - </button>
	<br /><hr />
	<div id="filebox">
		<div>
			파일 01 : <input type="file" name="file" />
		</div>
		<div>
			파일 02 : <input type="file" name="file" />
		</div>
	</div>
</body>
</html>