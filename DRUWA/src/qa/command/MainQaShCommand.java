package qa.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.Member;
import qa.mapper.qaDao;
import qa.model.Mw;
import qa.model.Qa;
import qa.model.Sh;

public class MainQaShCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
		
		Member login = (Member)request.getSession().getAttribute("loginView");
		
		if(login==null){
			login = new Member();
			login.setId("");
		}
		
		String id = login.getId();
		
		List<Qa> qaList = 	qaDao.getInstance().mainQa();
		List<Sh> shList = 	qaDao.getInstance().mainSh();
		List<Mw> mwList = qaDao.getInstance().myWrite(id);
		
		Mw mw = new Mw();
		
//		mwList.add(mw);
		
		request.setAttribute("qaList", qaList);
		request.setAttribute("shList", shList);
		request.setAttribute("mwList", mwList);
		return null;
	}

}
