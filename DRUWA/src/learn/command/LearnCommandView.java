package learn.command;

import javax.servlet.http.HttpServletRequest;

import learn.model.Learn;
import learn.model.LearnException;
import learn.session.LearnSessionRepository;

public class LearnCommandView implements LearnCommand{
	private String next;
	
	public LearnCommandView(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws LearnCommandException {
		try{
			int leNum=Integer.parseInt(request.getParameter("leNum"));

			LearnSessionRepository.getInstance().increaseCount(leNum);
			Learn dao=LearnSessionRepository.getInstance().selctById(leNum);
			request.setAttribute("learnView", dao);
		}catch(Exception e){
			throw new LearnCommandException("CommandLearn 오류:"+e.getMessage());
		}
		return next;
	}

}
