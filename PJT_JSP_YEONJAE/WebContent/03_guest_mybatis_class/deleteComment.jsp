<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>  
<%
	long commentNo = Integer.parseInt( request.getParameter("cId"));
	
	int delCnt = 0;
 	delCnt = CommentService.getInstance().deleteComment(commentNo);
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제하기</title>
</head>
<body>
	<% if( delCnt == 0 ) { %>
		삭제 실패<br/><br/>
	<% } else { %>
		삭제하였습니다.<br/><br/>
	<% } %>
<a href="listComment.jsp">[목록보기]</a>
</body>
</html>