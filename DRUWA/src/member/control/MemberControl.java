package member.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.command.MemberCommand;
import member.command.MemberCommandException;
import member.command.MemberCommandInsert;
import member.command.MemberCommandNull;
import member.command.MemberCommandSearch;

public class MemberControl extends HttpServlet{
	private HashMap commandMap;
	private String jspDir="/0_member/";
	
	public MemberControl(){
		super();
		initCommand();
	}
	
	//연결
	private void initCommand(){
		commandMap=new HashMap();
		
		
		commandMap.put("main-page", new MemberCommandNull("index.jsp"));
		
		//회원가입 등록
		commandMap.put("enroll-page", new MemberCommandNull("MemberEnroll.jsp"));
		commandMap.put("enroll-confirm", new MemberCommandInsert("MemberEnrollConfirm.jsp"));
		
		//로그인
		commandMap.put("login-page", new MemberCommandSearch("../index.jsp"));
		
		//로그인이 안되어 있으면 로그인 페이지로 넘기기
		commandMap.put("please-login-page", new MemberCommandNull("../loginPlease.jsp"));
		
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey = request.getParameter("cmd");
		if (cmdKey == null) {
			cmdKey = "main-page";
		}

		MemberCommand cmd = null;

		try {

			if (commandMap.containsKey(cmdKey.toLowerCase())) {
				cmd = (MemberCommand) commandMap.get(cmdKey.toLowerCase());
			} else {
				throw new MemberCommandException("지정할 명령어가 존재하지 않음");
			}
			nextPage = cmd.execute(request);

		} catch (MemberCommandException e) {
			request.setAttribute("javax.servlet.jsp.jspException", e);
			System.out.println("오류 : " + e.getMessage());
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(jspDir + nextPage);
		reqDp.forward(request, response);
	}
	
}
