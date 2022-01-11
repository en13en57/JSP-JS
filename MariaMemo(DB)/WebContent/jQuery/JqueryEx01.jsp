<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	// 객체 배열 선언
	var array=[
		{name:'HanbitMedia',link:'http://hanb.co.kr'},
		{name:'Naver',link:'https://naver.com'},
		{name:'Daum',link:'http://daum.net'},
		{name:'Nate',link:'http://nate.com'}
	];
		
	$(function(){
		// $.each(컬렉션, 반복되면서 실행될 함수)
		$.each(array, function(index, element) {
			document.writeln(index + ". <a href='" + element.link + "'>" + element.name + "</a><br/>")
			document.writeln(index + ". <a href='" + array[index].link + "'>" + array[index]['name'] + "</a><br/><hr/>")
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body>

</body>
</html>