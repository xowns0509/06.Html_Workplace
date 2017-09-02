<%@page import="member.beans.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.beans.Member" %>
<%@ page import="member.beans.MemberDAO" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	// 1. 이전 화면 폼에서 사용자가 입력한 값들 얻어오기
	Member m = new Member();
	m.setId(request.getParameter("id"));
	m.setPass(request.getParameter("pass"));
	m.setName(request.getParameter("name"));
	m.setAddr(request.getParameter("addr"));
	m.setTel(request.getParameter("tel"));
	
	// 2. 얻어 온 값들을 DAO(모델단 클래스)로 넘기기
	int result = 0;
	try{
		MemberDAO dao = MemberDAO.getInstance();
		result = dao.insertMember(m);
	}catch(Exception ex){
		out.print(ex);
	}
		
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>InsertMember.jsp</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
<!-- 외부적으로 jquery 연결 방법: CND 방식 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('body').css('background', '#f5dd90');
		$('body').css('font-family', 'Jeju Gothic');
	})
</script>
</head>
<body>
<center>
	<% if(result == 1){ %>
	회원가입이 되었습니다. 축하합니다.
	<% }else{
		response.sendRedirect("MemberForm.jsp");
	} %>
</center>
</body>
</html>