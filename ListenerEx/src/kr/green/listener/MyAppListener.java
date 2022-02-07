package kr.green.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.annotation.WebListener;

/**
 * 애플리케이션 영역에 값이 변경될 때(특정 이벤트가 발생할 때) 자동으로 처리되는 리스너
 *
 */
@WebListener
public class MyAppListener implements ServletContextAttributeListener {

	// 속성이 추가될때 자동으로 실행
	public void attributeAdded(ServletContextAttributeEvent event)  { 
		System.out.println("애플리케이션 영역에 속성이 추가됨");
	}
	// 속성이 제거될때 자동으로 실행
    public void attributeRemoved(ServletContextAttributeEvent event)  { 
    	System.out.println("애플리케이션 영역에 속성이 제거됨");

    }
    // 속성이 변경될때 자동으로 실행
    public void attributeReplaced(ServletContextAttributeEvent event)  { 
    	System.out.println("애플리케이션 영역에 속성이 변경됨");

    }
	
}
