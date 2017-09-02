<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>   
  
 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("EUC-KR");
 %>
  
 <!--  이전 폼의 각각의 데이터를 빈즈의 멤버로 지정  -->
 <jsp:useBean id="comment" class="mybatis.guest.model.Comment">
 	<jsp:setProperty name="comment" property="*"/>
 </jsp:useBean>   

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>

<form name="frm" action="modifyComment.jsp" >
<table>
	<tr><td>글번호</td><td><input type="text" readonly="readonly" name="commentNo" size="3" value="<%= comment.getCommentNo()%>"/></td></tr>
	<tr><td>사용자</td><td><input type="text" name="userId" size="15" value="<%= comment.getUserId()%>"/></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40"><%= comment.getCommentContent()%></textarea></td></tr>
	<tr><td><input type="submit" value="입력"/></td></tr>
</table>
</form>
</body>
</html>