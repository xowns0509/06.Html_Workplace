package company.model;

public class CompanyException extends Exception{

	public CompanyException(){
		super();
	}
	public CompanyException(String error){
		super(error);
	}
}
