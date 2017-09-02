<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="learn.model.Learn" %>
<% 
	Learn dao=(Learn)(request.getAttribute("learnView")); 
%>
<!DOCTYPE html>
<html>
<head>
<title>job 모두의 이론</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/DRUWA/css/style.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

#viewContent{
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
    
    <div id="viewContent" style="width:900px;">
    	<h2>모두의 이론</h2>
	    <div id="viewTable">
		    <table>
		    <tr>
			    <td width="100px">글번호</td>
			    <td width="680px"><%=dao.getLeNum()%></td>
			  </tr>
			  <tr>
			    <td width="100px">작성자</td>
			    <td width="680px"><%=dao.getId() %></td>
			  </tr>
			  <tr>
			    <td width="100px">제목</td>
			    <td><%=dao.getLeTitle() %></td>
			  </tr>
			  <tr>
			    <td width="100px">등록시간</td>
			    <td><%=dao.getLeTime() %></td>
			  </tr>
			  <tr>	
			    <td width="100px">글내용</td>
			    <td><%=dao.getLeContent() %></td>
			  </tr>
			  <tr>
			  	<td colspan="2">
			  	<ul class="actions">
				  	<li><a href="/DRUWA/LearnControl?cmd=learnlist">목록보기</a></li>&nbsp;&nbsp;&nbsp;
				  	<li><a href="/DRUWA/LearnControl?cmd=learn-page">글쓰기</a></li>&nbsp;&nbsp;&nbsp;
				  	<li><a href="/DRUWA/LearnControl?cmd=modify-pass&leNum=<%=dao.getLeNum()%>">수정하기</a></li>&nbsp;&nbsp;&nbsp;
				  	<li><a href="/DRUWA/LearnControl?cmd=delete-form&leNum=<%=dao.getLeNum()%>">삭제하기</a></li>
			  	</ul>
			  	</td>
			  </tr>
			</table>
		</div>	
		<div id="viewRe">
		<h4>댓글</h4>
		<textarea name="wirteContent" cols="100" rows="5"  style="width:850px;" readonly></textarea>
		
		<ul class="actions">
			<li><h4>댓글쓰기</h4></li>
			<li><input name="id" type="text" size="5" readonly value="<%=dao.getId()%>"></li>
			<li><input name="Re" type="text" style="margin-left:50px; width:500px;"></li>
			<li><input name="submit" type="submit" value="입력">
			
		</ul>	
			<br/>
			<br/>
		</div>
	
	</div>	
</body>
</html>