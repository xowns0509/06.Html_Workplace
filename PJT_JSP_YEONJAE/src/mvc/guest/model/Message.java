package mvc.guest.model;

public class Message {

	private int messageid;
	private String guestName;
	private String password;
	private String message;
	
	public Message(){}
	
	public Message(int messageid, String guestName, String password, String message)
	{
		this.messageid	=  messageid;
		this.guestName	= guestName;
		this.password	= password;
		this.message	= message;
	}

	public int getMessageid() {
		return messageid;
	}

	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
	
}
