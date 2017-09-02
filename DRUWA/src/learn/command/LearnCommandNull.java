package learn.command;

import javax.servlet.http.HttpServletRequest;

public class LearnCommandNull implements LearnCommand{
	private String next;
	
	public LearnCommandNull(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws LearnCommandException{
		return next;
	}

}
