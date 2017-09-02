package algo.command;

import javax.servlet.http.HttpServletRequest;

import algo.model.Algo;
import algo.session.AlgoSessionRepository;

public class AlgoCommandInsert implements AlgoCommand{
	private String next;
	
	public AlgoCommandInsert(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws AlgoCommandException {
		try{
			Algo dao=new Algo();
			dao.setId(request.getParameter("id"));
			dao.setAlgoNum(Integer.parseInt(request.getParameter("algoNum")));
			dao.setAlgoAnswer(request.getParameter("algoAnswer"));
			
			int result= AlgoSessionRepository.getInstance().insert(dao);
			
		}catch(Exception e){
			throw new AlgoCommandException("AlgoCommandInsert 오류:"+e.getMessage());
		}
		return next;
	} 

}
