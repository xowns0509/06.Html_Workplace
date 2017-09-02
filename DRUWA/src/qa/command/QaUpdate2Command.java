package qa.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.Qa;
import qa.mapper.qaDao;

public class QaUpdate2Command implements Command {
   public String execute(HttpServletRequest request,HttpServletResponse response){
        int qaNum = Integer.parseInt(request.getParameter("qa_num"));
        System.out.println("QaUpdate2Command에서 갖고온 qa_num: "+ qaNum);
         qaDao aqdao = qaDao.getInstance();
          Qa qa = new Qa();
          
          qa.setQaNum(qaNum);
          qa.setQaContent(request.getParameter("qa_content"));
          //qa.setQaPass(request.getParameter("qa_pass"));
          qa.setQaType(request.getParameter("qa_type"));
          aqdao.updateQa(qa);
        
		Qa qa2 = qaDao.getInstance().selectQaList(qaNum);
		System.out.println("QaUpdate2Command에서 갖고온 qa_num2: "+ qa2);
		request.setAttribute("qa", qa2);
		//return "/3_qa/qadetail.jsp";
		return "/qa.do?cmd=detail&qanum="+qaNum;
   }
}