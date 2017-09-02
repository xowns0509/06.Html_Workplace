package hire.command;

import javax.servlet.http.HttpServletRequest;

import company.session.CompanySessionRepository;
import hire.session.HireSession;
import hire.session.JobSession;

public class HireCommandMain implements HireCommand {
	private String next;

	public HireCommandMain(String _next) {
		next = _next;
	}

	public String execute(HttpServletRequest request) throws HireCommandException {

		// 16개의 분야별 채용공고 지원자수 탑10 불러오기
		HireSession hs = new HireSession();
		request.setAttribute("resultJob1HireTop10", hs.SelectHireJob10("웹기획·웹마케팅·PM"));
		request.setAttribute("resultJob2HireTop10", hs.SelectHireJob10("웹디자인"));
		request.setAttribute("resultJob3HireTop10", hs.SelectHireJob10("웹프로그래머"));
		request.setAttribute("resultJob4HireTop10", hs.SelectHireJob10("응용프로그래머"));
		
		request.setAttribute("resultJob5HireTop10", hs.SelectHireJob10("시스템프로그래머"));
		request.setAttribute("resultJob6HireTop10", hs.SelectHireJob10("ERP·시스템분석·설계"));
		request.setAttribute("resultJob7HireTop10", hs.SelectHireJob10("하드웨어·소프트웨어"));
		request.setAttribute("resultJob8HireTop10", hs.SelectHireJob10("서버·네트워크·보안"));
		
		request.setAttribute("resultJob9HireTop10", hs.SelectHireJob10("데이터베이스·DBA"));
		request.setAttribute("resultJob10HireTop10", hs.SelectHireJob10("HTML·웹표준·UI개발"));
		request.setAttribute("resultJob11HireTop10", hs.SelectHireJob10("통신·모바일"));
		request.setAttribute("resultJob12HireTop10", hs.SelectHireJob10("동영상·편집·코덱"));

		request.setAttribute("resultJob13HireTop10", hs.SelectHireJob10("IT·디자인·컴퓨터교육"));
		request.setAttribute("resultJob14HireTop10", hs.SelectHireJob10("컨텐츠·사이트운영"));
		request.setAttribute("resultJob15HireTop10", hs.SelectHireJob10("게임·Game"));
		request.setAttribute("resultJob16HireTop10", hs.SelectHireJob10("웹마스터·QA·테스터"));
		
		// 16개의 분야별 정보 불러오기
		JobSession js = new JobSession();
		request.setAttribute("result16Job", js.select());

		return next;

		// 1 웹기획·웹마케팅·PM
		// 2 웹디자인
		// 3 웹프로그래머
		// 4 응용프로그래머
		// 5 시스템프로그래머
		// 6 ERP·시스템분석·설계
		// 7 하드웨어·소프트웨어
		// 8 서버·네트워크·보안
		// 9 데이터베이스·DBA
		// 10 HTML·웹표준·UI개발
		// 11 통신·모바일
		// 12 동영상·편집·코덱
		// 13 IT·디자인·컴퓨터교육
		// 14 컨텐츠·사이트운영
		// 15 게임·Game
		// 16 웹마스터·QA·테스터

	}
}

// request.setAttribute("result16Job"+String.valueOf(i), js.select());