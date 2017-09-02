package hire.model;

public class HireException extends Exception {

	public HireException(){
  		super();
  	}

	public HireException(String error){
  		super( error );
  	}

}