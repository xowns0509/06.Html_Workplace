package member.command;

import javax.servlet.http.HttpServletRequest;

public class MemberCommandNull implements MemberCommand{
	private String next;
	
	public MemberCommandNull(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws MemberCommandException {
		
		return next;
	}

}
