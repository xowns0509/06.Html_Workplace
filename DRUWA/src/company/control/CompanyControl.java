package company.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import company.command.ComapnyCommandInsert;
import company.command.CompanyCommand;
import company.command.CompanyCommandException;
import company.command.CompanyCommandNull;
import company.command.CompanyCommandSearch;
import member.command.MemberCommandNull;

public class CompanyControl extends HttpServlet{
	private HashMap commandMap;
	private String jspDir="/0_member/";
	
	public CompanyControl(){
		super();
		initCommand();
	}
	
	//연결
	private void initCommand(){
		commandMap=new HashMap();
		
		//메인화면연결
		commandMap.put("main-page", new CompanyCommandNull("index2.jsp"));
		
		//기업 회원가입 등록
		commandMap.put("enrollcom-page", new CompanyCommandNull("MemberEnrollCompany.jsp"));
		commandMap.put("enroll-confirm", new ComapnyCommandInsert("MemberEnrollConfirm.jsp"));
		
		//기업 로그인
		commandMap.put("login-page", new CompanyCommandSearch("../index2.jsp"));
		
		//로그인 안되어 있으면 로그인 페이지로 넘기기
		commandMap.put("please-login-page", new CompanyCommandNull("../loginPlease2.jsp"));

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

		CompanyCommand cmd = null;
		try {

			if (commandMap.containsKey(cmdKey.toLowerCase())) {
				cmd = (CompanyCommand) commandMap.get(cmdKey.toLowerCase());
			} else {
				throw new CompanyCommandException("지정할 명령어가 존재하지 않음");
			}
			nextPage = cmd.execute(request);

		} catch (CompanyCommandException e) {
			request.setAttribute("javax.servlet.jsp.jspException", e);
			System.out.println("오류 : " + e.getMessage());
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(jspDir + nextPage);
		reqDp.forward(request, response);
	}

}
