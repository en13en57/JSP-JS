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
<%-- 날짜모양 이쁘게 출력하기 위한 자바 스크립트 라이브러리 --%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<%-- 숫자를 이쁘게 출력하기 위한 자바스크립트 라이브러리 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
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
		editable: true, // 이벤트 수정 가능하게 한다.
		
		// 이벤트
		events : function(info, successCallback, failureCallback) {
			// ajax 처리로 데이터를 로딩 시킨다. 
			$.ajax({
				type : "get",
				url : "selectEvent.jsp",
				dataType : "json",
				success: function(data){
					//alert('성공\n' + data);
					// 받은 데이터를 가공한다. 입맞에 맞게....
					$.each(data, function(index, item){
						//alert(item.allday);
						if(item.allday){ // 하루 종일이면 시간이 필요 없으므로 시간을 지운다.
							//alert(item.start + "\n" + item.end);
							item.start = item.start.substr(0, 10);  
							item.end = item.end.substr(0, 10);
							//alert(item.start + "\n" + item.end);
						}else{ // 하루 중 일부라면 종료날짜를 지운거 
							//alert(item.start + "\n" + item.end);
							item.end='';
							//alert(item.start + "\n" + item.end);
						}
					});
					successCallback(data);
				},
				fail : function(){
					//('실패!!')
				}
			});
		}
	});
	calendar.render(); // 그려줘!!!
	// 날짜를 클릭했을때
	calendar.on('dateClick', function(info) {
		// 일정을 입력할 수 있는 창을 띄워 일정을 입력받아야 한다.
		alert(info.dateStr + "를 눌렀냐!!");
	});
	
	// 일정을 클릭했을때
	calendar.on('eventClick', function(info) {
		// 일정을 입력할 수 있는 창을 띄워 일정을 수정/삭제가 가능 하도록 해야 한다.
		//alert(JSON.stringify(info.event));
		//console.log(JSON.stringify(info));
		// alert(info.event.title +"\n" + info.event.start +"\n" + info.event.end +"\n" + info.event.extendedProps.content);
	});
	
	// 일정위에 마우스가 올라가면
	calendar.on('eventMouseEnter', function(info) {
		// 일정을 이쁘게 보이기
		// alert(info.jsEvent.pageX + ',' + info.jsEvent.pageY); // 이벤트가 발생한 위치
		$("#viewContent").css('display','block').css('top', info.jsEvent.pageY-210).css('left',info.jsEvent.pageX-150);
		var content = "제목 : " + info.event.title + "<br>";
		if(info.event.extendedProps.allday)
			content += "시작 : " +  moment(info.event.start).format('YYYY년 MM월 DD일') + "<br>";
		else
			content += "시작 : " +  moment(info.event.start).format('YYYY년 MM월 DD일 HH:mm') + "<br>";
			
		if(info.event.end!=null)
			if(info.event.extendedProps.allday)
				content += "종료 : " + moment(info.event.end).format('YYYY년 MM월 DD일') + "<br>";
			else
				content += "종료 : " + moment(info.event.end).format('YYYY년 MM월 DD일 HH:mm') + "<br>";
		content += "내용 : " + info.event.extendedProps.content + "<br>";
		$("#viewContent").html(content);
		// alert("하하하\n" + info.event.title +"\n" + info.event.start +"\n" + info.event.end +"\n" + info.event.extendedProps.content);
	});
	// 일정위에서 마우스가 떠나면
	calendar.on('eventMouseLeave', function(info) {
		// 일정을 숨기기
		$("#viewContent").css('display','none');
		// alert("하하하\n" + info.event.title +"\n" + info.event.start +"\n" + info.event.end +"\n" + info.event.extendedProps.content);
	});
	
	// 이벤트를 옮기면
	calendar.on('eventDrop', function(info) {
		// 일정을 수정해줘야 한다.
		alert("이동!!!!");
	});
	
	// 이벤트 크기를 볌경하면
	calendar.on('eventResizeStop', function(info) {
		// 일정을 수정해줘야 한다.
		alert("크기변경!!!!");
	});
	
	
	
});
</script>
<style type="text/css">
	#viewContent{
		width:300px; height: 200px; border: 3px solid gray; background-color: white; z-index:auto;
		position: absolute; top: 100px; left: 200px; display: none;
	}
</style>
</head>
<body>
	<div id='calendar'></div>
	<div id="viewContent">
	
	</div>
</body>
</html>