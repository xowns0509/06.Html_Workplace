package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private int page = 2;			// 한페이지당 구간 범위
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	public List <Message> getMessageList(String pNum) throws MessageException
	{
		// 페이지 번호에 의해 몇번째 레코드부터 몇번째 레코드까지인지 결정
		/*
		 *	pNum(페이지 번호) : 1  2  3  4
		 *	firstRow       : 1  4  7  10
		 *	endRow         : 3  6  9  12
		 */
		int pageNo = 1;
		if(pNum != null){
			pageNo = Integer.parseInt(pNum);
		}
		
		int firstRow;
		int endRow;
		
		endRow = pageNo*countPerPage;
		firstRow = endRow - (countPerPage-1);
		
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList(firstRow, endRow);			
		return mList;
	}
	
	public int getTotalCount() throws MessageException
	{
		totalRecCount = MessageDao.getInstance().getTotalCount();
		// 전체 레코드 수에 의한 페이지 수 결정하기
		/*  전체레코드 수 : 9  10  11  12  13
		 	전체 페이지 수: 3   4   4   4   5
		 */
		if((totalRecCount%countPerPage) == 0){
			pageTotalCount = (totalRecCount/countPerPage);
		}else{
			pageTotalCount = (totalRecCount/countPerPage)+1;
		}
		
		return pageTotalCount;
	}
	
	
}
