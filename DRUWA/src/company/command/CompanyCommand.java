package company.command;

import javax.servlet.http.HttpServletRequest;

public interface CompanyCommand {
	public String execute(HttpServletRequest request) throws CompanyCommandException;
}
