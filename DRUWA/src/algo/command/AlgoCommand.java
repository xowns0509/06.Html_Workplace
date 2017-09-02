
package algo.command;

import javax.servlet.http.HttpServletRequest;

public interface AlgoCommand{
	public String execute( HttpServletRequest request ) throws AlgoCommandException;


}
