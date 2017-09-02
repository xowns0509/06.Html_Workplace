package board.command;

import java.text.DecimalFormat;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import board.model.BoardDao;
import board.model.BoardException;
import board.model.BoardRec;


public class CommandInput implements Command {
	private String next;

	public CommandInput( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			BoardRec rec = new BoardRec();
			rec.setWriterName( request.getParameter("writerName"));
			rec.setTitle(request.getParameter("title"));
			rec.setContent( request.getParameter("content"));
			rec.setPassword( request.getParameter("password"));
			
			BoardDao dao = BoardDao.getInstance();

			// 그룹번호(group_id) 지정
			int groupId = dao.getGroupId();
			rec.setGroupId(groupId);
			
			// 순서번호(sequence_no) 지정
			DecimalFormat dformat = new DecimalFormat("0000000000");
			rec.setSequenceNo( dformat.format(groupId) + "999999");
			
			// DB에 insert
			int articleId = dao.insert(rec);
			
			// 자동으로 지정된 게시글번호 얻어와서 BoardRec에 지정
			rec.setArticleId(articleId);
		}catch( BoardException ex ){
			throw new CommandException("CommandInput.java < 입력시 > " + ex.toString() ); 
		}
		return next;
	}

}
