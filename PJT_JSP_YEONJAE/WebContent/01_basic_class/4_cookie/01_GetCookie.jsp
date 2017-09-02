<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head><title>쿠키</title></head>
<body>	

<h1>Cookie 정보 알아내기</h1>

<h4>다음은 클라이언트 브라우저의 쿠키에서 얻어온 값 : </h4><br><br>

<%	
	// 1. 클라이언트로부터 Cookie를 얻어옴 
	Cookie [] c = request.getCookies();
	
	// 2. 쿠키 이름 중에 "yourid"가 있다면 그 쿠키의 값을 출력
	for(int i=0 ; c !=null && i<c.length ; i++){
		String cname = c[i].getName();
		if(cname.equals("yourid")){
			out.print("당신의 아이디는 " + c[i].getValue() + " 입니다.");
		}
	}
	
%>

<br><a href="01_ChangeCookie.jsp"> 쿠키값 변경 </a><br/>
<br><a href="01_RemoveCookie.jsp"> 쿠키제거 </a>

</body></html>
