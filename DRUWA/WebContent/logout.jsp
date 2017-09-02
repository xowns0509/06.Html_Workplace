<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
	session.invalidate(); 
	response.sendRedirect("/DRUWA/index.jsp");
	%>
</body>
</html>