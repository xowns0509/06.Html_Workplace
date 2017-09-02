package member.command;

public class MemberCommandException extends Exception{
	public MemberCommandException(){
  		super();
  	}
  	
  public MemberCommandException(String error){
  		super( error );
  	}
}
