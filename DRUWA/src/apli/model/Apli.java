package apli.model;

import java.io.Serializable;

public class Apli implements Serializable {
	// HIRE_NUM NOT NULL NUMBER
	// ID NOT NULL VARCHAR2(20)
	// APLI_LANG NOT NULL VARCHAR2(255)
	// APLI_RESUME NOT NULL VARCHAR2(4000)
	// APLI_TEL VARCHAR2(30)

	private int hireNum;
	private String id;
	private String apliLang;
	private String apliResume;
	private String apliTel;

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

	public String getApliLang() {
		return apliLang;
	}

	public void setApliLang(String apliLang) {
		this.apliLang = apliLang;
	}

	public String getApliResume() {
		return apliResume;
	}

	public void setApliResume(String apliResume) {
		this.apliResume = apliResume;
	}

	public String getApliTel() {
		return apliTel;
	}

	public void setApliTel(String apliTel) {
		this.apliTel = apliTel;
	}

}
