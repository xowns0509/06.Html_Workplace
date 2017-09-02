package company.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import company.model.Company;
import company.session.CompanySessionRepository;

public class CompanyCommandSearch implements CompanyCommand{
	private String next;
	public CompanyCommandSearch(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws CompanyCommandException {
		try{
			//session
			HttpSession session=request.getSession();
			
			Company dao=new Company();
			dao.setCompanyId(request.getParameter("companyId"));
			dao.setCompanyPw(request.getParameter("companyPw"));
			System.out.println(dao.getCompanyId());
			System.out.println(dao.getCompanyPw());
			
			Company redao=CompanySessionRepository.getInstance().selectByLogin(dao);
			if(redao!=null){
				session.setAttribute("companylogin", redao);
			}else{
				return next;
			}
		}catch(Exception e){
			throw new CompanyCommandException("CompanyCommand 로그인 오류:"+e.getMessage());
		}
		return next;
	}
	
	

}
