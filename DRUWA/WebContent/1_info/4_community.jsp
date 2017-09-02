<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>IT 백과사전</title>
<link rel="stylesheet" href="/DRUWA/css/style.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#community{
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
    
<!--  소모임     -->
    <div id="community">
    	<div id="community_title">
	    	<h2>소모임</h2>
	    	<div style="margin-left:120px;">
 		  	<h4>이 페이지는 스터디, 프로젝트, 면접 기타 등 IT 관련 마음이 맞는 사람들이 모여 만들어 내는 페이지입니다.</h4>
    		</div>
    	</div>
    	
    	<div id="community_search" style="margin-left:100px;">
			<select name="community_check">
				<option value="study">스터디</option>
				<option value="project">프로젝트</option>
			</select>
			<input name="searchCommunity" type="text" size="70"><input name="searchCommunity" type="button" value="검색">   		
    	</div>
    	
    	<br/>
    	<br/>
    	
    	<div align="right" style="margin-right:450px;">
   	 		<input type="button" name="writeCommunity"  id="writeCommunity"  value="소모임등록">     	
  		</div>
    </div>
    
        <div style="margin-left:900px;">
    	<img src="/DRUWA/1_info/img/error.JPG">
    	<h1>죄송합니다.홈페이지 공사중입니다.</h1>
    	</div>

</body>
</html>