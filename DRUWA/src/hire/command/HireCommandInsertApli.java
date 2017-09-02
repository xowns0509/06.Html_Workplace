package hire.command;

import javax.servlet.http.HttpServletRequest;

import apli.model.Apli;
import apli.session.ApliSession;
import hire.model.Hire;
import hire.session.HireSession;

public class HireCommandInsertApli implements HireCommand {
	private String next;

	public HireCommandInsertApli(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request) throws HireCommandException {
		Apli apliRec = new Apli();
		Hire hireRec = new Hire();
		

		String companyId = request.getParameter("companyId");
		
		int hireNum = Integer.valueOf(request.getParameter("hireNum"));
		System.out.println("hireNum출력: " + hireNum);
		
		// 지원자 가능 언어 배열로 받아서 쳐넣음
		String[] apliLangAR = request.getParameterValues("apliLang");
		String apliLangSTR = new String();

		for (int i = 0; i < apliLangAR.length; i++) {
			apliLangSTR += apliLangAR[i] + ",";

		}

		// 파일경로 불러와서 이력서 파일이 없으면 이력서없음 입력
		String apliResume = request.getParameter("apliResume");
		if (apliResume != null) {
			apliRec.setApliResume(apliResume);

		} else {
			apliResume = "이력서없음";
			apliRec.setApliResume(apliResume);

		}

		apliRec.setHireNum(hireNum);
		apliRec.setId(request.getParameter("id"));
		apliRec.setApliLang(apliLangSTR);
		apliRec.setApliTel(request.getParameter("apliTel"));

		ApliSession as = new ApliSession();
		request.setAttribute("resultInsert", as.insert(apliRec));
		// 여기까지 APLI에 넣기 완료
		

		// 카운트 갖고 오기.
		int apliCount = as.confirmApliCount(hireNum);
		System.out.println("apliCount출력: " + apliCount);

		// 카운트 hire에 넣기.
		HireSession hs = new HireSession();
		
		hireRec.setHireNum(hireNum);		
		hireRec.setApplicantMan(apliCount);

		hs.updateHireCount(hireRec);
		
		
		//리다이렉트를 위한 companyId 셋
		request.setAttribute("companyId", companyId);

		return next;
	}

}