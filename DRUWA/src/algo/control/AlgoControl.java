package algo.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import algo.command.AlgoCommand;
import algo.command.AlgoCommandException;
import algo.command.AlgoCommandInsert;
import algo.command.AlgoCommandNull;

public class AlgoControl extends HttpServlet{
	private HashMap commandMap;
	private String jspDir="/1_info/";
	
	public AlgoControl(){
		super();
		initCommand();
	}

	private void initCommand() {
		commandMap=new HashMap();
		
		commandMap.put("main-page", new AlgoCommandNull("index.jsp"));
		
		//페이지 보여주기
		commandMap.put("algo-page", new AlgoCommandNull("2_Algo.jsp"));
		commandMap.put("show-algo6", new AlgoCommandNull("2_AlgoNexon.jsp"));
		
		//제출하기 등록
		commandMap.put("algo-write",new AlgoCommandInsert("submitQuiz.jsp"));
		
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

		AlgoCommand cmd = null;
		try {
			if (commandMap.containsKey(cmdKey.toLowerCase())) {
				cmd = (AlgoCommand) commandMap.get(cmdKey.toLowerCase());
			} else {
				throw new AlgoCommandException("지정할 명령어가 존재하지 않음");
			}
			nextPage = cmd.execute(request);

		} catch (AlgoCommandException e) {
			request.setAttribute("javax.servlet.jsp.jspException", e);
			System.out.println("AlgoControl 오류 : " + e.getMessage());
			e.printStackTrace();
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(jspDir + nextPage);
		reqDp.forward(request, response);
	}

}
