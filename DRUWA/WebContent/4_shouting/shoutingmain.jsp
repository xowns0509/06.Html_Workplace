<%@page import="qa.model.Sh"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
</style>
</head>
<body>
<%
List<Sh> shList = (List)request.getAttribute("shList");
System.out.println("테스트 : " + shList.size());
%>
<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="index.jsp">아이티드루와</a></h1>
				<p>Design by <a href="http://templated.co" rel="nofollow">yuk jo</a></p>
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
	<div id="body-wrapper">
	<div align = 'center'>
	<br/><br/><br/>
	<h3 style="font-size:50px; margin-left:-550px;">SHOUTING</h3>
	<h4 style="margin-left:-550px; color:red;">*하고싶은말을 255자 이내로 쓰세요*</h4>	
	<form action="qa.do" method = "post">
	<ul class="actions small">
		<li><input type='hidden' name='cmd' value='shinsert' /></li> <!-- 컨트롤러shinsert가 -->
		<li><input id='nick' name='nick' type='text' placeholder='닉네임' style="width:80px" /></li>
		<li><input id='shContent' name = 'shContent' type='text' style="width:500px" placeholder='댓글쓰는곳' size = '70' /></li>
		<li><input type='submit' value = "등록"></input>
	</ul>
	</form>
<!-- 	<textarea cols="135" rows="30">댓글 달리는곳</textarea> -->
	<table style="width:950px;">
	<tr>
		<td>글번호</td>
		<td>닉네임</td>
		<td>내용</td>
		<td>작성시간</td>
		<td>추천수</td>
		<td>&nbsp;</td>
	</tr>
		<c:forEach items="${shList}" var="sh">
		   <tr>
			   <td>${sh.shNum}</td>
			   <td>${sh.nick}</td>
			   <td>${sh.shContent}</td>
			   <td>${sh.shTime}</td>
			   <td>${sh.shRate}</td>
		  	    <td style="width:10px;">
			   <form action="qa.do" method="post">
					<input type="hidden" name="cmd" value="up"/>
					<input type="hidden" name="shseq" value="${sh.shNum}"/>
					<input type="submit" value="추천" class="button alt small"/>
				</form>
			</td>
		   </tr>
		</c:forEach>
   </table>
	
	</div>
	</div>
</body>
</html>