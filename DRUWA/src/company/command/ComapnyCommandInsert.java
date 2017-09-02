package company.command;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import company.model.Company;
import company.model.CompanyException;
import company.session.CompanySessionRepository;

public class ComapnyCommandInsert implements CompanyCommand{
	private String next;
	
	public ComapnyCommandInsert(String _next){
		next=_next;
	}

	public String execute(HttpServletRequest request) throws CompanyCommandException {
		try{
			 String savePath = "C:/sujinHTML/DRUWA/WebContent/0_member/upload";
	         
	         int sizeLimit = 1024*1024*15;
	         
	         MultipartRequest multi = new MultipartRequest(request,savePath, sizeLimit,"utf-8",new DefaultFileRenamePolicy());

			
			//값 얻어오기
			Company dao=new Company();
			dao.setCompanyId(multi.getParameter("companyId"));
			dao.setCompanyPw(multi.getParameter("companyPw"));
			dao.setCompanyName(multi.getParameter("companyName"));
			dao.setMgr(multi.getParameter("mgr"));
			dao.setCompanyJob(multi.getParameter("companyJob"));
			dao.setCompanySales(multi.getParameter("companySales"));
			dao.setCompanyType(multi.getParameter("companyType"));
			dao.setSetupDate(multi.getParameter("setupDate"));
			dao.setTotalMan(multi.getParameter("totalMan"));
			dao.setTotalSel(multi.getParameter("totalSel"));
			dao.setMoney(multi.getParameter("money"));
			dao.setCompanyTel(multi.getParameter("companyTel"));
			dao.setFax(multi.getParameter("fax"));
			dao.setAddr(multi.getParameter("addr"));
			dao.setCompanyResume(multi.getFilesystemName("companyResume"));
			dao.setCompanyIntro(multi.getParameter("companyIntro"));			
			dao.setCompanyDetail(multi.getParameter("companyDetail"));
			
			//session으로 보내기
			int result=CompanySessionRepository.getInstance().insert(dao);
			request.setAttribute("insertCompany", result);
		}
		catch(Exception e){
			throw new CompanyCommandException("Company Member 등록 오류:"+e.getMessage());
		}
		return next;
	}

}
