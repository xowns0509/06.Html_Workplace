package learn.command;

public class LearnCommandException extends Exception{
	public LearnCommandException(){
		super();
	}
	
	public LearnCommandException(String error){
		super(error);
	}
}
