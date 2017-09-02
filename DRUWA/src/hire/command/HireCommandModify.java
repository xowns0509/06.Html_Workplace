package hire.command;

import javax.servlet.http.HttpServletRequest;

//import mvc.Hire.model.HireDao;
//import mvc.Hire.model.HireException;
//import mvc.Hire.model.HireRec;

import hire.command.HireCommand;
import hire.session.HireSession;
import hire.command.HireCommandException;
import hire.model.*;//VO랑 HireException

public class HireCommandModify implements HireCommand {
	private String next;

	public HireCommandModify(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request) throws HireCommandException {
		Hire rec = new Hire();

		// rec.setApplicantMan(applicantMan);//지원자수
		// rec.setHireNum(hireNum);//회사공고번호(시퀸스처리)
		// rec.setStrDate(strDate);//채용날짜(sysdate)
		rec.setCompanyId(request.getParameter("companyId"));// 회사ID
		rec.setExpDate(request.getParameter("expDate"));// 마감날짜
		rec.setHireJob(request.getParameter("hireJob"));// 업종
		rec.setHireLang(request.getParameter("hireLang"));// 채용자희망언어
		rec.setHireMan(request.getParameter("hireMan"));// 채용인원
		rec.setHireSw(request.getParameter("hireSw"));// 채용스위치
		rec.setHireTitle(request.getParameter("hireTitle"));// 채용제목

		HireSession hs = new HireSession();
		request.setAttribute("resultModify", hs.updateHireCount(rec));

		return next;
	}

}

// rec.setTitle(request.getParameter("title"));
// rec.setContent(request.getParameter("content"));
// rec.setArticleId(Integer.parseInt(request.getParameter("articleId")));
// rec.setPassword(request.getParameter("password"));
//
// System.out.println("rec.getTitle()"+rec.getTitle());
// System.out.println("rec.getContent()"+rec.getContent());
// System.out.println("rec.getArticleId()"+ rec.getArticleId());
// System.out.println("rec.getPassword()" + rec.getPassword());

// ps.setString(1, rec.getTitle());
// ps.setString(2, rec.getContent());
// ps.setInt(3, rec.getArticleId());
// ps.setString(4, rec.getPassword());
