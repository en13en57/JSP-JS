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
		headerToolbar : {
			start : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth', // will normally be on the left. if RTL, will be on the right
			center : 'title',
			end : 'prevYear,prev,today,next,nextYear' // will normally be on the right. if RTL, will be on the left
		},
		buttonText : {
			today : '오늘',
			month : '월',
			week : '주',
			day : '일',
			list : '목록'
		},
		// 이벤트
		events : [ {
			title : 'All Day Event',
			start : '2022-01-01',
		}, {
			title : 'Long Event',
			start : '2022-01-07',
			end : '2022-01-10'
		}, {
			groupId : 999,
			title : 'Repeating Event',
			start : '2022-01-09T16:00:00'
		}, {
			groupId : 999,
			title : 'Repeating Event',
			start : '2022-01-16T16:00:00'
		}, {
			title : 'Conference',
			start : '2022-01-11',
			end : '2022-01-13'
		}, {
			title : 'Meeting',
			start : '2022-01-12T10:30:00',
			end : '2022-01-12T12:30:00'
		}, {
			title : 'Lunch',
			start : '2022-01-12T12:00:00'
		}, {
			title : 'Meeting',
			start : '2022-01-12T14:30:00'
		}, {
			title : 'Happy Hour',
			start : '2022-01-12T17:30:00'
		}, {
			title : 'Dinner',
			start : '2022-01-12T20:00:00'
		}, {
			title : 'Birthday Party',
			start : '2022-01-13T07:00:00'
		}, {
			title : 'Click for Google',
			url : 'http://google.com/', // 클릭시 해당 url로 이동
			start : '2022-01-28'
		} ]

	});
	calendar.render(); // 그려줘!!!

	calendar.on('dateClick', function(info) {
		alert(info.dateStr + "날짜를 눌렀냐!!");
	});
});
</script>
<style type="text/css">
</style>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>
