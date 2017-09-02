package learn.command;

import javax.servlet.http.HttpServletRequest;

import learn.model.Learn;
import learn.session.LearnSessionRepository;

public class LearnCommandModifyView implements LearnCommand{
	private String next;
	
	public LearnCommandModifyView(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws LearnCommandException {
		try{
			Learn dao=new Learn();
			dao.setLeNum(Integer.parseInt(request.getParameter("leNum")));
			dao.setLePass(request.getParameter("lePass"));
			
			Learn redao=LearnSessionRepository.getInstance().selctByPass(dao);
			
			if(redao==null){
				request.setAttribute("learnView", null);
//				//next="1_LearnModifyPassConfirm.jsp";	
			}else{
				request.setAttribute("learnView", redao);
			}
			
		}catch(Exception e){
			throw new LearnCommandException("CommandLearn 오류:"+e.getMessage());
		}
		return next;
	}
}
