<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String occupation = request.getParameter("occupation");
	String [] hobby = request.getParameterValues("hobby");
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼 </title>
</head>
<body>
	이름 :  <%= name %><br/>
	성별 : <%= gender %><br/>
	직업 : <%= occupation %><br/>
	취미 : <% if(hobby != null){
			for(int i=0 ; i<hobby.length ; i++){%>
			<%= hobby[i]%>
		 <%}}%>
</body>
