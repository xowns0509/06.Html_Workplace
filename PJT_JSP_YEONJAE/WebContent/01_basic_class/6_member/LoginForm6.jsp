<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>로그인 창</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
<!-- 외부적으로 jquery 연결 방법: CND 방식 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('body').css('background', '#f5dd90');
		$('body').css('font-family', 'Jeju Gothic');
		$('input').css('border', '2px solid #586ba4');
		$('input').css('border-radius', '8px');
		$('form').css('font-size', '17px');
		$('#btn').css('border-radius', '8px');
		$('#btn').css('font-size', '15px');
		$('#btn').css('cursor', 'pointer');
		$('#btn2').css('border-radius', '8px');
		$('#btn2').css('font-size', '15px');
		$('#btn2').css('cursor', 'pointer');
		
		$('#btn2').click(function(){
			window.open("MemberForm.jsp", "", "width = 400, height = 400");
		});
	})
</script>
</head>
<body>
<center>
	<h2>로그인 </h2> 
	<form action="LoginService6.jsp" method="get">
		사용자 <input name='User' type='text'><br/><br/>
		비밀번호 <input name='Pass' type='password'><br/><br/>
		<input type='submit' value='로그인' id='btn'> 
		<input type='button' value='회원가입' id='btn2'> 
	</form>
</center>
</body>
</html>