package qa.model;

public class Qa {
	private int qaNum;
	private String qaType;
	private String qaSubject;
	private String qaContent;
	private String qaPass;
	private String qaTime;
	private int qaCount;
	private String id;
	private String title;
	
		
	public int getQaNum() {
		return qaNum;
	}
	public void setQaNum(int qaNum) {
		this.qaNum = qaNum;
	}
	public String getQaType() {
		return qaType;
	}
	public void setQaType(String qaType) {
		this.qaType = qaType;
	}
	public String getQaSubject() {
		return qaSubject;
	}
	public void setQaSubject(String qaSubject) {
		this.qaSubject = qaSubject;
	}
	public String getQaContent() {
		return qaContent;
	}
	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public String getQaPass() {
		return qaPass;
	}
	public void setQaPass(String qaPass) {
		this.qaPass = qaPass;
	}
	public String getQaTime() {
		return qaTime;
	}
	public void setQaTime(String qaTime) {
		this.qaTime = qaTime;
	}
	public int getQaCount() {
		return qaCount;
	}
	public void setQaCount(int qaCount) {
		this.qaCount = qaCount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}	
	
	@Override
	public String toString() {
		return "Qa [qaNum=" + qaNum + ", qaType=" + qaType + ", qaSubject=" + qaSubject + ", qaContent=" + qaContent
				+ ", qaPass=" + qaPass + ", qaTime=" + qaTime + ", qaCount=" + qaCount + ", id=" + id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

}
