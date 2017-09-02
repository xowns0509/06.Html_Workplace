package qa.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.Qa;
import qa.mapper.qaDao;

public class QaNullCommand implements Command {

	private String next;

	public QaNullCommand(String _next) {
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return next;
	}

}
