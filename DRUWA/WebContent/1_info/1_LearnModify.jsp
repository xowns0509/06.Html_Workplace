<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="learn.model.Learn"%>
<%
	String leNum = request.getParameter("leNum");
%>

<!DOCTYPE html>
<html>
<head>
<title>job 모두의 이론 수정하기</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<html>
<head>
<title>알고리즘</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/DRUWA/css/style.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css" />
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css" />
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

#write {
	margin-top: -280px;
	margin-left: 650px;
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
		</ul>
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

	<%
		Object obj = request.getAttribute("learnView");
		if (obj == null) {
	%>
	<div id="write">
		<h2>비밀번호가 틀렸습니다.</h2>
		<a href="/DRUWA/LearnControl?cmd=modify-pass&leNum=<%=leNum%>">이전화면으로</a>
		// <a href="/DRUWA/LearnControl?cmd=view-page&leNum=<%=leNum%>">글보기</a>
	</div>
	<%
		} else {
			Learn dao = (Learn) obj;
	%>
	<div id="write">
		<h2>모두의 이론 수정하기</h2>
		<div id="writeForm"></div>
		<form name='frm' method='post'
			action='/DRUWA/LearnControl?cmd=modify-page&leNum=<%=dao.getLeNum()%>'>
			<ul class="actions">
				<li>작성자ID&nbsp;</li>
				<li><input type="text" id="id" name="id" size="20"
					style="width: 230px;" readonly value="<%=dao.getId()%>"></input></li>
				<li>모두의 이론 종류 선택&nbsp;</li> 				
				
				<li><select id="leType" name="leType">
						<option value="<%=dao.getLeType() %>"><%=dao.getLeType() %></option>
						<option value="기술면접대비하기">기술면접대비하기</option>
						<option value="ABOUT JAVA">ABOUT JAVA</option>
						<option value="ABOUT C">ABOUT C</option>
						<option value="ABOUT DATABASE">ABOUT DATABASE</option>
				</select></li>
				<br />
				<br />
				<li>제 &nbsp; &nbsp; 목</li>&nbsp; &nbsp;
				<li><input id="leTitle" name="leTitle" type="text"
					value='<%=dao.getLeTitle()%>' size="50" required></li>
			</ul>
			글 내용<br /> <br />
			<textarea id="leContent" name="leContent" cols="110" rows="10"
				style="width: 800px;"><%=dao.getLeContent()%></textarea>
			<br /> <br /> <input type='submit' value='수정하기'>
	</div>
	<br />
	<br />
	<%
		}
	%>
</body>
</html>