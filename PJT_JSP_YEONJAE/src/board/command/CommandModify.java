package board.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import board.model.BoardDao;
import board.model.BoardException;
import board.model.BoardRec;

public class CommandModify implements Command{
	private String next;

	public CommandModify( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ) throws CommandException{
		try{
			BoardRec rec = new BoardRec();
			rec.setArticleId(Integer.parseInt(request.getParameter("articleId")));
			rec.setTitle(request.getParameter("title"));
			rec.setContent(request.getParameter("content"));
			rec.setPassword(request.getParameter("password"));
			
			// DB update
			int result = BoardDao.getInstance().update(rec);
			String articleId = request.getParameter("articleId");
			
			request.setAttribute("result", result);
		}catch( BoardException ex ){
			throw new CommandException("CommandModify.java <수정하기> " + ex.toString() ); 
		}
		return next;
	}

}

