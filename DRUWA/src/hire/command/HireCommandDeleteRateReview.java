package hire.command;

import javax.servlet.http.HttpServletRequest;

//VO랑 HireException
import hire.model.Rate;
import hire.model.Review;
import hire.session.RateReviewSession;

public class HireCommandDeleteRateReview implements HireCommand {
	private String next;

	public HireCommandDeleteRateReview(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request) throws HireCommandException {

		Rate rateRec = new Rate();
		Review reviewRec = new Review();

		String sw = request.getParameter("sw");
		String companyId = request.getParameter("companyId");

		RateReviewSession rrs = new RateReviewSession();

		if (sw.equals("rate")) {
			int rateNum = Integer.parseInt(request.getParameter("rateNum"));

			rateRec.setRateNum(rateNum);
			rateRec.setRatePass(request.getParameter("ratePass"));

			System.out.println(rateRec.getRateNum());
			System.out.println(rateRec.getRatePass());
			
			request.setAttribute("resultInsertRate", rrs.delete(rateRec));

		} else if (sw.equals("review")) {
			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			
			reviewRec.setReviewNum(reviewNum);
			reviewRec.setReviewPass(request.getParameter("reviewPass"));

			System.out.println(reviewRec.getReviewNum());
			System.out.println(reviewRec.getReviewPass());

			request.setAttribute("resultInsertReview", rrs.delete(reviewRec));

		}

		request.setAttribute("companyId", companyId);

		return next;

		// 동인의 nextPage = /qa.do?cmd=detail&qanum="+qaNum;
		// 나의것. /2_job/TotalHireList.jsp
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