package hire.command;

import javax.servlet.http.HttpServletRequest;

public class HireCommandNull implements HireCommand{
	private String next;

	public HireCommandNull( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ) throws HireCommandException{
		return next;
	}

}