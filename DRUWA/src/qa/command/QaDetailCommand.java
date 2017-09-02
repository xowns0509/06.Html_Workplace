//package qa.command;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import qa.mapper.qaDao;
//
//public class QaDetailCommand implements Command {
//	public String execute(HttpServletRequest request,HttpServletResponse response){
//		request.setAttribute("message", "hello world!");
//		request.getParameter("qanum");
//		return "/3_qa/qadetail.jsp";
//	}
//}
package qa.command; 

import java.util.List;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import qa.model.Qa;
import qa.model.RepleVo;
import qa.mapper.qaDao; 

public class QaDetailCommand implements Command {
 public String execute(HttpServletRequest request,HttpServletResponse response){
  int qaNum = Integer.parseInt(request.getParameter("qanum"));
  System.out.println("qaNum"+qaNum);
  
  qaDao.getInstance().increaseCount(qaNum);
  
  Qa qa = qaDao.getInstance().selectQaList(qaNum);
  System.out.println("테스트 Qa : " + qa.toString());
  request.setAttribute("qa", qa);
  
  //리플
  List<RepleVo> repleList = qaDao.getInstance().selectRepleList(qaNum);
  request.setAttribute("repleList", repleList);
  System.out.println("리플갯수 : ");
  
  return "/3_qa/qadetail.jsp";
 } 
}

//long commentNo = Integer.parseInt( request.getParameter("cId"));
//Comment comment = CommentService.getInstance().selectByPK(commentNo);