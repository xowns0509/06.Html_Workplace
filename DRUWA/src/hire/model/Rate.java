package hire.model;

import java.io.Serializable;

public class Rate implements Serializable {
//	COMPANY_ID   NOT NULL VARCHAR2(20)  
//	RATE_NUM     NOT NULL NUMBER        
//	NICK         NOT NULL VARCHAR2(50)  
//	RATE_TIME    NOT NULL DATE          
//	RATE_CONTENT NOT NULL VARCHAR2(255) 
	
	private int rateNum;
	private String companyId;
	private String nick;
	private String rateTime;
	private String rateContent;
	private String ratePass;
	
	public String getRatePass() {
		return ratePass;
	}
	public void setRatePass(String ratePass) {
		this.ratePass = ratePass;
	}
	public int getRateNum() {
		return rateNum;
	}
	public void setRateNum(int rateNum) {
		this.rateNum = rateNum;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getRateTime() {
		return rateTime;
	}
	public void setRateTime(String rateTime) {
		this.rateTime = rateTime;
	}
	public String getRateContent() {
		return rateContent;
	}
	public void setRateContent(String rateContent) {
		this.rateContent = rateContent;
	}

}
