<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function clickFn(){
		alert(document.getElementById("header02").innerText);
	}
	function clickFn2(obj){
		alert(obj.innerText);
	}
	window.onload = function(){
		document.getElementById("header04").onclick = function() {
			// 자바스크립트에서 스타일 변경하기
			this.style.color = 'red';
			this.style.backgroundColor = 'pink';
			alert(this.innerText);
		};
		document.getElementById("header04").onmouseover = function() {
			// 자바스크립트에서 스타일 변경하기
			this.style.color = 'red';
		};
		document.getElementById("header04").onmouseout = function() {
			// 자바스크립트에서 스타일 변경하기
			this.style.color = 'black';
		};
		
		document.getElementById("header05").addEventListener("click", function(e) {
			this.style.color = 'red';
			this.style.backgroundColor = 'pink';
			alert(this.innerText);
		}, false);
		document.getElementById("header05").addEventListener("mouseover", function(e) {
			this.style.color = 'red';
		}, false);
		document.getElementById("header05").addEventListener("mouseout", function(e) {
			this.style.color = 'black';
		}, false);
	}
</script>
<style type="text/css">
	h1 { cursor: pointer;}
</style>
</head>
<body>
	<!-- 
	h1[id='header$$']{나는제목 $$$}*5
	 -->
	<!--  이벤트 지정하는 여러가지 방법 --> 
	<!-- 1. 직접 코딩 -->
	<h1 id="header01" onclick="alert(this.innerText);">나는제목 001</h1>
	<!-- 2. 함수 호출 -->
	<h1 id="header02" onclick="clickFn();">나는제목 002</h1>
	<h1 id="header03" onclick="clickFn2(this)">나는제목 003</h1>
	<!-- 3. 상단에서 이벤트 지정 -->
	<h1 id="header04">나는제목 004</h1>
	<h1 id="header05">나는제목 005</h1>
</body>
</html>