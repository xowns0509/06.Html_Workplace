package qa.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.Qa;
import qa.model.Sh;
import qa.mapper.qaDao;

public class ShInsertCommand implements Command {
	public String execute(HttpServletRequest request,HttpServletResponse response){
 		
		qaDao aqdao = qaDao.getInstance();
		
		Sh sh = new Sh();
		sh.setNick(request.getParameter("nick"));
		sh.setShContent(request.getParameter("shContent"));
		
		aqdao.insertSh(sh);
		
		return "/qa.do?cmd=shlist";
	}
}
