<%@page import="member.model.Member"%>
<%@page import="qa.model.RepleVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="qa.model.Qa"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
Qa qa = (Qa)request.getAttribute("qa");
String pass = qa.getQaPass();
int qaNum = qa.getQaNum();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
</style>
</head>
<body>
<%
Member login = (Member)request.getSession().getAttribute("loginView");
 
if(login == null){
	login = new Member();
}
 
    List<RepleVo> repleList = (List)request.getAttribute("repleList"); 
   System.out.println("repleList :: " +repleList.size());
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
   <div align="center">
   <h4 style="font-size:50px; margin-left:-800px;"> 게시판 글 보기 </h4><br/>
<%--    <a href="qa.do?cmd=update&qanum=<%=qa.getQaNum()%>">수정</a> --%>
   
<!--    <input type="button" id="button1" value="수정하기1" onclick="clickButton()"/> -->
   
   
    <form name="frmPass" action="qa.do" method="post">
    <ul class="actions" style="margin-left:500px;">
      <li><input type = "text" name = "inputPass" placeholder="비밀번호 입력하세요"/></li>
      <input type="hidden" name="pass" value="<%=qa.getQaPass()%>"/>
      <input type="hidden" name="qaNum" value="<%=qa.getQaNum()%>"/>
      <input type="hidden" name="cmd" value="updatePassCheck"/></li>
      <li><input type="submit" value="수정하고싶으면눌러라"/>
    </ul>
     </form>
 <%
 
 System.out.println("글의 작성자 : " + qa.getId() + "  로그인한 사람 : " + login.getId());
 if(qa.getId().equals(login.getId())){
 %>
          <a href="qa.do?cmd=delete&qanum=<%=qa.getQaNum()%>">삭제</a>
 <%
 }
 %>
   <table border=1 style="width:900px">
   <tr>
      <td><%=qa.getId()%></td>
      <td> <%=qa.getQaType()%></td>
      <td><%=qa.getQaTime()%></td>
   </tr>
   <tr>
      <td colspan = '3'>  <div rows="20" cols="150"> <%=qa.getQaContent()%> </div></td>
   </tr>
   
   </table>
   
	  <h3 style="margin-left:-800px; font-size:30px;">댓글 </h3>
      <table style="width:900px">
         <c:if test="${empty repleList}">
            <tr>
               <td colspan='2'>작성된 댓글이 없습니다.</td>
            </tr>
         </c:if>

            <c:forEach items="${repleList}" var="reple">
            <tr>
              
                  <td>${reple.id }</td>
              
               <td><div cols="142">${reple.qaReContent}</div></td>
               <td><div cols="30">${reple.qaReTime}</div></td>
            </tr>
            </c:forEach>

      </table>

<%
System.out.println("댓글 전 로그인한 아이디 출력 : " + login.getId());
if(login.getId()!="" && login.getId()!=null){
 %>
      <h3 style="margin-left:-800px; font-size:20px;">댓글 쓰기</h3>
      <form action="qa.do" method="post">
      <ul class="actions">
         <li><input type="hidden" name="cmd" value="reple" /></li>
         <li><input type="hidden" name="qaNum" value="<%=qa.getQaNum() %>" /></li>
         <li><table style="width:900px;"></li>
            <tr>
               <td rowspan='3'><input name="id" type="hidden" value="<%=login.getId()%>"><%=login.getId()%></input></td>
               <td><textarea cols="135" name="qaReContent" style="width:700px;"></textarea></td>
               <td><input type="submit" value="입력"/></td>
            </tr></li>
         </table>
       </ul>
      </form>
      
      <%} %>
   </div>
</body>
</html>