package qa.model;

public class Mw {
	private String id;
	private String title;
	private String daytime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDaytime() {
		return daytime;
	}
	public void setDaytime(String daytime) {
		this.daytime = daytime;
	}
	@Override
	public String toString() {
		return "myWrite [id=" + id + ", title=" + title + ", daytime=" + daytime + "]";
	}
}
