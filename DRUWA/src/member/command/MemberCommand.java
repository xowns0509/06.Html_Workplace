package member.command;

import javax.servlet.http.HttpServletRequest;

public interface MemberCommand {
	public String execute( HttpServletRequest request ) throws MemberCommandException;
}
