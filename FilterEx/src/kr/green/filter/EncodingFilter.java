package kr.green.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// @WebFilter("/*")
public class EncodingFilter implements Filter {

	private String charSet;
	
	public EncodingFilter() {
		
	}

	public void destroy() {
		
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 읽어들인 문자셑으로 인코딩 타입 지정
		request.setCharacterEncoding(charSet);
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// 초기화 파라메터를 읽어서 변수에 저장
		charSet = fConfig.getInitParameter("charset");
	}

}
