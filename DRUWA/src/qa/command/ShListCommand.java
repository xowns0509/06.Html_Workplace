package qa.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.Member;
import qa.mapper.qaDao;
import qa.model.Sh;
import qa.model.Sh2;

public class ShListCommand implements Command {
   public String execute(HttpServletRequest request,HttpServletResponse response){
      qaDao qadao = qaDao.getInstance();
      
      
      
      List<Sh> shList = qadao.selectShList();
      System.out.println("테스트 : " + shList.size());
      
      request.setAttribute("shList",shList);
      
      return "/4_shouting/shoutingmain.jsp";
      
   }
}