<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체의 생성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function (){
		$("#btn1").click(function(){
				$("<h2>appendTo</h2>").appendTo("#box1");
		});
		$("#btn2").click(function(){
				$("<h2>prependTo</h2>").prependTo("#box1");
		});
		$("#btn3").click(function(){
				$("<h2>insertAfter</h2>").insertAfter("#box1");
		});
		$("#btn4").click(function(){
				$("<h2>insertBefore</h2>").insertBefore("#box1");
		});
		
		$("#btn5").click(function(){
				$("#box1").append("<h2>append</h2>")
		});
		$("#btn6").click(function(){
				$("#box1").prepend("<h2>prepend</h2>")
		});
		$("#btn7").click(function(){
				$("#box1").after("<h2>After</h2>")
		});
		$("#btn8").click(function(){
				$("#box1").before("<h2>Before</h2>")
		});
	});	
</script>
<style type="text/css">
	div {
		width: 200px; height: 260px; padding: 5px; border: 1px solid gray; margin: 10px;
		overflow: ;
	}
</style>
</head>
<body>
	<button id="btn1">appendTO</button>
	<button id="btn2">prependTO</button>
	<button id="btn3">insertAfter</button>
	<button id="btn4">insertBefore</button>
	<br /><hr />
	<button id="btn5">append</button>
	<button id="btn6">prepend</button>
	<button id="btn7">After</button>
	<button id="btn8">Before</button>
	<br /><hr />
	<div id="box1">
		나는 내용 입니다.
	</div>
	
</body>
</html>