package kr.green.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SimpleController
 */
@WebServlet("/controller")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청을 받는다.
		String cmd = request.getParameter("cmd");
		
		if(cmd==null) cmd="";
		// 2. 요청한 기능을 수행한다.
		Object result = null;
		String viewPage = "";
		switch (cmd) {
		case "date":
			// 여기에서 서비스클래스를 호출하여 로직을 수행한다.
			result = new Date().toLocaleString(); 
			// 영역에 저장하고
			request.setAttribute("result", result);
			// 보여질 페이지 지정하고
			viewPage = "list"; // 보여지는 페이지가 모두 다를경우 이렇게 처리를 한다,
			break;
		case "hello":
			result = "안녕하세요 반갑습니다.";
			viewPage = "insert";
			break;
		case "hi":
			String name = request.getParameter("name");
			if(name==null) name="손";
			result = name + "님 방가방가~~~~~";
			viewPage = "update";
			break;
		default:
			result = "알수 없는 명령입니다.";
			viewPage = "error";
			break;
		}
		// 3. 처리 결과를 request나 session에 저장한다.
		request.setAttribute("result", result);
		// 4. 포워딩한다.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/view.jsp");
		// RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/" + viewPage + ".jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
