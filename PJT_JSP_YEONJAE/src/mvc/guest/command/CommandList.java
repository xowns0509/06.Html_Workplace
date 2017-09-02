package mvc.guest.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mbts.mvcGuest.model.Message;
import mbts.mvcGuest.session.MessageSessionRepository;


public class CommandList implements Command 
{
	private String next; 

	public CommandList( String _next ){
		next = _next;
	}
	
	private MessageSessionRepository repository = new MessageSessionRepository();

	public String execute( HttpServletRequest request ) throws CommandException{
		List<Message> mList = repository.select();	
		request.setAttribute("param", mList );
		
		return next;
	}
}
