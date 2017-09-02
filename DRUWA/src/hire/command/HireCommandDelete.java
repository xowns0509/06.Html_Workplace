package hire.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import mvc.Hire.model.HireDao;
//import mvc.Hire.model.HireException;
//import mvc.Hire.model.HireRec;

import hire.command.HireCommand;
import hire.session.HireSession;
import hire.session.RateReviewSession;
import qa.mapper.qaDao;
import hire.command.HireCommandException;
import hire.model.*;//VO랑 HireException

public class HireCommandDelete implements HireCommand {
	private String next;

	public HireCommandDelete(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request) throws HireCommandException {

		Rate rateRec = new Rate();
		Review reviewRec = new Review();

		String sw = request.getParameter("sw");
		String companyId = request.getParameter("companyId");

		rateRec.setRateNum(Integer.parseInt(request.getParameter("rateNum")));
		rateRec.setRatePass(request.getParameter("ratePass"));

		System.out.println(rateRec.getRateNum());
		System.out.println(rateRec.getNick());
		System.out.println(rateRec.getRateContent());
		System.out.println(rateRec.getRatePass());

		reviewRec.setReviewNum(Integer.parseInt(request.getParameter("reviewNum")));
		reviewRec.setReviewPass(request.getParameter("reviewPass"));
		
		System.out.println(reviewRec.getReviewNum());
		System.out.println(reviewRec.getNick());
		System.out.println(reviewRec.getReviewContent());
		System.out.println(reviewRec.getReviewPass());

		RateReviewSession rrs = new RateReviewSession();

		if (sw.equals("rate")) {
			request.setAttribute("resultInsertRate", rrs.delete(rateRec));

		} else if (sw.equals("review")) {
			request.setAttribute("resultInsertReview", rrs.delete(reviewRec));

		}

		request.setAttribute("companyId", companyId);

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
