<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="member.model.Member" %>

<!DOCTYPE html>
<html>
<head>
<title>모두 글쓰기 </title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

#write{
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
	Object obj=session.getAttribute("loginView"); 
	if(obj==null){
		response.sendRedirect("/DRUWA/MemberControl?cmd=please-login-page");
	}else{
		Member dao=(Member)obj;
	%>
    
	<div id="write" style="margin-right:500px;">
	<h2>모두의 이론 글쓰기</h2>
	<br/><br/>
		<div id="writeForm"></div>
		<form name='frm' method='post' action='/DRUWA/LearnControl?cmd=learnwrite'>
		<ul class="actions">
		   <li> 작성자ID&nbsp;</li><li><input type="text" id="id" name="id"  size="20" style="width:230px;" readonly value="<%=dao.getId()%>"></input></li>

		   <div style="margin-left: 400px; margin-top:-50px;">
		   <li>비밀번호 &nbsp;</li><li><input id="lePass" name="lePass" type="password" placeholder="비밀번호" style="width:200px;" required/></li><br/><br/>
		   </div>
		  	<li>모두의 이론 종류 선택&nbsp;</li>
		  <li>
		  <select id="leType" name="leType">
				<option value="기술면접대비하기">기술면접대비하기</option>
				<option value="ABOUT JAVA">ABOUT JAVA</option>
				<option value="ABOUT C">ABOUT C</option>
				<option value="ABOUT DATABASE">ABOUT DATABASE</option>
		  </select>
		  </li>
		  <br/> <br/>
		  <li>제   &nbsp; &nbsp; 목</li>&nbsp; &nbsp;<li><input id="leTitle" name="leTitle" type="text" placeholder="제목을 입력하세요" size="50" required></li>   
		 </ul>  
		    글 내용<br/><br/>
		  <textarea id="leContent" name="leContent" cols="110" rows="10" placeholder="글을 입력하세요"></textarea>
		  <br/>
		  <br/>
		 <input type='submit' value='저장하기'>
	</div>
	<%}%>
</body>
</html>