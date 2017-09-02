package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.Member;
import member.session.MemberSessionRepository;

public class MemberCommandSearch implements MemberCommand{
	private String next;
	
	public MemberCommandSearch(String _next){
		next=_next;
	}

	public String execute(HttpServletRequest request) throws MemberCommandException {
		try{
			//session
			HttpSession session=request.getSession();
			
			Member dao=new Member();
			dao.setId(request.getParameter("id"));
			dao.setPw(request.getParameter("pw"));
			
			Member redao=MemberSessionRepository.getInstance().selectLogin(dao);
			
			if(redao!=null){
				session.setAttribute("loginView", redao);
			}else{
				return next;
			}
			
		}catch(Exception e){
			throw new MemberCommandException("MemberCommand 예외발생: "+e.getMessage());
		}
		return next;
	}
	
	

}
