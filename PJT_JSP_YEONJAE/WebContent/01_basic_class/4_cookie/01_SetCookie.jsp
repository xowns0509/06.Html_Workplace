<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		

<!-- 쿠키란?
		웹브라우저(클라이언트)에 문자열로 저장하는 것.
		(기본은 메모리 저장이자만 속성을 부여하면 파일로 저장 가능) -->
<html>
<head><title>쿠키</title></head>
<body>

<b>Simple Cookie Example</b><hr>

<%	
	// 1. Cookie 객체 생성
	Cookie c = new Cookie("yourid", "yeonjae");
	
	// 2. 속성 부여
	c.setMaxAge(1*60*60);	// 초 단위 >> 1시간
	
	// 3. 클라이언트에 쿠키 전송
	response.addCookie(c);
	
%>



<br><a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body></html>