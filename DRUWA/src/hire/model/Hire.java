package hire.model;

import java.io.Serializable;

public class Hire implements Serializable {
	// HIRE_NUM NOT NULL NUMBER
	// COMPANY_ID NOT NULL VARCHAR2(20)
	// HIRE_TITLE NOT NULL VARCHAR2(40)
	// HIRE_MAN NOT NULL VARCHAR2(10)
	// APPLICANT_MAN NOT NULL NUMBER
	// HIRE_JOB NOT NULL VARCHAR2(50)
	// HIRE_LANG NOT NULL VARCHAR2(255)
	// STR_DATE NOT NULL DATE
	// EXP_DATE NOT NULL DATE
	// HIRE_SW NOT NULL VARCHAR2(20)
	
	private int hireNum;
	private String companyId;
	private String hireTitle;
	private String hireMan;
	private int applicantMan;
	private String hireJob;
	private String hireLang;
	private String strDate;
	private String expDate;
	private String hireSw;

	public int getHireNum() {
		return hireNum;
	}
	public void setHireNum(int hireNum) {
		this.hireNum = hireNum;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getHireTitle() {
		return hireTitle;
	}
	public void setHireTitle(String hireTitle) {
		this.hireTitle = hireTitle;
	}
	public String getHireMan() {
		return hireMan;
	}
	public void setHireMan(String hireMan) {
		this.hireMan = hireMan;
	}
	public int getApplicantMan() {
		return applicantMan;
	}
	public void setApplicantMan(int applicantMan) {
		this.applicantMan = applicantMan;
	}
	public String getHireJob() {
		return hireJob;
	}
	public void setHireJob(String hireJob) {
		this.hireJob = hireJob;
	}
	public String getHireLang() {
		return hireLang;
	}
	public void setHireLang(String hireLang) {
		this.hireLang = hireLang;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	public String getHireSw() {
		return hireSw;
	}
	public void setHireSw(String hireSw) {
		this.hireSw = hireSw;
	}

}
