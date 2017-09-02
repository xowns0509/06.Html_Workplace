package algo.command;

import javax.servlet.http.HttpServletRequest;

public class AlgoCommandNull implements AlgoCommand{
	private String next;
	
	public AlgoCommandNull(String _next){
		next=_next;
	}
	public String execute(HttpServletRequest request) throws AlgoCommandException {
		
		return next;
	}
	

}
