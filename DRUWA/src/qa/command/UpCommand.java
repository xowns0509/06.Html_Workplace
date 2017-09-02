package qa.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.Member;
import qa.mapper.qaDao;
import qa.model.Sh;
import qa.model.Sh2;

public class UpCommand implements Command {
   public String execute(HttpServletRequest request,HttpServletResponse response){
      
      System.out.println("ㅏ11111111111111");
         qaDao qadao = qaDao.getInstance();
         System.out.println("1");
         
         Member login = (Member)request.getSession().getAttribute("loginView");
         System.out.println("2");
         
         Sh2 shUp = new Sh2(); //Sh2 vo 이름
         System.out.println("3");
         
         if(login != null){
            shUp.setId(login.getId());
            }else{
            System.out.println("로그인 안 한 사용자는 추천할 수 없다.");
      request.setAttribute("flag", "notlogin");
            return "/4_shouting/shupdatecheck.jsp";
            }

         shUp.setShseq(request.getParameter("shseq"));

         int upCheck = qadao.upCheck(shUp);

         if(upCheck!=0){
            System.out.println("이미 추천 했음");
      request.setAttribute("flag", "alreadyup");
            return "/4_shouting/shupdatecheck.jsp";

         }
         System.out.println("요기다:" + shUp.toString());
         
         qadao.insertUp(shUp);
          
         return "/qa.do?cmd=shlist";
      }
}