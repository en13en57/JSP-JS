<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var message = "정말 재미난 뉴스입니다. 정말이라니까요!!! 진짜라구요";
	window.onload = function(){
		
		// ------------------------------------------------
		// 타이핑 되기
		var count = 0;
		setInterval(function(){
			document.getElementById("msg1").value = message.substr(0, ++count);
			if(message.length<count){
				count=0;
			}
		}, 100);
		
		// ------------------------------------------------
		// 좌우로 늘어나기
		var count2=0
		setInterval(function(){
			document.getElementById("msg2").value = message.substr(0, ++count2);
			if(message.length<count2){
				count2=0;
			}
		}, 100);

		// ------------------------------------------------
		// 왼쪽으로 밀려나기
		var blank3 = "";
		for(i=0;i<80;i++) blank3 += " ";
		var msg2 = message + blank3;
		var start = 0;
		setInterval(function(){
			document.getElementById("msg3").value = msg2.substring(start) + msg2.substr(0, start);
			start++;
			if(start==msg2.length) start = 0;
		},50);

		// ------------------------------------------------
		// 오른쪽으로 밀려나기
		var blank4 = "";
		for(i=0;i<80;i++) blank4 += " ";
		var msg3 = message + blank4 ;
		var start2 = 0;
		setInterval(function(){
			document.getElementById("msg4").value = msg3.substring(msg3.length-start2) +  message;
			start2++;
			if(start2==msg3.length) start2 = 0;
		},50);

		// ------------------------------------------------
		// 왔다갔다하기
		var count3=0;
		var sw=1;
		setInterval(function(){
			var blank="";
			count3 += sw; // 빈칸수 증감
			for(i=0;i<count3;i++) blank += " "; // 앞에 출력할 빈칸수 만들기
			document.getElementById("msg5").value = blank + message;
			if(count3==80 || count3==0){
				sw *= -1; // 오른쪽이나 왼쪽에 도달하면 늘어나던 빈칸수가 줄어들고 줄어들던 빈칸수가 늘어나게 한다. 
			}
		}, 50);
		// ------------------------------------------------
	}
</script>
<style type="text/css">
	#msg1{font-size: 13pt;padding: 5px; border: none;}
	#msg2{font-size: 13pt;padding: 5px; border: none;text-align: center;}
	#msg3{font-size: 13pt;padding: 5px; border: 1px solid gray;}
	#msg4{font-size: 13pt;padding: 5px; border: 1px solid gray;}
	#msg5{font-size: 13pt;padding: 5px; border: none;}
</style>
</head>
<body>
	<!-- 타이핑 -->
	<div style="text-align: center;"><input type="text" id="msg1" size="100"/></div>
	<!-- 좌우로 늘어나기 -->
	<div style="text-align: center;"><input type="text" id="msg2" size="100"/></div>
	<!-- 왼쪽으로 밀려나기 -->
	<div style="text-align: center;"><input type="text" id="msg3" size="100"/></div>
	<!-- 오른쪽으로 밀려나기 -->
	<div style="text-align: center;"><input type="text" id="msg4" size="100"/></div>
	<!-- 왔다갔다하기 -->
	<div style="text-align: center;"><input type="text" id="msg5" size="100"/></div>
</body>
</html>