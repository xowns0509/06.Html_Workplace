package hire.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import hire.command.HireCommand;
import hire.session.HireSession;
import hire.session.JobSession;
import hire.command.HireCommandException;
import hire.model.*;//VO랑 HireException
//import mybatis.guest.model.Comment;
//import mybatis.guest.service.CommentService;
//import mybatis.guest.session.CommentSessionRepository;

public class HireCommandList implements HireCommand {
	private String next;

	public HireCommandList(String _next) {
		next = _next;
	}

	public String execute(HttpServletRequest request) throws HireCommandException {
		
		String hireJob = request.getParameter("hireJob");
		System.out.println("분야공고에서 갖고 온 companyId" + hireJob);
		
		// List <Hire> mList = BoardDao.getInstance().Select();
		HireSession hs = new HireSession();
		request.setAttribute("hireList", hs.SelectHireJob(hireJob));
		
		// 해당분야 정보 불러오기
		JobSession js = new JobSession();
		request.setAttribute("resultJob", js.select(hireJob));

		return next;
	}

}

// 커맨드가 원래 서비스 역할
//
// 서비스는 싱글톤으로 만들어줬는데
// 커맨드쓰면 그럴 필요 없다.
//
// 이미 세션 레포지토리 자체가 싱글톤이므로.
//
// 그냥 커맨드리스트에서 세션 레포지토리를 호출해주기만 하면 됨!!!

// public class CommentService {
//
// // 싱글톤 만들기
// private static CommentService service;
//
// public static CommentService getInstance() {
// if (service == null)
// service = new CommentService();
// return service;
//
// }
//
// private CommentSessionRepository repository = new CommentSessionRepository();
//
// public List<Comment> select() {
// return repository.Select();
// }
//
// public Integer insertComment(Comment c) {
// return repository.insert(c);
// }
//
// public Comment selectByPK(long cId) {
// return repository.Select(cId);
// }
//
// public Integer deleteComment(Comment c) {
// return repository.delete(c);
// }
//
// public Integer updateComment(Comment c) {
// return repository.update(c);
// }
//
// // view단에서 commentservice만
// }
