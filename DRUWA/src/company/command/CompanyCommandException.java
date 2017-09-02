package company.command;

public class CompanyCommandException extends Exception{
	public CompanyCommandException(){
		super();
	}
	public CompanyCommandException(String error){
		super(error);
	}
}
