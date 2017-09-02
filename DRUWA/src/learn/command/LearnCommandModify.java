package learn.command;

import javax.servlet.http.HttpServletRequest;

import learn.model.Learn;
import learn.model.LearnException;
import learn.session.LearnSessionRepository;

public class LearnCommandModify implements LearnCommand{
	private String next;
	
	public LearnCommandModify(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws LearnCommandException {
		try{
			Learn dao=new Learn();
			dao.setLeNum(Integer.parseInt(request.getParameter("leNum")));
			dao.setLeTitle(request.getParameter("leTitle"));
			dao.setLeType(request.getParameter("leType"));
			dao.setLeContent(request.getParameter("leContent"));
			
			int result=LearnSessionRepository.getInstance().modify(dao);
			request.setAttribute("learnModify", result);
			
		}catch(Exception e){
			throw new LearnCommandException("LearnCommandModify 예외발생:"+e.getMessage());
		}
		
		return next;
	}

}
