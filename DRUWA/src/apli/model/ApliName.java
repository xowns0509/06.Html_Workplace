package apli.model;

import java.io.Serializable;

public class ApliName implements Serializable {
//	HIRE_NUM ID NAME TEL LANG RESUME APLI_DATE

	private int hireNum;
	private String id;
	private String name;
	private String tel;
	private String lang;
	private String resume;
	private String apliDate;
	
	public String getApliDate() {
		return apliDate;
	}
	public void setApliDate(String apliDate) {
		this.apliDate = apliDate;
	}
	public int getHireNum() {
		return hireNum;
	}
	public void setHireNum(int hireNum) {
		this.hireNum = hireNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}

	
}
