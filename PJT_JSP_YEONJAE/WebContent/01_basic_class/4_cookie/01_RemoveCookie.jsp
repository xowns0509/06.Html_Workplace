<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
<html>
<head><title>쿠키</title></head>
<body>

<b>Simple Cookie Example</b><hr>

<%	
	// 1. 클라이언트로부터 Cookie를 얻어옴
	Cookie [] c = request.getCookies();

	for(int i=0 ; c !=null && i<c.length ; i++){
		String cname = c[i].getName();
		
		// 2. 쿠키 이름 중에 "yourid"가 있는지 검색
		if(cname.equals("yourid")){
			// 3. 해당하는 쿠키가 있다면 그 이름으로 새 쿠키를 만들고 유효시간을 0으로 지정하고 전송
			Cookie newc = new Cookie("yourid", "");
			newc.setMaxAge(0);
			response.addCookie(newc);
		}
	}	
%>


<br><a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body></html>