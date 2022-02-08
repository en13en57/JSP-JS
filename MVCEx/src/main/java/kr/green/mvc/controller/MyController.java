package kr.green.mvc.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyController
 */
@WebServlet("/")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 모든 명령 객체를 담아놓을 맵
	private Map<String, Object> map = new HashMap<String, Object>();

	@Override // 서블릿이 로드 될때 1번실행
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// 설정 파일을 읽어서 맵에 모두 저장해 놓는다.
		String configFile = config.getServletContext().getInitParameter("configFile");
		System.out.println("설정 파일명 : " + configFile);
		// 설정파일인 프로퍼티 파일을 읽기 위한 객체 생성
		Properties prop = new Properties();
		// 프로퍼티 파일 읽기
		FileReader fr=null;
		try {
			fr = new FileReader(config.getServletContext().getRealPath(configFile)); // 리더객체 생성
			prop.load(fr); // 읽기
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fr!=null) fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 읽은 내용을 반복
		Iterator<Object> it = prop.keySet().iterator();
		while(it.hasNext()) {
			String command = (String) it.next(); // 명령
			String className = prop.getProperty(command); // 명령 클래스이름
			try {
				// 클래스이름이 아니라 이름의 객체가 필요하다.
				Class handler = Class.forName(className); // 클래스를 로드한다.
				Object instance = handler.newInstance();  // 읽은 클래스의 객체 생성
				// 맵에 추가
				map.put(command, instance);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} 
		}
		System.out.println("모든 명령 : " + map);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청을 URL로 받는다.
		String param = request.getRequestURI();
		int index = param.indexOf(request.getContextPath())+request.getContextPath().length()+1; 
		param = param.substring(index);
		String[] cmds = param.split("/");
		String cmd = cmds[0]; // 명령
		
		// 2. 명령에 해당되는 객체를 얻는다.
		CommandHandler handler = null;
		if(map.containsKey(cmd)) { // 명령이 존재하면 명령 객체를 얻어 온다.
			handler = (CommandHandler) map.get(cmd);
		}else {
			handler = new NullHandler();
		}
		// 3. 명령에 대한 처리를 하고 뷰페이지를 리턴 받는다.
		String viewPage = handler.process(request, response);
		
		// 4. 뷰페이지로 포워딩 시킨다.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/" + viewPage + ".jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
