package pds.model;

public class PdsException extends Exception{
	public PdsException(){
		super();
	}
	
	public PdsException(String error){
		super(error);
	}
}
