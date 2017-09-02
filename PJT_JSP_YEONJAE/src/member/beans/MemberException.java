package member.beans;

public class MemberException extends Exception{
	String msg;
	
	public MemberException(String msg){
		this.msg = msg;
	}
	
	public String getMessage(){
		return msg;
	}
}
