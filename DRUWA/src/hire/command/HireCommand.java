package hire.command;

import javax.servlet.http.HttpServletRequest;

public interface HireCommand {

	public String execute( HttpServletRequest request ) throws HireCommandException;
}
