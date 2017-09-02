<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.service.*, board.model.*"%>
<%
   BoardRec rec = (BoardRec)request.getAttribute("param");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
</head>
<body>

	<h4>게시판 글 보기</h4>
	<br />
	<table border="1" bordercolor="red">
		<tr>
			<td>제 목 :</td>
			<td><%= rec.getTitle() %></td>
		</tr>
		<tr>
			<td>작성자 :</td>
			<td><%= rec.getWriterName() %></td>
		</tr>
		<tr>
			<td>작성일자 :</td>
			<td><%= rec.getPostingDate() %></td>
		</tr>
		<tr>
			<td>내 용 :</td>
			<td><%= rec.getContent() %></td>
		</tr>
		<tr>
			<td colspan="2"><a href="BoardControl?cmd=list-page">목록보기</a> <a
				href="BoardControl?cmd=reply-form&id=<%=rec.getArticleId()%>">답변하기</a>
				<a href="BoardControl?cmd=modify-form&id=<%=rec.getArticleId()%>&ctt=<%= rec.getContent() %>&title=<%= rec.getTitle()%>">수정하기</a>
				<a href="BoardControl?cmd=delete-form&id=<%=rec.getArticleId()%>">삭제하기</a>
			</td>
		</tr>
	</table>


</body>
</html>