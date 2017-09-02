package mybatis.guest.service;

import java.util.List;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentSessionRepository;

public class CommentService {

	private static CommentService service;

	public static CommentService getInstance() {
		if (service == null)
			service = new CommentService();
		return service;
	}

	private CommentSessionRepository repository = new CommentSessionRepository();

	// 리스트보기
	public List<Comment> select() {
		return repository.select();
	}

	// 입력하기
	public Integer insertComment(Comment c) {
		return repository.insert(c);
	}

	// 내용보기
	public Comment selectByPK(long commentNo) {
		return repository.select(commentNo);
	}

	// 삭제하기
	public Integer deleteComment(long commentNo) {
		return repository.delete(commentNo);
	}

	// 수정하기
	public Integer modifyComment(Comment c) {
		return repository.modify(c);
	}
}
