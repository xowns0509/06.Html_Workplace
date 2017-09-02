<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberForm.jsp</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
<!-- 외부적으로 jquery 연결 방법: CND 방식 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="./js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$('body').css('background', '#f5dd90');
		$('body').css('font-family', 'Jeju Gothic');
		$('input').css('border', '2px solid #586ba4');
		$('input').css('border-radius', '8px');
		$('form').css('font-size', '15px');
		$('#btn').css('border-radius', '8px');
		$('#btn').css('font-size', '15px');
		$('#btn').css('cursor', 'pointer');
		$('#dupid').css('cursor', 'pointer');
		
		$('#dupid').click(function(){
			// 아이디에 입력한 값을 출력
			var id = $('#id').val();
			var path = "IdCheck.jsp?id=" + id;
			var winObj = window.open(path, "", "width=400, height=200");
		});
	})
</script>
</head>

<body>
<center>
	<h4>회원가입</h4>
	
	<form name='frm' action="InsertMember.jsp" method="post">
		아이디 <input type="text" name="id" required id='id'/>   <input type='button' value='중복확인' id='dupid'/><br/><br/>
		비밀번호 <input type="password" name="pass" required/><br/><br/>
		이름 <input type="text" name="name" required/><br/><br/>
		주소 <input type="text" name="addr"/><br/><br/>
		전화번호 <input type="tel" name="tel"/><br/><br/>
		<input type="submit" value="회원가입" id="btn" cursor="pointer"/>
	</form>	
	
</center>

<!-- 
	데이타베이스에 이 내용을 담을 수 있는 테이블 만들기 (scott 계정)
		테이블명: memberTemp
		id			varchar2(20)	PK
		password	varchar2(20)	NN
		name		varchar2(20)	NN
		addr		varchar2(100)
		tel			varchar2(20) 
-->

</body>
</html>