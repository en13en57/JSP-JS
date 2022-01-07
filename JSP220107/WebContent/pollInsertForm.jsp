
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 등록 하기</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<script type="text/javascript">
var max = 10, min = 2, count = 2;
function addFile(){
	if(count==max){
		alert('최대 ' + max + "개의 항목까지만 지원 합니다.");
		return;
	}
	// 태그 추가
	++count;
	// div태그 만들고 속성 추가
	var divTag = document.createElement("div");
	divTag.id = "item"+count;
	// 텍스트노드 만들고 div태그에 추가
	var textNode = document.createTextNode("항목 " + (count<10 ? "0"+count : count) + " : ");
	divTag.appendChild(textNode);
	// input 태그 만들고 div태그에 추가
	var inputTag = document.createElement("input");
	inputTag.type="text";
	inputTag.name="item";
	inputTag.size="62";
	divTag.appendChild(inputTag);
	// div태그를 filebox에 추가
	document.getElementById("itembox").appendChild(divTag);
}
function removeFile(){
	if(count==min){
		alert('최소 ' + min + "개의 항목은 존재해야 합니다.");
		return;
	}
	// 태그 제거
	var removeTag = document.getElementById("item"+count);
	document.getElementById("itembox").removeChild(removeTag);
	--count;
}
</script>
<style type="text/css">
	table {
		width: 550px; border: 1px solid gray; margin: auto;	padding: 5px;
	}
	.title {
		background-color: black; color: white; text-align: center;
		font-size: 15pt; font-weight: bold; padding: 5px;
	}
	.subject {
		font-size: 12pt; font-weight: bold; padding: 5px;
	}
</style>
</head>
<body>
	<form action="pollInsertOk.jsp" method="post">
	<table>
		<tr>
			<td class="title">설문조사 등록 프로그램 Ver 1.0</td>
		</tr>
		<tr>
			<td class="subject">
				설문제목 : <input type="text" name="subject" id="subject" size="60" /> 
			</td>
		</tr>
		<tr>
			<td class="subject">
				시작일 : <input type="date" name="startDate" id="startDate"/> 
				종료일 : <input type="date" name="endDate" id="endDate"/> 
			</td>
		</tr>
		<tr>
			<td>
				<hr />
				<input type="button" onclick="addFile()" value="항목추가">
				<input type="button"  onclick="removeFile()" value="항목삭제">
				<br /><hr />
				<div id="itembox">
					<div id="item1">
						항목 01 : <input type="text" name="item" size="62"/>
					</div>
					<div id="item2">
						항목 02 : <input type="text" name="item" size="62"/>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit"  class="btn btn-outline-success btn-sm" value="등록하기" />
				<input type="button" class="btn btn-outline-success btn-sm" value="목록으로" onclick="location.href='pollList.jsp'"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>