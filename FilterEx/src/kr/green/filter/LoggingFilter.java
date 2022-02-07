package kr.green.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
// 모든 자원의 실행시간을 출력해주는 필터!!!
@WebFilter("/*") // 필터 자동 등록
public class LoggingFilter implements Filter {
	// 생성자
    public LoggingFilter() {

    }
    // 소멸될 때 1번 작동
	public void destroy() {

	}
	// 요청시 마다 작동
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 요청을 변경할 때 이부분에 사용
		System.out.println("선처리~~~~~~~~~~~~~~");
		long start = System.currentTimeMillis();
		
		chain.doFilter(request, response);
		
		// 응답을 변경할 때 사용
		System.out.println("후처리~~~~~~~~~~~~~~");
		long end = System.currentTimeMillis();
		HttpServletRequest req = (HttpServletRequest)request;
		System.out.print(req.getRequestURI());
		System.out.println(" 실행시간 : " + (end - start) + "ms");
	}
	// 로딩될 때 1번 작동
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
