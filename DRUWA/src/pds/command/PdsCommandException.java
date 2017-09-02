package pds.command;

public class PdsCommandException extends Exception{
	public PdsCommandException(){
  		super();
  	}
  	
  public PdsCommandException(String error){
  		super( error );
  	}
}
