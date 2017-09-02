<%@page import="member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
div{
font-family: 'Hanna', serif;
}
</style>
</head>
<body>
<% 
Member login = (Member)request.getSession().getAttribute("loginView");
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
   <center>
   <form action="qa.do" method="post">
      <h4 style="font-size:50px; margin-left:-800px;"> 게시판 글 쓰기</h4><br/>
      <table style="width:900px">
      <tr>
         <input name="cmd" type="hidden" value="insert" />
         <td>
            ID :<input name="id" type="hidden" value="<%=login.getId()%>"><%=login.getId()%></input>
         </td>
         <td>
            <div class="12u$">
                      <div class="select-wrapper">
                        <select name="qa_type" id="qa_type">
                          <option value="코딩도와주세요">코딩도와주세요</option>
                          <option value="에러잡아주세요">에러 잡아주세요</option>
                        </select>
                      </div>
                    </div> 
         </td>
       </tr>
       <tr>
       	<td>제목</td>
         <td colspan='2'>
            <input name="qa_subject" type="text" placeholder="제목" style="width:300px;"></input>
         </td>
      </tr>
      <tr>
         <td colspan = '3'>  
            <textarea name="qa_content" rows="20" style="width:900px; height:300px;">내용 </textarea>
         </td>
      </tr>
      <tr>
      	<td>비밀번호를 입력하세요</td>
         <td colspan='2'>
            <input name="qa_pass" type="password" placeholder="비밀번호" style="width:300px;"></input>
         </td>
      </tr>
      </table>
      <input type="submit" value="저장" />
   </form>
   
   
</center>
</body>
</html>