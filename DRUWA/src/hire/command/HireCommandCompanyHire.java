package hire.command;

import javax.servlet.http.HttpServletRequest;

import company.session.CompanySessionRepository;
import hire.session.HireSession;
import hire.session.RateReviewSession;

public class HireCommandCompanyHire implements HireCommand {
	private String next;

	public HireCommandCompanyHire(String _next) {
		next = _next;
	}

	public String execute(HttpServletRequest request) throws HireCommandException {
		// 회사ID에 관련된 모든 것들을 갖고 와야지.

		String companyId = request.getParameter("companyId");
		System.out.println("분야공고에서 갖고 온 companyId" + companyId);

		// 해당기업 채용공고 불러오기
		HireSession hs = new HireSession();
		request.setAttribute("resultCompanyHire", hs.Select(companyId));

		// 해당기업 평가 및 면접후기 불러오기
		RateReviewSession rrs = new RateReviewSession();
		request.setAttribute("resultCompanyRate", rrs.selectRate(companyId));
		request.setAttribute("resultCompanyReview", rrs.selectReview(companyId));

		// 해당기업정보 불러오기
		CompanySessionRepository csr = new CompanySessionRepository();
		request.setAttribute("resultCompanyInfo", csr.select(companyId));
		
		return next;

	}
}