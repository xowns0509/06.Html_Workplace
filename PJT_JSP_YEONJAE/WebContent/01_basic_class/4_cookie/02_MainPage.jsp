<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title> 우리 페이지 </title>
</head>
<body>

<%
	//##########
	// 1. 요청을 통해 전송된 쿠키들을 얻어오기
	Cookie [] login = request.getCookies();

	String value = null;

	// 2. 내가 지정한 이름의 쿠키를 찾기
	for(int i=0 ; login !=null && i<login.length ; i++){
		if((login[i].getName()).equals("userid")){
			// 3. 해당하는 그 쿠키의 값을 얻어와 변수에 저장
			value = login[i].getValue();
		}
	}
	
	if(value == null){
		response.sendRedirect("02_LoginForm.jsp");
	}
	
%>	

	<h2> 이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다. </h2><br/><br/><br/>
	<%= value %> 님, 로그인 중입니다.

</body>
</html>