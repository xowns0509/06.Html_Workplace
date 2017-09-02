package board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.model.BoardDao;
import board.model.BoardException;
import board.model.BoardRec;

public class CommandView implements Command{
	private String next;

	public CommandView( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ) throws CommandException{
		try{
			int article_id = 0;
			String id = request.getParameter("id");
			
			if( id != null ) article_id = Integer.parseInt(id);
			
			BoardDao dao = BoardDao.getInstance();
			BoardRec rec = dao.selectById(article_id);		
//			dao.increaseReadCount(id);
			
			request.setAttribute("param", rec);
		}catch( BoardException ex ){
			throw new CommandException("CommandView.java < 내용보기시 > " + ex.toString() ); 
		}
		return next;
	}

}
