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
	Object name = session.getAttribute("login");

	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	if(name == null){
		response.sendRedirect("LoginForm6.jsp");
		return;
	}
	
	//# 3. null이 아니라면 String 형변환하여 변수에 지정
		
%>
    
<!DOCTYPE html>
<html>
<head>
<title> 우리 페이지 </title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
<!-- 외부적으로 jquery 연결 방법: CND 방식 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('body').css('background', '#f5dd90');
		$('body').css('font-family', 'Jeju Gothic');
		$('span').css('color', '#586ba4');
	})
</script>
</head>
<body>
<center>
	<h2> 이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다. </h2><br/><br/><br/>
	<span><%= name.toString() %></span>님이 로그인 하셨습니다.
		
</center>
</body>
</html>