<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="learn.model.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>개인 로그인 화면</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/DRUWA/css/style.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

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
	<br/>
	<br/>
	<div>
		<center>
		<h2>개인 회원로그인</h2>
		<br/>

		</div>
		<br/>
		<ul class="actions">
			<form id="frm" method="post" action='/DRUWA/MemberControl?cmd=login-page'>
	            <table border="0" style="width:500px; margin-left:750px;">
	                <tr height="50px">
	                	<th scope="row">ID</th>
	                    <td><input name="id" type="text" size="18"/></td>
	                    <td rowspan="2"><input type="submit" name="login"  value="login" style="margin-left:20px; margin-top:10px; width:120px; height:70px;"/></td>
	                </tr>
	                <tr>
	                    <th scope="row">PASS</th>
	                    <td><input name="pw" type="password" size="18" /></td>
	                </tr>
	             </table>
	         </form>
	         <br/>
	         <div id="regMember" style="text-align:center;">
	            <h3><a href="/DRUWA/MemberControl?cmd=enroll-page">회원가입</a></h3>
	         </div>
			 </li>
		 </ul>
	</div>

</body>
</html>