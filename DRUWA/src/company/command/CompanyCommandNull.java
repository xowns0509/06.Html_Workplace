package company.command;

import javax.servlet.http.HttpServletRequest;

public class CompanyCommandNull implements CompanyCommand{
	private String next;
	
	public CompanyCommandNull(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws CompanyCommandException{
		return next;
	}

}
