package kr.green.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Now
 */
@WebServlet({ "/Now", "/now", "/today.it" })
public class Now extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Now() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		out.append("Server at: " ).append(request.getContextPath());
		SimpleDateFormat sdf=new SimpleDateFormat("yyy년 MM월 dd일 hh:mm:ss.S");
		/*
		response.getWriter().append("<hr>");
		response.getWriter().append("<hr2>");
		response.getWriter().append("현재 : " + sdf.format(new Date()));
		response.getWriter().append("</hr2>");
		*/
		out.print("<hr>");
		out.print("<hr2>");
		out.print("<hr>");
		out.print("</hr>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
