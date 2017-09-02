package qa.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.command.*;

public class QaControl extends HttpServlet {
	
	private HashMap<String,Command> commandMap;
	private String DEFAULT_PAGE = "list";
	
    public QaControl() {
        super();       
		initCommand();
	}

	private void initCommand(){
		commandMap = new HashMap<>();
		commandMap.put("list",		new QaListCommand() );
		commandMap.put("detail",	new QaDetailCommand() );//1개의 글을 갖고 오는거
		commandMap.put("write",		new QaWriteCommand() );
		commandMap.put("insert",	new QaInsertCommand() );
		commandMap.put("update",	new QaUpdateCommand() );
		commandMap.put("update2",	new QaUpdate2Command() );
		commandMap.put("delete",	new QaDeleteCommand() );
		commandMap.put("updatePassCheck",	new QaUpdatePassCheckCommand() );
		commandMap.put("reple", new QaRepleCommand());
		
		//sh
		commandMap.put("shlist",  new ShListCommand() );
		commandMap.put("shinsert",  new ShInsertCommand() );
		//추천
		
		commandMap.put("up", new UpCommand());
				
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		Command cmd = null;
			
			cmd = commandMap.get(cmdKey);
			if(cmd==null){
				cmd = commandMap.get(DEFAULT_PAGE);
			}
			nextPage = cmd.execute( request,response );

			System.out.println("cmd : "+cmdKey);
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( nextPage );
		reqDp.forward( request, response );
		
	}

}
