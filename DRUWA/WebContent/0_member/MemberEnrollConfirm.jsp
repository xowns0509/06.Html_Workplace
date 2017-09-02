<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="member.model.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>회원가입완료</title>
<link rel="stylesheet" href="/DRUWA/css/style.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
body{
	text-align:center;
}
h1{font-size: 80px;}
</style>
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
	
	<!-- 회원 가입 완료 폼 -->
	<div id="enroll_head">
		<h1> 회 원 가 입 완 료 ! </h1><br/><br/>
		<h3>로그인 후 이용해 주세요</h3><br/><br/>
		<h3><a href="/DRUWA/index.jsp">홈으로 이동</a></h3>
	</div>


</body>
</html>