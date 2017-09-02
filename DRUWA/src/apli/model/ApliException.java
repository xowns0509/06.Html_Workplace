package apli.model;

public class ApliException extends Exception {

	public ApliException(){
  		super();
  	}

	public ApliException(String error){
  		super( error );
  	}

}