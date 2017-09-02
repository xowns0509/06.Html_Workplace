<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%  //--------------------------- 값 지정
	pageContext.setAttribute("name", "KIM"); // 페이지: 그 페이지에서만 저장 (scope 기본값)
	request.setAttribute("name", "YEONJAE"); // forward 사용 시 저장
	session.setAttribute("name", "DOKDO"); // 세션: 브라우저 닫기 전까지 저장
	application.setAttribute("name", "KOREA"); // 어플리케이션: 프로젝트 통으로 저장
	//application.log("FirstPage.jsp : " + pageContext.getAttribute("name") + "님 접속");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 첫번째 페이지 </title>
</head>
<body>

하나의 페이지 속성 : <%= pageContext.getAttribute("name") %> <br>
하나의 요청 속성 :	 <%= request.getAttribute("name") %> <br>
하나의 세션 속성 :	 <%= session.getAttribute("name") %> <br>
하나의 어플리케이션 속성 : <%= application.getAttribute("name") %> <br>

<!-- #############  -->
<!-- 페이지 forward 이동된다면  -->
<%-- <% response.sendRedirect("SecondPage.jsp"); %> --%>
<jsp:forward page="SecondPage.jsp"></jsp:forward>

</body>
</html>