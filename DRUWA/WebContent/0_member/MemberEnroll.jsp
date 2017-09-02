<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>개인회원가입</title>
<link rel="stylesheet" href="/DRUWA/css/style.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
body{
	text-align:center;
}
form{line-height:25px; font-size:20px;}
h1{font-size: 80px;}
h3{ font-size: 25px; }
</style>

<script type="text/javascript">

function moveEnroll(){
	document.location.replace("/DRUWA/CompanyControl?cmd=enrollcom-page");
}
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#id_check').click(function(){
		$.ajax({
			url:'/DRUWA/0_member/IdCheck.jsp',
			type: 'GET',
			data: ({id: $("#id").val()}),
			dataType: 'text',
			success: function(data){
				//처리 콜백 함수: beforeSend, complete, error, success
				if(jQuery.trim(data)=='YES'){
					$('#idmessage').text('이미 사용중인 아이디 입니다.');
					$('#idmessage').show();
				}else{
					$('#idmessage').text('사용가능한 아이디 입니다.');
					$('#idmessage').show();

				}
			}
		});
	});
});

</script>
</head>
<body>
<!-- 상단 메뉴바 -->
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a href="/DRUWA/index.jsp">아이티드루와</a>
				</h1>
				<p>
					Design by <a href="http://templated.co" rel="nofollow">yuk jo</a>
				</p>
			</div>
		</div>
		<div id="menu" class="container">
		<ul>
			<li class="current_page_item"><a href="/DRUWA/LearnControl?cmd=learnlist">Info</a></li>
			<li><a href="/DRUWA/ff.tj?cmd=job-main-page">Job</a></li>
			<li><a href="/DRUWA/qa.do?cmd=qalist">Q&A</a></li>
			<li><a href="/DRUWA/4_shouting/shoutingmain.jsp">shouting</a></li>
		</ul>
		</div>
	</div>
	<br/><br/>
	<br/><br/>
	
	<!-- 회원 가입 폼 -->
	<div id="enroll">
		<div id="enroll_head">
			<h1> 회 원 가 입</h1>
		</div>
		<br/><br/>
		<br/><br/>
		
		<h3>신  &nbsp;&nbsp; 분 &nbsp;&nbsp;
	  	<label><input type="radio" name="radioSelect" id="personal" checked="checked"/>개인</label>&nbsp;&nbsp;
	    <label><input type="radio" name="radioSelect"id="enterprise" onclick="moveEnroll()"/>기업</label><br />
	    </h3>	
	    <br/>
	    <br/>

		<div style="margin-left:850px">
			<div id="enroll_center" style="text-align: left; width: 520px;">    	
				<form id="frm" method="post" action="/DRUWA/MemberControl?cmd=enroll-confirm">
					아  이  디 <input id='id' name='id' type='text'>&nbsp;<input type='button' id='id_check' value='중복확인'/>
					<div id="idmessage" style="display:none; float:right;"></div><br/><br/>
					이   름  <input id='name' name='name' type='text'><br /><br/>	
					비 밀 번 호 <input id='pw' name='pw' type='password'><br /><br/>	 
					비밀번호확인 <input id='pwConfirm' name='pwConfirm' type='password'><br /><br/>	 
					전 화 번 호 <input id='tel' name='tel' type='tel'><br /><br/>	
				<input type='submit' value='가입하기'>
				<input type="button" id="cancle" value="취소하기">
			</div>
		</div>
	</div>
</body>
</html>