<%@page import="javax.mail.internet.MimeUtility"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="java.io.File"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.BodyPart"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%-- 1. 데이터 받기 --%>
	<%
		request.setCharacterEncoding("UTF-8");
		// 입력값 받음
		String uploadPath = application.getRealPath("/upload/");
		// 지정 폴더가 없으면 에러가 발생할 소지가 있으므로 폴더가 없으면 자동으로 만들어 지도록 한다.
		File file = new File(uploadPath);
		if(! file.exists()){
			file.mkdirs();
		}
		
		int maxFileSize = 10 * 1024 * 1024; // 업로드 크기 제한
		String filename="";
		long fileSize = 0;
		
		try{
			// 이 순간 모든 업로드가 이루어 진다.			
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize,"UTF-8", new DefaultFileRenamePolicy());
			
			String from  = multi.getParameter("from");
			String password  = multi.getParameter("password");
			String to  = multi.getParameter("to");
			String subject  = multi.getParameter("subject");
			String content  = multi.getParameter("content");
			
			// SMTP 서버에 접속하기 위한 정보들
			Properties p = new Properties(); // 정보를 담을 객체
			p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP 또는 gmail SMTP
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			
			// 이메일 인증 정보를 익명 클래스로 만들었다.
			Session mailSession = Session.getInstance(p, new Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(from, password);
				}
			});
			mailSession.setDebug(true); // 디버그 모드로 실행
			
			MimeMessage message = new MimeMessage(mailSession); // 메일의 내용을 담을 객체

			Address fromAddress = new InternetAddress(from); // 보내는 사람
			message.setFrom(fromAddress);
			
			Address toAddress = new InternetAddress(to);     // 받는 사람
			message.addRecipient(Message.RecipientType.TO, toAddress);
			
			message.setSubject(subject); // 제목 넣고
			
			// 파일을 첨부해서 메일 보내기
			Multipart multipart = new MimeMultipart();
			// 1. 내용 만들기
			BodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent(content, "text/html;charset=UTF-8");
			
			multipart.addBodyPart(bodyPart);
			
			// 2. 첨부된 모든파일을 BodyPart로 만들어 첨부한다.
			Enumeration<String> fieldNames = multi.getFileNames();
			while(fieldNames.hasMoreElements()){
				String fieldName = fieldNames.nextElement();
				File file2 = multi.getFile(fieldName);
				if(file2!=null){
					// 첨부된 파일이 있으면 
					BodyPart filePart = new MimeBodyPart();
					FileDataSource fds = new FileDataSource(file2);
					filePart.setDataHandler(new DataHandler(fds));
					// 첨부된 파일의 이름에 한글이 있을 경우 한글이 깨진다.
					// 한글이 깨지지 않으려면 MimeUtility.encodeText()로 이름을 인코딩해야 한다.
					filePart.setFileName(MimeUtility.encodeText(multi.getOriginalFileName(fieldName)));

					multipart.addBodyPart(filePart);
				}
			}
			
			// 모든 것이 첨부된 내용을 메일 객체의 몸통으로 지정
			message.setContent(multipart);
			// 메일 전송
			Transport.send(message);			
			
		}catch(Exception e){
			e.printStackTrace();
			out.println("<script>alert('Send Mail Failed..');history.back();</script>");
			// 오류 발생시 뒤로 돌아가도록
			return;
		}
		out.println("<script>alert('Send Mail Success!!');location.href='mailForm1.jsp'</script>");
	%>
</body>
</html>