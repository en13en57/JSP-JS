<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 특정 태그 선택</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var xml = "<friends>";
	xml += "	<friend>";
	xml += "		<name>한사람</name>";
	xml += "		<language>C/C++</language>";
	xml += "	</friend>";
	xml += "	<friend>";
	xml += "		<name>두사람</name>";
	xml += "		<language>JavaScript</language>";
	xml += "	</friend>";
	xml += "	<friend>";
	xml += "		<name>세사람</name>";
	xml += "		<language>Java</language>";
	xml += "	</friend>";
	xml += "	<friend>";
	xml += "		<name>네사람</name>";
	xml += "		<language>Python</language>";
	xml += "	</friend>";
	xml += "</friends>";
	
	$(function(){
		var xmlDoc = $.parseXML(xml); // 문자열로 만들어진 XML내용을 XML문서 형태로 해석한다.
		$(xmlDoc).find('friend').each(function(i, element) { // friend태그를 몽땅 읽어서 반복해라
			document.writeln("<div>");
			document.writeln("<h2>");
			document.writeln($(this).find('name').text());
			document.writeln("</h2>");
			document.writeln("<p>");
			document.writeln($(this).find('language').text());
			document.writeln("</p>");
			document.writeln("</div>");
		});
		
		$("div").css({
			'width': '150px', 
			'height': '100px', 
			'border': '1px solid gray',
			'background-color': 'silver', 
			'border-radius': '150px',
			'text-align': 'center',
			'margin' : '10px',
			'float' : 'left'
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	
</body>
</html>