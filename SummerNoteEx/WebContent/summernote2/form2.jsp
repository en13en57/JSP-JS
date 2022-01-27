<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(function() {
		$('#summernote').summernote(
				{
					lang : 'ko-KR', // default: 'en-US'
					height : 300, // set editor height
					minHeight : null, // set minimum height of editor
					maxHeight : null, // set maximum height of editor
					fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
							'Comic Sans MS', 'Courier New', ],
					fontNamesIgnoreCheck : [ '맑은고딕' ],
					focus : true,
					// 이미지가 1MB를 넘을 경우 수동으로 업로드를 처리하고, 실행될 코드를 지정
					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							for (var i = files.length - 1; i >= 0; i--) {
								sendFile(files[i], this);
							}
						}
					}
				});
	});
	// 실제 업로드되는 서버의 파일을 Ajax로 호출해 줘야한다.
	function sendFile(file, el) {
		// 폼 작성
		var form_data = new FormData();
      	form_data.append('file', file);
      	// Ajax 호출
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: 'imageUpload.jsp', // 이미지 업로드 해주는 파일 직접 만들어야함
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) { // Ajax가 성공 하면
          		$(el).summernote('editor.insertImage', img_name); // 이미지 이름 
        	}
      	});
    }
</script>
</head>
<body>
	<form action="result2.jsp" method="post">
		<input type="text" size="60" name="subject"><br>
		<textarea id="summernote" name="note"></textarea>
		<input type="submit" value="전송">
	</form>
</body>
</html>