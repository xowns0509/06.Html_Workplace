<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head><title>요청 파라미터 출력</title></head>
<body>
<h5> 방법 1 </h5>

이름  : <%= request.getParameter("name") %><br/>
주소  : <%= request.getParameter("address") %><br/>
좋아하는 동물 : 
<%
	String [] pet = request.getParameterValues("pet");
	if(pet != null){
		for(String m : pet){
			// <%= m % > => out.print(m);
			out.print(m);
		}
	}
%>

<h5> 방법 2 </h5>

<%
	Enumeration<String> paramElems = request.getParameterNames();
	// 콜렉션(배열부터 리스트, Set, Map)
	// 콜렉션의 값들 출력만 한다면 가벼운 요소들로 다시 뽑아내는데 Iterator (1.5 버전)
	
	while(paramElems.hasMoreElements()){
		String name = paramElems.nextElement();
		String value = request.getParameter(name);
		out.print(name + " : " + value + "<br/>");
	}
%>

<h5> 방법 3 </h5>

<%
	Map<String, String[]> map = request.getParameterMap();
	//키 값만 따로 얻어오기
	String [] paramName = map.get("name");
	for(String m : paramName){
		out.print(m + "<br/>");
	}
	
%>

</body>
</html>
