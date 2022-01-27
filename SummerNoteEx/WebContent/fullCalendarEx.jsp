<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- fullcalendar 시작 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
<!-- fullcalendar 종료 -->
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript">
	$(function() {
		var calendarEl = document.getElementById('calendar'); // id찾기
		// 지정 아이디를 넣어 객체 생성 : (표시할객체, 옵션)
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale : 'ko', // 로케일
			initialView : 'dayGridMonth',
		  		headerToolbar :{
		  		  start: 'title', // will normally be on the left. if RTL, will be on the right
		  		  center: '',
		  		  end: 'today prev,next' // will normally be on the right. if RTL, will be on the left
		  		},
		});
		calendar.on('dateClick', function(info) {
		alert('clicked on ' + info.dateStr);
			});
		calendar.render(); // 그려줘!
	});
</script>
<style type="text/css">
</style>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>
