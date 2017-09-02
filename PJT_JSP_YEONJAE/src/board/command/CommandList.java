package board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.model.BoardDao;
import board.model.BoardException;
import board.model.BoardRec;


public class CommandList implements Command 
{
	private String next;

	public CommandList( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ) throws CommandException{
		try{
			
		    List <BoardRec> mList = BoardDao.getInstance().selectList();	
		    request.setAttribute("param", mList );

		}catch( BoardException ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
