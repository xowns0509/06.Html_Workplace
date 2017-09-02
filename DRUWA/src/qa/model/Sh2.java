package qa.model;

public class Sh2 {
	private String seq;
	private String id;
	private String shseq;
	private int upCount;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getShseq() {
		return shseq;
	}
	public void setShseq(String shseq) {
		this.shseq = shseq;
	}
	public int getUpCount() {
		return upCount;
	}
	public void setUpCount(int upCount) {
		this.upCount = upCount;
	}
	@Override
	public String toString() {
		return "Sh2 [seq=" + seq + ", id=" + id + ", shseq=" + shseq + ", upCount=" + upCount + "]";
	}
	
	
	
}
