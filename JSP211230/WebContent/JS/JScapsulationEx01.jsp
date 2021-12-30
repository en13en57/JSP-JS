<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트의 캡슐화</title>
<script type="text/javascript">
	// 생성자 함수
	function Rectangle(width, height){
		this.width = width;
		this.height = height;
	}
	// 메서드 추가
	Rectanle.prototype.getArea = function(){
		return this.width * this.height;
	}
	var rec1 = new Rectangle(100,50);
	document.write(rect1.)
	
</script>
</head>
<body>

</body>
</html>