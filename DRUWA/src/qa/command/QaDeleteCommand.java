package qa.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.Qa;
import qa.mapper.qaDao;

public class QaDeleteCommand implements Command {
	public String execute(HttpServletRequest request,HttpServletResponse response){
		 int qaNum = Integer.parseInt(request.getParameter("qanum"));
		  System.out.println("qaNum"+qaNum);
		  qaDao.getInstance().deleteQa(qaNum);
		  
		  return "/qa.do?cmd=qalist";
	}
}
