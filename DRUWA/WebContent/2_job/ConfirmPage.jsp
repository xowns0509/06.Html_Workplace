<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String companyId = (String) request.getAttribute("companyId");
%>
<jsp:forward page="/DRUWA/ff.tj?cmd=company-list-page&companyId=<%=companyId%>" />
<%-- <jsp:forward page="shoppinglist.jsp" /> --%>