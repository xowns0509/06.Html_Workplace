package hire.command;

import javax.servlet.http.HttpServletRequest;

import apli.session.ApliSession;
import hire.session.HireSession;

public class HireCommandView implements HireCommand{
	private String next;
	
	public HireCommandView(String _next){
		next=_next;
	}
	
	public String execute(HttpServletRequest request) throws HireCommandException {

		int hireNum = Integer.parseInt(request.getParameter("hireNum"));
		System.out.println("hireNum: " + hireNum);

		// 채용공고정보 딱 1건 불러오기
		HireSession hs = new HireSession();
		request.setAttribute("resultSingleHire", hs.select(hireNum));
		
		// 채용공고에 해당하는 지원자들 불러오기
		ApliSession ass = new ApliSession();
		request.setAttribute("resultApliList", ass.select(hireNum));
		
		return next;
	}
}