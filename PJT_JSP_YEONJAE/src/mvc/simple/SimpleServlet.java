package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SimpleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String jspDir = "/05_mvc_class/1_mvcSimple/";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String value = "";
		
		if(type == null) value = "안녕하세요";
		else if(type.equals("first")) value = "홍길동님 화이팅!";
		
		request.setAttribute("param", value);
		
		RequestDispatcher disp = request.getRequestDispatcher(jspDir + "simpleView.jsp");
		disp.forward(request, response);
	}
}
