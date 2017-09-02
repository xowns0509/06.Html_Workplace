package qa.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.Qa;
import qa.mapper.qaDao;

public class QaUpdateCommand implements Command {
	public String execute(HttpServletRequest request,HttpServletResponse response){
		  int qaNum = Integer.parseInt(request.getParameter("qanum"));
		  
		  Qa qa = qaDao.getInstance().selectQaList(qaNum);
		  
		  request.setAttribute("qa", qa);
		  return "/3_qa/qaupdate.jsp";
	}
}