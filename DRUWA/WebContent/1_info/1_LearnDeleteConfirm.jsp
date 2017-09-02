<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
int result=(Integer)(request.getAttribute("learnDelete")); 
String leNum=request.getParameter("leNum");
%>
<!DOCTYPE html>
<html>
<head>
<title>job 모두의 이론</title>
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#deleteConfirm{
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
				<li class="current_page_item"><a href="/DRUWA/LearnControl?cmd=learnlist">모두의 이론</a></li>
				<li><a href="/DRUWA/1_info/2_Algo.jsp">알고리즘</a></li>
				<li><a href="/DRUWA/1_info/3_dictionary.jsp">IT백과사전</a></li>
				<li><a href="/DRUWA/1_info/4_community.jsp">소모임</a></li>
            </ul>
        </nav>
    </div>
    
	<div id="deleteConfirm">
	<!-- ### 삭제시 보여주는 글 ### -->
	<%if(result==0){ %>
		<h2>글이 존재하지 않거나 비밀번호가 올바르지 않습니다.</h2>
		<a href="/DRUWA/LearnControl?cmd=view-page&leNum=<%=leNum%>">이전화면</a>
	
	<%}else{ %>
	<h2>글이 삭제되었습니다.</h2>
	<%} %>
	//
	<a href="/DRUWA/LearnControl?cmd=learnlist">목록보기</a>
	</div>
</body>
</html>