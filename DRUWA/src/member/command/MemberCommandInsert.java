package member.command;

import javax.servlet.http.HttpServletRequest;

import member.model.Member;
import member.model.MemberException;
import member.session.MemberSessionRepository;

public class MemberCommandInsert implements MemberCommand{
	private String next;
	
	public MemberCommandInsert(String _next){
		next=_next;
	}

	public String execute(HttpServletRequest request) throws MemberCommandException {
		try{
			Member dao=new Member();
			dao.setId(request.getParameter("id"));
			dao.setName(request.getParameter("name"));
			dao.setPw(request.getParameter("pw"));
			dao.setTel(request.getParameter("tel")); 
			
			int result=MemberSessionRepository.getInstance().insert(dao);
			request.setAttribute("insertMember", result);
			
		}catch(MemberException e){
			throw new MemberCommandException("Member등록 오류발생:"+e.getMessage());
		}
		
		return next;
	}
	
	

}
