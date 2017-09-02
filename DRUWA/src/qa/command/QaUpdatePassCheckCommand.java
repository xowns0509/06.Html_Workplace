package qa.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.mapper.qaDao;

public class QaUpdatePassCheckCommand implements Command{

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response){
		  
		String pass = request.getParameter("pass");
		String inputPass = request.getParameter("inputPass");
		String qaNum = request.getParameter("qaNum");
		 
		if(pass.equals(inputPass)){
			System.out.println("비밀번호 맞음 : " + pass + " : " + inputPass);
//			return "/qa.do?cmd=update&qanum="+qaNum;
			request.setAttribute("flag", "success");
			request.setAttribute("qaNum", qaNum);
			return "/3_qa/qaupdatepasscheck.jsp";
			
		}else{
			System.out.println("비밀번호 다름 : " + pass + " : " + inputPass);
			request.setAttribute("flag", "fail");
			request.setAttribute("qaNum", qaNum);
			return "/3_qa/qaupdatepasscheck.jsp";
//			return "/qa.do?cmd=detail&qanum="+qaNum;
			
		}
		 
		
	}
	
	
	
}
 