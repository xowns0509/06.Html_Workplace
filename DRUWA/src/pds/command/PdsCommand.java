package pds.command;

import javax.servlet.http.HttpServletRequest;

public interface PdsCommand {
	public String execute( HttpServletRequest request ) throws PdsCommandException;
}
