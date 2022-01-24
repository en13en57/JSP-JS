<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 결과!!!</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
// 파일이 넘어오는지 파일 내용이 넘어오는지를 판단해준다. 
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if(isMultipart){
	// 파일 전송 폼이라면 : enctype="multipart/form-data"이 있느냐?
	// DiskFileItemFactory 객체 생성
	DiskFileItemFactory factory = new DiskFileItemFactory();

	//------------------------------------- 생략가능
	// ServletContext 정보 얻기
	ServletContext servletContext = this.getServletConfig().getServletContext();
	// 임시 폴더의 정보 얻기
	File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
	// 임시 폴더 지정
	factory.setRepository(repository);
	//------------------------------------- 생략가능

	// ServletFileUpload 객체 생성
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	// 업로드 파일 최대 크기 지정 -------- 생략가능
	upload.setSizeMax(1024*1024*10); // 최대 10MB지정
	
	// 넘어온 모든 정보를 파싱해서 리스트에 넣는다.
	List<FileItem> items = upload.parseRequest(request);		
	
	// 이제 리스트를 반복하며 원하는 처리를 해주면 된다.
	for(FileItem item : items){
		if (item.isFormField()) { // 일반 폼태그라면
			String fieldName = item.getFieldName();
	        String note = item.getString("UTF-8"); // 한글이 깨지지 않으려면 반드시 인코딩 타입을 지정해줘야 한다.
			out.println(fieldName + " : " + note + "<br>");
	    } else { // 파일이라면
	    	String fieldName = item.getFieldName(); 	// 필드명
	        String fileName = item.getName();			// 파일이름
	        String contentType = item.getContentType();	// 파일 종류
	        boolean isInMemory = item.isInMemory();		// 메모리에 저장여부
	        long sizeInBytes = item.getSize();			// 파일 크기
	        
	        // --------------------------------------------------------------------------------
	        // IE인 경우 item.getName();했을 경우 경로까지 넘어온다. 나는 파일 이름만 필요하다.
	        if(fileName.contains(File.separator)){ // 경로 구분자가 있다면
	        	int index = fileName.lastIndexOf(File.separator); // 뒤에서 부터 경로 구분자의 위치를 찾는다.
	        	fileName = fileName.substring(index+1); // 그 위치부터 잘라낸다.
	        }
	        // --------------------------------------------------------------------------------
	        out.println(fieldName + " : " + fileName + "<br>");
	        out.println("파일 종류 : " + contentType + "<br>");
	        out.println("메모리에 저장여부 : " + isInMemory + "<br>");
	        out.println("파일 크기 : " + sizeInBytes + "<br>");
	        
	        // 실제 파일을 서버의 특정 위치에 저장을 해줘야 나중에 원하는 처리가 가능하다.
	        // 서버에 저장할 경로 설정
	        File path = new File(application.getRealPath("/upload/")); 
	        // 경로가 없다면 폴더를 만들어 준다.
	        if(!path.exists()){
	        	path.mkdirs();
	        }
	        // 지정 경로에 파일 복사 -- 이름 중복으로 인한 겹쳐쓰기를 방지하기 위해서 유일한 이름을 만들어 저장을 하고
	        // 원본의 이름과 사본의 이름을 DB에 저장해 두었다가 다운로드시 원본의 이름으로 바꿔서 다운로드하게 하면된다.
	        String saveFilleName = UUID.randomUUID().toString(); // 겹치지않는 ID를 만들어준다. -- 저장파일명으로 쓰자!!
	        item.write(new File(path + File.separator + saveFilleName));
	        out.println("저장 파일 : " + path + File.separator + saveFilleName + "<br>");
	        
	        // 다운로드를 구현해보자
	        // 일반 링크를 사용해보자 -- 브라우져가 해석 가능한 파일은 그냥 보여주고 그렇지 않은 파일은 저장할까요?를 물어본다.
			// 일반 링크를 걸면 다운로드가 되지 않는다.	        		
	        out.println("<a href='" + path + File.separator + saveFilleName + "'>" + fileName + "</a><br>");
	        
	        // 다운로드 받는 파일을 별도로 만들어서 처리해야 다운로드가 가능하다.
	    	// 모든 파일을 다운로드 가능하게 하려면 다음과 같이 해야 한다.
	        String of = URLEncoder.encode(fileName,"UTF-8"); // 원본 파일 이름
	        String sf = URLEncoder.encode(saveFilleName,"UTF-8"); // 저장 파일 이름
	        out.println("<a href='download.jsp?of="+of+"&sf="+sf+"'>" + fileName + "</a><br><hr>");
	    }	
	}
}else{
	// 일반폼이라면 : enctype="multipart/form-data" 없느냐?
	out.println("<script>alert('파일 전송이 아닙니다. 폼에 enctype속성이 있는지 확인해 주세요!!');</script>");
	out.println("<script>location.href='uploadForm1.jsp'</script>");
}
%>
</body>
</html>