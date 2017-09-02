package qa.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.Paging;
import qa.mapper.qaDao;
import qa.model.Qa;

public class QaListCommand implements Command {
	public String execute(HttpServletRequest request,HttpServletResponse response){
		String job = request.getParameter("job");
		String search = request.getParameter("search");
		int page = 1;
		try{
			page = Integer.valueOf(request.getParameter("page"));
		} catch(Exception e){
			page = 1;
		}
		
		System.out.println("서치 : " + request.getParameter("job") + " : " + request.getParameter("search"));

 		qaDao aqdao = qaDao.getInstance();
 		int totalCount = aqdao.selectQaCount(job, search);
 		Paging paging = new Paging(totalCount,10);
 		List<Qa> qalist = aqdao.selectQaList(job,search);
 		List<Qa> result = new ArrayList<Qa>();
 		for(int i=paging.getStartNum(page);i<paging.getEndNum(page)&&i<qalist.size();i++){
 			result.add(qalist.get(i));
 		}
		request.setAttribute("qalist",result);
		request.setAttribute("pageCount",paging.getPageCount());
		request.setAttribute("page",page);
		request.setAttribute("job",job);
		request.setAttribute("search",search);
		return "/3_qa/qalist.jsp";
	}
}
