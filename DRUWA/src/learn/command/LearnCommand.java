package learn.command;

import javax.servlet.http.HttpServletRequest;

public interface LearnCommand {
	public String execute( HttpServletRequest request ) throws LearnCommandException;
}
