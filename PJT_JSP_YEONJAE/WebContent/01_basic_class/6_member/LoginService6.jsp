<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.Member" %>
<%@ page import="member.beans.MemberDAO" %>
<%
	request.setCharacterEncoding("utf-8");
%>
    
<!DOCTYPE html>
<html>
<head>
<title> 로그인확인 </title>
</head>
<body>
<%	
	// 이전화면 폼에서 넘겨받는 값
	Member m = new Member();
	m.setId(request.getParameter("User"));
	m.setPass(request.getParameter("Pass"));
	
	// 실제로는 DB에서 가져와야하는 값
	String name = null;
	try{
		MemberDAO dao = MemberDAO.getInstance();
		name = dao.login(m);
	}catch(Exception ex){
		out.print(ex);
	} 
			
	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
	if(name != null){
		// #2. 세션에 "login"라는 이름에 변수 name 값을 저장
		session.setAttribute("login", name);
		
		// #1. 로그인 성공하면 바로 MainPage.jsp를 요청
		response.sendRedirect("MainPage6.jsp");
	}else{
		// #1. 로그인에 실패하면 바로 LoginForm.jsp을 요청
		response.sendRedirect("LoginForm6.jsp");
	}			
%>
	
</body>
</html>