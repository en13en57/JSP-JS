package kr.green.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * 세션리스너
 */
@WebListener
public class MySessionListener implements HttpSessionListener, HttpSessionAttributeListener {

	// 세션이 생성되면
    public void sessionCreated(HttpSessionEvent se)  {
    	// 애플리케이션 영역 객체 얻기
    	ServletContext context = se.getSession().getServletContext();
    	
    	int count = 1; // 현재 접속자 수
    	if( context.getAttribute("count")!=null ) { // 저장되어 있으면
    		Object param =  context.getAttribute("count");
    		count = Integer.parseInt(param.toString()) + 1; // 읽어서 1증가
    		System.out.println("현재 : " + count);
    	}
    	context.setAttribute("count", count); // 다시 저장
    }

	// 세션이 소멸되면
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	// 애플리케이션 영역 객체 얻기
    	ServletContext context = se.getSession().getServletContext();
    	int count = 0; // 현재 접속자 수
    	if(context.getAttribute("count")!=null) { // 저장되어 있으면
    		Object param =  context.getAttribute("count");
    		count = Integer.parseInt(param.toString()) - 1; // 읽어서 1감소
    		System.out.println("현재 : " + count);
    	}
    	context.setAttribute("count", count); // 다시 저장
    }

	// 세션영역에 속성이 추가될떄
    public void attributeAdded(HttpSessionBindingEvent se)  { 
    	System.out.println("세션에 변수 추가");
    	// ------------------------------------------------------------
    	// 아래 부분을 if문으로 한번더 감싸 주어야 한다. 로그인 성공시 저장되는 변수만 가능
    	if(se.getName().equalsIgnoreCase("userVO")) {
    		
    	ServletContext context = se.getSession().getServletContext();
    	Map<String, HttpSession> sessionMap=null;
    
    	// 영역에 존재하면 읽어서 사용한다.
    	if(context.getAttribute("sessionMap")!=null) {
	    	// 중복로그인을 처리하려면 
	    	// 1. 로그인 한 사람의 session을 아이디를 키로 세션을 값으로 하여 맵에 저장한다.
	    	sessionMap = (Map<String, HttpSession>)context.getAttribute("sessionMap");
	    	// 2. 맵에 동일한 아이디가 존재하면 맵에서 세션을 읽어 강제 종료 시킨다.
	    	System.out.println("name : " + se.getName());
	    	System.out.println("value : " + se.getValue());
	    	
	    // 이미 동일한 아이디가 존재한다면
    	if(sessionMap.containsKey(se.getValue())) {
    		sessionMap.get(se.getValue()).invalidate(); // 세션 강제 종료
    		}
    	}else {
    		// 존재하지 않으면 객체 생성하고
    		sessionMap = new HashMap<String, HttpSession>();
    	}
    	// 현재 세션 정보를 저장하고
    	HttpSession session = se.getSession();
    	sessionMap.put(se.getValue().toString(), session);
    	
    	context.setAttribute("sessionMap", sessionMap); // 다시 저장
    	}
    	// ------------------------------------------------------------
    }

    // 세션영역에 속성이 제거될떄
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
    	System.out.println("세션에 변수 삭제");
    }

    // 세션영역에 속성이 변경될떄
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
    	System.out.println("세션에 변수 변경");
    }
	
}
