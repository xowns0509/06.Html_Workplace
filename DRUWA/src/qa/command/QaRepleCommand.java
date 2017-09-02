package qa.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.regexp.internal.RE;

import qa.model.RepleVo;
import qa.mapper.qaDao;

public class QaRepleCommand implements Command {
	public String execute(HttpServletRequest request,HttpServletResponse response){
		request.setAttribute("message", "hello world!");
 		
		qaDao aqdao = qaDao.getInstance();
 		RepleVo rv = new RepleVo();
 		String qaNum = request.getParameter("qaNum");
 		rv.setId(request.getParameter("id"));
 		rv.setQaNum(request.getParameter("qaNum"));
 		rv.setQaReContent(request.getParameter("qaReContent"));
 		
 	 System.out.println("리플테스트 : 리플 불러오기 전" +rv.toString());
 		aqdao.insertReple(rv);
 	 	 System.out.println("리플테스트 : 리플 불러오기 후" );

		return "/qa.do?cmd=detail&qanum="+qaNum;
	}
}
