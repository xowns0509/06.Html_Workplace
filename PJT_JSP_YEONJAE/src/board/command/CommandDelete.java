package board.command;

import javax.servlet.http.HttpServletRequest;

import board.model.BoardDao;
import board.model.BoardException;

public class CommandDelete implements Command {
	private String next;

	public CommandDelete( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request) throws CommandException {
		// TODO Auto-generated method stub
		try{		
			int articleId = Integer.parseInt(request.getParameter("articleId"));
			String password = request.getParameter("password");
			
			int result = BoardDao.getInstance().delete(articleId, password);
			
			request.setAttribute("result", result);
		}catch( BoardException ex ){
			throw new CommandException("CommandDelete.java < 삭제시 > " + ex.toString() ); 
		}
		
		return next;			
	}

}
