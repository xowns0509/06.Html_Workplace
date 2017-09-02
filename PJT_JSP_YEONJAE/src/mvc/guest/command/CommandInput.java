package mvc.guest.command;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import mbts.mvcGuest.model.Message;
import mbts.mvcGuest.model.MessageException;
import mbts.mvcGuest.session.MessageSessionRepository;

public class CommandInput implements Command {
	private String next;

	public CommandInput( String _next ){
		next = _next;
	}
	
	private MessageSessionRepository repository = new MessageSessionRepository();
	
	
	@Override
	public String execute(HttpServletRequest request) throws CommandException {
		Message msg = new Message();
		msg.setGuestName( request.getParameter("guestName"));
		msg.setPassword(request.getParameter("password"));
		msg.setMessage( request.getParameter("message"));
		
		repository.insert(msg);
		return next;
	}

}
