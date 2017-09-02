<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<!-- 외부적으로 jquery 연결 방법: CND 방식 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btn').click(function(){
			// 사용자가 입력한 값들을 1차적으로 브라우저 체크하기
			
			$('#frm').submit();
		});
	});
</script>
</head>

<body>

	<form action="saveMessage.jsp" name="frm" id='frm' method="post">
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input id='btn' type="button" value="메세지 남기기">
	</form>
</body>
</html>