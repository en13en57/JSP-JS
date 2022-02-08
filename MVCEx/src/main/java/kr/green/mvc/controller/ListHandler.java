package kr.green.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// 여기서 서비스클래스를 호출하여 비지니스 로직을 수행한다.
		
		// 수행한 결과를 영역에 저장한다.
		request.setAttribute("msg", "게시판 리스트 입니다......");
		
		// 뷰페이지를 리턴한다.
		return "list";
	}

}
