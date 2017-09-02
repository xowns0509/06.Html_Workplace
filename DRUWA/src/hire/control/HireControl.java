package hire.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hire.command.*;
//import hire.model.HireException;

public class HireControl extends HttpServlet {

	private HashMap hireMap;
	private String jspDir = "/2_job/";
	private String error = "error.jsp";

	public HireControl() {
		super();
		initCommand();
	}

	private void initCommand() {
		
		hireMap = new HashMap();
		
		// ###############		
		// 1-1. 채용공고 목록(JOB_Main) 16개의 분야별 top10 채용공고와 분야별 제목, 간단내용 갖고 오기.
		hireMap.put("job-main-page", new HireCommandMain("2_JOB_Main.jsp"));
		//hireMap.put("job-main-page", new HireCommandMain("2_JOB_Main_normal.jsp"));

		// 1-2. 분야공고 목록(TotalHireList)
		hireMap.put("total-list-page", new HireCommandList("TotalHireList.jsp"));

		// 1-3. 기업정보, 기업공고목록
		hireMap.put("company-list-page", new HireCommandCompanyHire("CompanyDetailAndHire.jsp"));
		
		// 2. 채용공고 입력
		hireMap.put("insert-form", new HireCommandNull("HireInsert.jsp"));
		hireMap.put("insert-save", new HireCommandInsert("HireInsertConfirm.jsp"));
		
		// 3. 회사평가 or 면접후기 입력 or 삭제
		hireMap.put("insert-review-rate", new HireCommandInsertRateReview("ConfirmPage.jsp"));
		hireMap.put("delete-review-rate", new HireCommandDeleteRateReview("ConfirmPage.jsp"));

		// 3. 채용공고 수정 및 지원자보기. hire하나에 대한 정보-->
		hireMap.put("modifyhire-and-viewapli", new HireCommandView("HireModifyAndApli.jsp"));

		// 3-0. 지원하기
		hireMap.put("insert-apli", new HireCommandInsertApli("ConfirmPage.jsp"));
		
		// 3-1. 그 다음에 수정
//		hireMap.put("modify-save", new HireCommandModify("HireModifyConfirm.jsp"));
		// 3-2. 아니면 그 다음에 삭제
//		hireMap.put("delete-save", new HireCommandDelete("HireDeleteConfirm.jsp"));

		// 4. 채용공고 검색
		// hireMap.put("list-page", new HireCommandList("HireList.jsp"));

		// 채용공고 보기
		// hireMap.put("main-page", new HireCommandNull("main.jsp"));
		// 채용공고 자세히보기는 필요 하지 않음. 어짜피 목록만 나오는 간단한 체계이므로.
		// hireMap.put("show-form", new HireCommandView("HireView.jsp"));
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey = request.getParameter("cmd");
		if (cmdKey == null) {
			cmdKey = "main-page";
		}

		HireCommand cmd = null;

		try {

			if (hireMap.containsKey(cmdKey.toLowerCase())) {
				cmd = (HireCommand) hireMap.get(cmdKey.toLowerCase());
			} else {
				throw new HireCommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute(request);

		} catch (HireCommandException e) {
			request.setAttribute("javax.servlet.jsp.jspException", e);
			nextPage = error;
			System.out.println("오류 : " + e.getMessage());
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(jspDir + nextPage);
//		RequestDispatcher reqDp = getServletContext().getRequestDispatcher(nextPage);
		reqDp.forward(request, response);
		// forward는 넘겨주는거
	}
}
