package hire.command;

public class HireCommandException extends Exception{

	  public HireCommandException(){
	  		super();
	  	}
	  	
	  public HireCommandException(String error){
	  		super( error );
	  	}

}
