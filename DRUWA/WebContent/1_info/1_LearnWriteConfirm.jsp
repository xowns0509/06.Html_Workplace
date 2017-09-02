<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="learn.model.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>job 모두의 이론</title>
<link rel="stylesheet" href="/DRUWA/css/style.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

#write_confirm{
	margin-top:-280px;
	margin-left:650px;
}
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
			<li><a href="/DRUWA/qa.do?cmd=shlist">shouting</a></li>
		</div>
	</div>

	<!-- 옆에 존재하는 사이드 메뉴바 -->
	<div id="wrap" class="container">
        <nav id="main_lnb">
            <ul>
              <li class="/DRUWA/1_info/current_page_item"><a href="/DRUWA/LearnControl?cmd=learnlist">모두의이론</a></li>
				<li><a href="/DRUWA/AlgoControl?cmd=algo-page">알고리즘</a></li>
				<li><a href="/DRUWA/1_info/3_dictionary.jsp">IT백과사전</a></li>
				<li><a href="/DRUWA/1_info/4_community.jsp">소모임</a></li>
            </ul>
        </nav>
    </div>
    
    <div id="write_confirm">
    	<h2>입력 되었습니다.</h2>
    	<a href="/DRUWA/LearnControl?cmd=learnlist">목록보기</a>
    </div>
    <br/>
    <br/>
</body>
</html>