package learn.control;

import java.io.IOException;
import java.net.StandardSocketOptions;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import learn.command.LearnCommand;
import learn.command.LearnCommandDelete;
import learn.command.LearnCommandException;
import learn.command.LearnCommandInsert;
import learn.command.LearnCommandList;
import learn.command.LearnCommandModify;
import learn.command.LearnCommandModifyView;
import learn.command.LearnCommandNull;
import learn.command.LearnCommandView;

public class LearnControl extends HttpServlet{
	private HashMap commandMap;
	private String jspDir="/1_info/";

	public LearnControl(){
		super();
		initCommand(); 
	}

	private void initCommand(){
		commandMap=new HashMap();

		//모두의 이론 리스트 보여주기
		commandMap.put("main-page",new LearnCommandNull("index.jsp"));
		commandMap.put("learnlist",new LearnCommandList("1_InfoMain.jsp"));
		
		//글쓰기
		commandMap.put("learn-page", new LearnCommandNull("1_LearnWrite.jsp"));
		commandMap.put("learnwrite", new LearnCommandInsert("1_LearnWriteConfirm.jsp"));
		
		//게시글 보기
		commandMap.put("view-page", new LearnCommandView("1_LearnView.jsp"));
		
		//수정하기
		commandMap.put("modify-pass", new LearnCommandNull("1_LearnModifyPassConfirm.jsp"));
		commandMap.put("modify-form",new LearnCommandModifyView("1_LearnModify.jsp"));
		commandMap.put("modify-page", new LearnCommandModify("1_LearnModifyConfirm.jsp"));
		
		//삭제하기
		commandMap.put("delete-form", new LearnCommandNull("1_LearnDelete.jsp"));
		commandMap.put("delete-page", new LearnCommandDelete("1_LearnDeleteConfirm.jsp"));
		
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

		LearnCommand cmd = null;
		try {
			if (commandMap.containsKey(cmdKey.toLowerCase())) {
				cmd = (LearnCommand) commandMap.get(cmdKey.toLowerCase());
			} else {
				throw new LearnCommandException("지정할 명령어가 존재하지 않음");
			}
			nextPage = cmd.execute(request);

		} catch (LearnCommandException e) {
			request.setAttribute("javax.servlet.jsp.jspException", e);
			System.out.println("LearnControl 오류 : " + e.getMessage());
			e.printStackTrace();
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(jspDir + nextPage);
		reqDp.forward(request, response);
	}
}
