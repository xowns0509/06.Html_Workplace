package qa.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.Member;

public class QaWriteCommand implements Command {
	public String execute(HttpServletRequest request,HttpServletResponse response){
		
		Member login = (Member)request.getSession().getAttribute("loginView");
		System.out.println("ㅇㅇㅇ");
		if(login == null){
			
			return "/MemberControl?cmd=please-login-page";
		}else{
		      return "/3_qa/qawrite.jsp";
		}
	}
}
