<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="learn.model.*" %>
<%
	// 1. 삭제할 레코드의 게시글번호 넘겨받기
	String leNum=request.getParameter("leNum");
%> 
<!DOCTYPE html>
<html>
<head>
<title>job 모두의 이론</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#deleteView{
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
		<nav id="menu" class="container">
		<ul>
			<li class="current_page_item"><a href="/DRUWA/LearnControl?cmd=learnlist">Info</a></li>
			<li><a href="/DRUWA/ff.tj?cmd=job-main-page">Job</a></li>
			<li><a href="/DRUWA/qa.do?cmd=qalist">Q&A</a></li>
			<li><a href="/DRUWA/qa.do?cmd=shlist">shouting</a></li>
		</ul>
		</nav>
		
	</div>

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
	
<div id="deleteView">
<form method="post" action="/DRUWA/LearnControl?cmd=delete-page">
	<h2>모두의 이론 삭제하기</h2><br/>
	<h3>삭제할 글암호를 입력하세요</h3> <br/>
	<ul class="actions">
		<li><input type="password" id="lePass" name="lePass" style="width:200px"></li>
		
		<!-- 게시글번호를 다음 페이지로 넘기기 위해 hidden 태그로 지정 -->
		<li><input type="hidden" id="leNum" name="leNum" value='<%=leNum%>'></li>
		<li><input type="submit" value="삭제하기"></li>
	</ul>
</form>
</div>
</body>
</html>