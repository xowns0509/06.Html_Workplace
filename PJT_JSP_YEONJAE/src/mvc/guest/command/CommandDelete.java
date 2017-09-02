package mvc.guest.command;

import javax.servlet.http.HttpServletRequest;

import mbts.mvcGuest.model.MessageException;
import mbts.mvcGuest.session.MessageSessionRepository;


public class CommandDelete implements Command {
	private String next;

	public CommandDelete( String _next ){
		next = _next;
	}
	
	private MessageSessionRepository repository = new MessageSessionRepository();
	
	@Override
	public String execute(HttpServletRequest request) throws CommandException {
		int messageId = Integer.parseInt(request.getParameter("messageId"));
		String password = request.getParameter("password");
		
		int resultCnt = repository.delete(messageId, password);
		
		request.setAttribute("result", resultCnt);
		
		return next;			
	}

}
