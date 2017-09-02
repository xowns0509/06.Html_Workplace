package qa.model;


//댓글
public class RepleVo {
	private String qaReNum;
	private String qaNum;
	private String qaReContent;
	private String id;
	private String qaReTime;
	public String getQaReNum() {
		return qaReNum;
	}
	public void setQaReNum(String qaReNum) {
		this.qaReNum = qaReNum;
	}
	public String getQaNum() {
		return qaNum;
	}
	public void setQaNum(String qaNum) {
		this.qaNum = qaNum;
	}
	public String getQaReContent() {
		return qaReContent;
	}
	public void setQaReContent(String qaReContent) {
		this.qaReContent = qaReContent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQaReTime() {
		return qaReTime;
	}
	public void setQaReTime(String qaReTime) {
		this.qaReTime = qaReTime;
	}
	@Override
	public String toString() {
		return "RepleVo [qaReNum=" + qaReNum + ", qaNum=" + qaNum + ", qaReContent=" + qaReContent + ", id=" + id
				+ ", qaReTime=" + qaReTime + "]";
	}
	
	
	
	
}
