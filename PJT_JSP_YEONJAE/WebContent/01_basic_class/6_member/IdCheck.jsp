<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.beans.MemberDAO" %>

<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IdCheck.jsp</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
<!-- 외부적으로 jquery 연결 방법: CND 방식 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('body').css('font-family', 'Jeju Gothic');
		$('#dupid').css('cursor', 'pointer');                                                                           
		$('#useid').css('cursor', 'pointer');
		
		$('#useid').click(function(){
			opener.frm.id.value = $('#id').val();
			window.close();
		});
	});
</script>
</head>
<body>
<center>
	<form name'frm2' action="IdCheck.jsp" method="post">
	<input type="text" name="id" required id='id' value='<%= id %>'/>   <input type='submit' value='중복확인' id='dupid'/><br/><br/>
	
	<% if(id != ""){if(MemberDAO.getInstance().isDuplicatedId(id)){ %>
		이미 사용중인 아이디입니다.<br/><br/>
	<% }else{ %>
		사용가능한 아이디입니다.<br/><br/>
	<% }} %>
	
	<input type='button' value='확인' id='useid'/>
	</form>
</center>
</body>
</html>