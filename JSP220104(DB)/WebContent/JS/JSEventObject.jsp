<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){
		document.body.onclick = function(e){
			alert(e);
			var event = e || window.Event;
			alert(e);
			document.body.innerHTML = "";
			for(var key in event){
				document.body.innerHTML += "<p>" + key + " : " + event[key] + "</p>";
			}
		}
	};
</script>
<style type="text/css">

</style>
</head>
<body>
하하하하하
</body>
</html>