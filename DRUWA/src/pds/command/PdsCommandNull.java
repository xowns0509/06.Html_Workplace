package pds.command;

import javax.servlet.http.HttpServletRequest;

public class PdsCommandNull implements PdsCommand{
	private String next;
	
	public PdsCommandNull(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws PdsCommandException {
		
		return next;
	}

}
