<%@page import="java.util.ArrayList"%>
<%@page import="qa.model.Qa"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);


div {
	font-family: 'Hanna', serif;
}

html, body {
	height: 100%;
}

body {
	margin: 0px;
	padding: 0px;
	background: #fff url(images/overlay.png) repeat;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 12pt;
	font-weight: 400;
	color: rgba(0, 0, 0, .8);
}

h1, h2, h3 {
	margin: 0;
	padding: 0;
	text-transform: uppercase;
	font-weight: 300;
	color: #2D2D2D;
}

h2 {
	padding: 0px 0px 30px 0px;
	font-size: 2.50em;
}

/** WRAPPER */
#wrapper {
	background: #FFF;
	margin: 0px 20px;
}

.container {
	width: 1200px;
	margin: 0px auto;
}

.clearfix {
	clear: both;
}

/** HEADER */
#header-wrapper {
	background: #778899 url(images/overlay.png) repeat;
}

#body-wrapper {
	background: #fff url(images/overlay.png) repeat;
}

#header {
	position: relative;
	overflow: hidden;
	height: 200px;
}

#social {
	position: absolute;
	top: 4em;
	right: 0;
}

/** LOGO */
#logo {
	position: absolute;
	top: 3em;
	left: 0;
}

#logo h1, #logo p {
	margin: 0;
	padding: 0;
}

#logo h1 {
	letter-spacing: -1px;
	text-transform: lowercase;
	font-size: 3.5em;
}

#logo p {
	padding: 0px;
	letter-spacing: 0.05em;
	text-transform: uppercase;
	font-size: 0.9em;
	color: rgba(255, 255, 255, .4);
}

#logo p a {
	color: rgba(255, 255, 255, .8);
}

#logo a {
	border: none;
	background: none;
	text-decoration: none;
	color: rgba(255, 255, 255, 1);
}

/** MENU */
#menu {
	overflow: hidden;
	background: #4F4F4F;
}

#menu ul {
	margin: 0px 0px 0px 0px;
	padding: 0px 0px;
	list-style: none;
	line-height: normal;
}

#menu li {
	display: inline-block;
}

#menu a {
	display: block;
	padding: 0px 40px 0px 40px;
	line-height: 70px;
	text-decoration: none;
	text-transform: uppercase;
	text-align: center;
	font-size: 16px;
	font-weight: 200;
	color: rgba(255, 255, 255, 0.5);
	border: none;
}

#menu a:hover, #menu .current_page_item a {
	text-decoration: none;
	color: rgba(255, 255, 255, 0.8);
}

#menu .current_page_item a {
	
}

#menu .last {
	border-right: none;
}
</style>
</head>
<body>
	<%
		List<Qa> qalist = (ArrayList) request.getAttribute("qalist");
	%>

	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a href="index.jsp">아이티드루와</a>
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
	<br/><br/>
	<div align="center">
		<h3 style="font-size:50px; margin-left:-700px;">Q&A ${message}</h3><br/>
		<form action="qa.do" method="get">
			<ul class="actions">
				<li>
				<select id="job" name="job">
					<option value="코딩도와주세요">코딩도와주세요</option>
					<option value="에러잡아주세요">에러잡아주세요</option>
				</select> 
				</li>
				<li><input type='text' id="search" name="search"/></li> 
				<li><input type='hidden' name="cmd" value="qalist" /> </li>
				<li><input id="searchButton" type='button' value="검색" /></li>
			</ul>					
		</form>
		<div id="body-wrapper">
			<table style="width:850px;">
				<tr>
					<td width='80'>글번호</td>
					<td width='300'>제 목</td>
					<td width="150">작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<%
					for (int i = 0; i < qalist.size(); i++) {
				%>
				<tr>
					<td><%=qalist.get(i).getQaNum()%></td>
					<td><a href="qa.do?cmd=detail&qanum=<%=qalist.get(i).getQaNum()%>"> <%=qalist.get(i).getQaSubject()%></a></td>
					<td><%=qalist.get(i).getId()%></td>
					<td><%=qalist.get(i).getQaTime()%></td>
					<td><%=qalist.get(i).getQaCount()%></td>
				</tr>
				<%
					}
				%>
				
			</table>
				<a class="page" href="" data-page='${page-1}'>이전</a>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<a class="page" href="" data-page='<c:out value="${i}"/>'><c:out value="${i}"/></a>
				</c:forEach>
				<a class="page" href="" data-page='${page+1}'>다음</a>
				<br/>
				<div style="margin-left:-800px;">
				<a href="qa.do?cmd=write">글쓰기</a>
				</div>
				<br/>
		</div>
	</div>
</body>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	var search = '${search}';
	var option = '${job}';
	var page = '${page}';
	
	$("#job").val(option).attr("selected", "selected");
	$('#search').val(search);
	
	$('#searchButton').on('click',function(e){
		e.preventDefault();
		search = $('#search').val();
		option = $('#job').val();
		$(location).attr('href',"qa.do?cmd=list&search="+search+"&job="+option);
	});
	
	$('.page').on('click',function(e){
		e.preventDefault();
		search = $('#search').val();
		option = $('#job').val();
		$(location).attr('href',"qa.do?cmd=list&search="+search+"&job="+option+"&page="+$(this).data('page'));
	});
</script>
</html>