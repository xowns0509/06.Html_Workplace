<%@ page contentType="text/html; charset=UTF-8"%>
<% String projectName = "/JSP_YEONJAE"; %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 사이트</title>
</head>
<body>
시작하는 페이지 입니다. <br/>

<a href="simpleView.jsp">기존방식</a><br/>

<a href="<%= projectName %>/xxxx.do">MVC 방식</a><br/>

<a href="<%= projectName %>/xxxx.do?type=first">MVC 방식2</a>
</body>
</html>