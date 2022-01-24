<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="java.io.File"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.BodyPart"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Transport"%>
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
		String from = request.getParameter("from");
		String password = request.getParameter("password");
		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
	%>
	<%-- 2. 메일 보내기 --%>
	<%
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
	
		try{
			
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
		
		Address toAddress = new InternetAddress(to); // 받는사람
		message.addRecipient(Message.RecipientType.TO, toAddress); 

		message.setSubject(subject); // 제목 넣고
		//-------------------------------------------------------------------------------
		
		// 파일을 첨부해서 메일 보내기
		Multipart multipart = new MimeMultipart();
		// 1. 내용만들기
		BodyPart bodyPart = new MimeBodyPart();
		bodyPart.setContent(content, "text/html;charset=UTF-8");
		
		multipart.addBodyPart(bodyPart);
		
		// 2. 파일 만들고
		BodyPart filePart = new MimeBodyPart();
		File file = new File(application.getRealPath("sendMail2.jsp")); 
		FileDataSource fds = new FileDataSource(file);
		filePart.setDataHandler(new DataHandler(fds));
		filePart.setFileName(fds.getName());
		
		multipart.addBodyPart(filePart);
		// 3. 전송 
		message.setContent(multipart);
		Transport.send(message);
		} catch(Exception e){
			e.printStackTrace();
			out.println("<script>alert('Send Mail Failed..');history.back();</script>");
			// 오류 발생시 뒤로 돌아가도록
			return;
		}
		out.println("<script>alert('Send Mail Success!!');location.href='mailForm1.jsp'</script>");
	;
		
	%>
</body>
</html>