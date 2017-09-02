package learn.command;

import javax.servlet.http.HttpServletRequest;

import learn.model.Learn;
import learn.model.LearnException;
import learn.session.LearnSessionRepository;

public class LearnCommandInsert implements LearnCommand{
	private String next;
	
	public LearnCommandInsert(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws LearnCommandException {
		try{
			Learn dao=new Learn();
			dao.setId(request.getParameter("id"));
			dao.setLePass(request.getParameter("lePass"));
			dao.setLeType(request.getParameter("leType"));
			dao.setLeTitle(request.getParameter("leTitle"));
			dao.setLeContent(request.getParameter("leContent"));
			int result=LearnSessionRepository.getInstance().insert(dao);
			request.setAttribute("learnWrite", result);
			
		}catch(Exception e){
			throw new LearnCommandException("LearnCommandInsert 오류발생:" +e.getMessage());
		}
		return next;
	}

}
