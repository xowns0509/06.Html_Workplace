<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
		session : 내장객체
			' void setAttribute()
			' Object getAttribute()
			' void removeAttribute()
			' void invalidate()
 -->
<%

	//# 1."login"로 저장된 세션값을 얻어온다.
	Object id = session.getAttribute("login");

	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	if(id == null){
		response.sendRedirect("LoginForm.jsp");
		return;
	}
	
	//# 3. null이 아니라면 String 형변환하여 변수에 지정
		
%>
    
<!DOCTYPE html>
<html>
<head>
<title> 우리 페이지 </title>
</head>
<body>
<center>
	<h2> 이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다 </h2><br/><br/><br/>
	<%= id.toString() %>님, 로그인 중입니다.
		
</center>
</body>
</html>