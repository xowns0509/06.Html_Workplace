package qa.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.Qa;
import qa.mapper.qaDao;

public class QaInsertCommand implements Command {
	public String execute(HttpServletRequest request,HttpServletResponse response){
		request.setAttribute("message", "hello world!");
 		
		qaDao aqdao = qaDao.getInstance();
 		Qa qa = new Qa();
 		
 		qa.setId(request.getParameter("id"));
 		qa.setQaType(request.getParameter("qa_type"));
 		qa.setQaSubject(request.getParameter("qa_subject"));
 		qa.setQaContent(request.getParameter("qa_content"));
 		qa.setQaPass(request.getParameter("qa_pass"));
 		qa.setQaTime(request.getParameter("qa_time"));
 		aqdao.insertQa(qa);
 		
		return new QaListCommand().execute(request, response);
	}
}
