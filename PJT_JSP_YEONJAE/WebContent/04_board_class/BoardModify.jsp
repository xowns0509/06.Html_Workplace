<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.model.*,board.service.*"%>

<%
   // 0. 넘겨받는 데이타의 한글 처리
   // 0. 넘겨받는 한글 깨지지 않도록 지정
   request.setCharacterEncoding("UTF-8");
%>

<%
	String articleId = request.getParameter("articleId");
	int result = Integer.parseInt(request.getAttribute("result").toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글수정</title>
</head>
<body>

	<%  // 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고
    // 그렇지 않다면, "암호가 잘못 입력되었습니다"를 출력
    if( result == 1 ){ %>
	<% response.sendRedirect("BoardControl?cmd=view-page&id=" + articleId); %>
	<% }else { %>
	<a href="BoardControl?cmd=list-page">암호가 잘못 입력되었습니다</a>
	<% } %>

</body>
</html>