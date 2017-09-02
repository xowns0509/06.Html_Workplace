package learn.command;

import javax.servlet.http.HttpServletRequest;

import learn.model.Learn;
import learn.session.LearnSessionRepository;

public class LearnCommandDelete implements LearnCommand{
	private String next;
	
	public LearnCommandDelete(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws LearnCommandException {
		try{
			Learn dao=new Learn();
			dao.setLeNum(Integer.parseInt(request.getParameter("leNum")));
			dao.setLePass(request.getParameter("lePass"));
			
			int result=LearnSessionRepository.getInstance().delete(dao);
			request.setAttribute("learnDelete", result);
		}catch(Exception e){
			throw new LearnCommandException("LearnCommandDelete 오류발생: "+e.getMessage());
		}
		return next;
	}

}
