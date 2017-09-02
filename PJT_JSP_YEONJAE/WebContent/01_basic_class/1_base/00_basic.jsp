<%@ page contentType="text/html; charset=UTF-8"%> <!-- 설정 -->
<%-- jsp 주석 --%>

<%! String name; %> <!-- 선언 -->

<% name = "홍길자"; %> <!-- 기술 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>00_basic.jsp</title>
</head>
<body>
	안녕하세요 <%= name %>님  <!-- 출력 -->
</body>
</html>