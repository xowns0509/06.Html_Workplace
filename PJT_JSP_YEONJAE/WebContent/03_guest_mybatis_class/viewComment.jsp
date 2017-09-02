<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>  
  
      
  <!-- 키에 해당하는 글번호를 넘겨받아 서비스의 메소드 호출  -->
  <% 
  long commentNo = Integer.parseInt( request.getParameter("cId"));
  Comment comment = CommentService.getInstance().selectByPK(commentNo);
  %>
     
<!DOCTYPE HTML> 
<html>
<head>
	<meta charset="UTF-8">
<title> 메세지 보기 </title>
</head>
<body>
<table border="1">
		<tr><td>글번호</td><td><%=  comment.getCommentNo()%></td></tr>
		<tr><td>메세지</td><td><%=  comment.getCommentContent()%></td></tr>
		<tr><td>등록일</td><td><%=  comment.getRegDate()%></td></tr>
		<tr><td colspan="2">
				<a href="modifyCommentForm.jsp?commentNo=<%=  comment.getCommentNo()%>&commentContent=<%=  comment.getCommentContent()%>&userId=<%=  comment.getUserId()%>"><input type="button" name="btnModify" value="수정" /></a>
				<a href="deleteComment.jsp?cId=<%=  comment.getCommentNo()%>"><input type="button" name="btnDelete" value="삭제" /></a>
				</td></tr>
</table>
</body>
</html>