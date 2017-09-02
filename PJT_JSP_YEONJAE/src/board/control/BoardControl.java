package board.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.command.Command;
import board.command.CommandDelete;
import board.command.CommandException;
import board.command.CommandInput;
import board.command.CommandList;
import board.command.CommandModify;
import board.command.CommandNull;
import board.command.CommandReply;
import board.command.CommandView;



public class BoardControl extends HttpServlet {
	
	private HashMap commandMap;
	private String	jspDir = "/04_board_class/";
	private String  error = "error.jsp";

    public BoardControl() {
        super();
        initCommand();
    }
    
	private void initCommand(){
		commandMap = new HashMap();

		commandMap.put("main-page",	new CommandNull("main.jsp") ); //메인
		commandMap.put("list-page",	new CommandList("BoardList.jsp") ); //목록
		
		commandMap.put("input-page", new CommandNull("BoardInputForm.jsp") ); //글쓰기
		commandMap.put("save-page",	new CommandInput("BoardSave.jsp") ); // 저장
		
		commandMap.put("view-page",	new CommandView("BoardView.jsp") ); // 내용보기
		
		commandMap.put("reply-form", new CommandNull("BoardReplyForm.jsp") ); // 답글달기
		commandMap.put("reply-page", new CommandReply("BoardReply.jsp") ); // 답글확인
		
		commandMap.put("modify-form", new CommandView("BoardModifyForm.jsp") ); // 수정
		commandMap.put("modify-page", new CommandModify("BoardModify.jsp") ); // 수정확인
		
		commandMap.put("delete-form", new CommandNull("BoardDeleteForm.jsp") ); // 삭제(암호입력)
		commandMap.put("delete-page", new CommandDelete("BoardDelete.jsp") ); // 삭제확인
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "main-page";
		}

		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey.toLowerCase() ) ){
				cmd = (Command)commandMap.get( cmdKey.toLowerCase());
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request );

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
