package learn.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import learn.model.Learn;
import learn.model.LearnException;
import learn.session.LearnSessionRepository;

public class LearnCommandList implements LearnCommand{
	private String next;
	
	public LearnCommandList(String _next){
		next=_next;
	}

	public String execute(HttpServletRequest request) throws LearnCommandException {
		try{
			List<Learn> mList=LearnSessionRepository.getInstance().select();
			request.setAttribute("learnList", mList);
			
		}catch(Exception e){
			throw new LearnCommandException("LearnCommandList.java <목록 보기>:"+e.getMessage());
		}
		return next;
	}
}
