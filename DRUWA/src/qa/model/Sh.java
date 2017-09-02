package qa.model;

public class Sh {
	private int shNum;
	private String nick;
	private String shContent;
	private String shTime;
	private int shRate;
	
	
	public int getShNum() {
		return shNum;
	}
	public void setShNum(int shNum) {
		this.shNum = shNum;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getShContent() {
		return shContent;
	}
	public void setShContent(String shContent) {
		this.shContent = shContent;
	}
	public String getShTime() {
		return shTime;
	}
	public void setShTime(String shTime) {
		this.shTime = shTime;
	}
	public int getShRate() {
		return shRate;
	}
	public void setShRate(int shRate) {
		this.shRate = shRate;
	}
	@Override
	public String toString() {
		return "ShQa [shNum=" + shNum + ", nick=" + nick + ", shContent=" + shContent + ", shTime=" + shTime
				+ ", shRate=" + shRate + "]";
	}
	
	
}
