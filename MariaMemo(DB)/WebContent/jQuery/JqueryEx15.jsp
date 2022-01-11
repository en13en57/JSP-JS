<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 조작</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){

	});
</script>
<style type="text/css">
.text-rainbow {
  /* 배경색을 무지개 색으로 번지듯이 만든다. */
  background-image: linear-gradient(90deg, red, orange, yellow, green, blue, navy, purple);
  /* 배경색이 글자에만 적용되도록 한다. webkit엔진을 사용하는 부라우져만 됨 */
  -webkit-background-clip: text;
  /* 텍스트 색을 투경하게 하여 배경색이 적용되도록 한다. */
  color: transparent;

  /* 글자 크기 및 스타일 변경 */
  font-weight: bold;
  font-size: 80px;
}
</style>
</head>
<body>
	<span class="text-rainbow">Hello Rainbow!</span>
</body>
</html>