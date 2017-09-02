package hire.command;

import javax.servlet.http.HttpServletRequest;

//VO랑 HireException
import hire.model.Rate;
import hire.model.Review;
import hire.session.RateReviewSession;

public class HireCommandInsertRateReview implements HireCommand {
	private String next;

	public HireCommandInsertRateReview(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request) throws HireCommandException {

		Rate rateRec = new Rate();
		Review reviewRec = new Review();

		String sw = request.getParameter("sw");
		String companyId = request.getParameter("companyId");

		rateRec.setCompanyId(companyId);
		rateRec.setNick(request.getParameter("nick"));
		rateRec.setRateContent(request.getParameter("rateContent"));
		rateRec.setRatePass(request.getParameter("ratePass"));

		System.out.println(rateRec.getCompanyId());
		System.out.println(rateRec.getNick());
		System.out.println(rateRec.getRateContent());
		System.out.println(rateRec.getRatePass());
		
		
		
		reviewRec.setCompanyId(companyId);
		reviewRec.setNick(request.getParameter("nick"));
		reviewRec.setReviewContent(request.getParameter("reviewContent"));
		reviewRec.setReviewPass(request.getParameter("reviewPass"));

		System.out.println(reviewRec.getCompanyId());
		System.out.println(reviewRec.getNick());
		System.out.println(reviewRec.getReviewContent());
		System.out.println(reviewRec.getReviewPass());
		
		RateReviewSession rrs = new RateReviewSession();

		if (sw.equals("rate")) {

			request.setAttribute("resultInsertRate", rrs.insert(rateRec));

		} else if (sw.equals("review")) {

			request.setAttribute("resultInsertReview", rrs.insert(reviewRec));

		}
		
		request.setAttribute("companyId", companyId);

		return next;
		// 동인의 nextPage = /qa.do?cmd=detail&qanum="+qaNum;
		// 나의것.  /2_job/TotalHireList.jsp
		// 
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