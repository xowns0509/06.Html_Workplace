<%@ page import="board.service.ReplyArticleService, board.model.BoardRec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("UTF-8");
%>

<%
	BoardRec reRec = (BoardRec)request.getAttribute("param");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 답변 글 저장하기 </title>
</head>
<body>

답변글을 등록하였습니다. <br/><br/>

<a href="BoardControl?cmd=list-page"> 목록보기 </a> &nbsp;
<a href="BoardControl?cmd=view-page&id=<%=reRec.getArticleId()%>"> 게시글 읽기  </a>

</body>
</html>