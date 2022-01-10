<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속성 선택자</title>
<!-- 다운 받지 않고 사용하려면 CDN을 이용하면 된다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() { 
		// input태그의 type속성이 있으면
		$("input[type]").css('border','1px solid blue');
		// input태그의 type속성 값이 'password'면
		$("input[type='password']").css('border','1px solid red');
		// 태그명:요소
		$("input:text").val('하하하하');
		$("input:file").css('border','5px dotted yellow');
		$("input:focus").css('background-color','pink');
		
		// 5초후에 
		setTimeout(function() {
			// select태그 안의 옵션태그 중에서 선택된 옵션의 값을 경고창으로 띄워라
			alert($("select>option:selected").val() + "를 먹고싶다고!");
		}, 5000);
		
		// 3초 후에 체크박스중 체크된 항목의 값을 경고창으로 띄워라
		setTimeout(function() {
			alert($("div>label>input:checked").val() + "가 재미있다고!")
		}, 3000)
	});

</script>
<style type="text/css">

</style>
</head>
<body>
	<input type="text" /><br />
	<input type="password" /><br />
	<input type="radio" /><br />
	<input type="checkbox" /><br />
	<input type="file" /><br />
	<hr />
	<div>
		<label><input type="radio" value="Java" />Java</label>
		<label><input type="radio" value="HTML" />HTML</label>
		<label><input type="radio" value="CSS" />CSS</label>
		<label><input type="radio" value="JQuery" />JQuery</label>
	</div>
	<hr />
	<select>
		<option value="사과">사과</option>
		<option value="배">배</option>
		<option value="밤">밤</option>
		<option value="감">감</option>
		<option value="대추">대추</option>
	</select>
</body>
</html>