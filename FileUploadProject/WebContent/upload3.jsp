<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cos라이브러리를 이용한 파일 업로드</title>
</head>
<body>
	<%
		String uploadPath = application.getRealPath("/upload/");
		// 지정 폴더가 없으면 에러가 발생할 소지가 있으므로 폴더가 없으면 자동으로 만들어 지도록 한다.
		File file = new File(uploadPath);
		if(! file.exists()){
			file.mkdirs();
		}
		
		int maxFileSize = 10 * 1024 * 1024; // 업로드 크기 제한
		String filename="", name="", note="";
		long fileSize = 0;
		
		try{
			// 이 순간 모든 업로드가 이루어 진다.			
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize,"UTF-8", new DefaultFileRenamePolicy());
			// 일반필드 받기
			name = multi.getParameter("name");
			note = multi.getParameter("note");
			out.println("이름 : " + name + "<br>");
			out.println("설명 : " + note + "<br>");
			
			// 파일 받기
			Enumeration<String> fieldNames = multi.getFileNames(); // 필드명 리스트를 받는다.
			while(fieldNames.hasMoreElements()){
				String fieldName = fieldNames.nextElement(); // 필드명 읽기
				File   file2 = multi.getFile(fieldName);							// 실제 파일
				if(file2!=null && file2.length()>0){
					String originalFileName = multi.getOriginalFileName(fieldName); // 원본 파일 이름
					String saveFileName = multi.getFilesystemName(fieldName);		// 저장 파일 이름
					String contentType = multi.getContentType(fieldName);			// 파일 종류
					fileSize = file2.length();										// 파일 크기
					out.println("원본 파일명 : " + originalFileName + "<br>");
					out.println("저장 파일명 : " + saveFileName + "<br>");
					out.println("파일 타입 : " + contentType + "<br>");
					out.println("파일 크기 : " + fileSize + "<br><hr>");
					// 일반 링크를 걸면 다운로드가 되지 않는다.
					out.println("<a href='" + uploadPath + File.separator + saveFileName + "'>" + originalFileName + "</a><br>");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>