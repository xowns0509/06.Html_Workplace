package hire.command;

import javax.servlet.http.HttpServletRequest;

//import mvc.Hire.model.HireDao;
//import mvc.Hire.model.HireException;
//import mvc.Hire.model.HireRec;

import hire.command.HireCommand;
import hire.session.HireSession;
import hire.command.HireCommandException;
import hire.model.*;//VO랑 HireException

public class HireCommandInsert implements HireCommand {
	private String next;

	public HireCommandInsert(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request) throws HireCommandException {
		Hire rec = new Hire();

		// rec.setApplicantMan(applicantMan);//지원자수
		// rec.setHireNum(hireNum);//회사공고번호(시퀸스처리)
		// rec.setStrDate(strDate);//채용날짜(sysdate)
		String[] hireLangAR = request.getParameterValues("hireLang");
		String hireLangSTR = new String();

		for (int i = 0; i < hireLangAR.length; i++) {
			hireLangSTR += hireLangAR[i] + ",";
		}
		
		String str = request.getParameter("hireSw");
		System.out.println("hireSw출력: "+str);
		
		rec.setCompanyId(request.getParameter("companyId"));// 회사ID
		rec.setExpDate(request.getParameter("expDate"));// 마감날짜
		rec.setHireJob(request.getParameter("hireJob"));// 업종
		rec.setHireLang(hireLangSTR);// 채용자희망언어
		rec.setHireMan(request.getParameter("hireMan"));// 채용인원
		rec.setHireSw(str);// 채용스위치
		rec.setHireTitle(request.getParameter("hireTitle"));// 채용제목

		HireSession hs = new HireSession();
		request.setAttribute("resultInsert", hs.insert(rec));

		return next;
	}

}

// request.setAttribute("message", "hello world!");
//
// qaDao aqdao = qaDao.getInstance();
// Qa qa = new Qa();
// qa.setId(request.getParameter("id"));
// qa.setQaType(request.getParameter("qa_type"));
// qa.setQaSubject(request.getParameter("qa_subject"));
// qa.setQaContent(request.getParameter("qa_content"));
// qa.setQaPass(request.getParameter("qa_pass"));
// aqdao.insertQa(qa);

// return new QaListCommand().execute(request, response);