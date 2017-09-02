package hire.model;

import java.io.Serializable;

public class Review implements Serializable {
//	COMPANY_ID     NOT NULL VARCHAR2(20)  
//	REVIEW_NUM     NOT NULL NUMBER        
//	NICK           NOT NULL VARCHAR2(50)  
//	REVIEW_TIME    NOT NULL DATE          
//	REVIEW_CONTENT NOT NULL VARCHAR2(255) 

	private int reviewNum;
	private String companyId;
	private String nick;
	private String reviewTime;
	private String reviewContent;
	private String reviewPass;

	public String getReviewPass() {
		return reviewPass;
	}

	public void setReviewPass(String reviewPass) {
		this.reviewPass = reviewPass;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
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

	public String getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(String reviewTime) {
		this.reviewTime = reviewTime;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

}
