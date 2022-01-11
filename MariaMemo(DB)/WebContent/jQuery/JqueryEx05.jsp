<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery를 사용한 객체 확장</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var obj = {}; // 빈 객체 생성
	
	$(function(){
		document.writeln("obj : " + viewObject() + "<br><hr>");
		// 지금 까지의 객체에 속성추가
		obj.name = "한사람";
		obj.age = 33;
		document.writeln("obj : " + viewObject() + "<br><hr>");
		// Jquery를 이용한 속성추가
		$.extend(obj, {
			'gender' : '남자',
			'part' : "기타",
			toString : function(){
				var result = "";
				for(key in obj){
					result +=  key + " : " + obj[key] + ", "; 
				}
				return result;
			}
		});
		document.writeln("obj : " + obj + "<br><hr>");
	});
	
	function viewObject(){
		var result = "";
		for(key in obj){
			result +=  key + " : " + obj[key] + ", "; 
		}
		return result;
	}
</script>
<style type="text/css">

</style>
</head>
<body>

</body>
</html>