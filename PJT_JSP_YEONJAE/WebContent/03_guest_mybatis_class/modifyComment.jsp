<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>  
 <jsp:useBean id="comment" class="mybatis.guest.model.Comment">
	<jsp:setProperty name="comment" property="*"/>
</jsp:useBean>
<%
	int mdfCnt = 0;
 	mdfCnt = CommentService.getInstance().modifyComment(comment);
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기</title>
</head>
<body>
	<% if( mdfCnt == 0 ) { %>
		수정 실패<br/><br/>
	<% } else { %>
		수정되었습니다.<br/><br/>
	<% } %>
<a href="listComment.jsp">[목록보기]</a>
</body>
</html>