<%@ page language="java" contentType="text/html; charset=utf-8"%>

<!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
<%
	request.setCharacterEncoding("utf-8");
	int result = (int) request.getAttribute("resultInsert");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HIRE_PostingSave</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

div {
	font-family: 'Hanna', serif;
}
</style>
<link href="/DRUWA/css/default.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>

  <div id="wrapper">
    <div id="header-wrapper">
      <div id="header" class="container">
        <div id="logo">
          <h1>
            <a href="index.html">아이티드루와</a>
          </h1>
          <p>
            Design by <a href="http://templated.co" rel="nofollow">yuk jo</a>
          </p>
        </div>
      </div>
      <div id="menu" class="container">
        <ul>
          <li><a href="/DRUWA/LearnControl?cmd=learnlist">Info</a></li>
          <li class="current_page_item"><a href="/DRUWA/ff.tj?cmd=job-main-page">Job</a></li>
          <li><a href="/DRUWA/qa.do?cmd=qalist">Q&A</a></li>
          <li><a href="/DRUWA/qa.do?cmd=shlist">shouting</a></li>
        </ul>
      </div>
    </div>

    <!-- 본문 시작 -->

    <div id="page" class="container">
      <!-- <div id="content"> -->
      <!-- 이건 포스팅 할 때. 왼쪽에 줄 나타남. -->

      <section>

        <h3>채용공고 등록 확인 글</h3>
        <%=result%>개의 입력되었는지 확인해보세요.
        <br />
        <a href="/DRUWA/ff.tj?cmd=total-list-page">total공고 리스트로...</a>
        <br />
        <a href="/DRUWA/ff.tj?cmd=insert-form">추가입력</a>
        <br />
      </section>

      <section>
        <div class="6u 12u$(xsmall)">
          <input type="submit" id="enrollBtn" value="등록" /> <input type="button" id="cancelBtn" value="취소" />
        </div>
      </section>

    </div>

    <div id="footer">
      <p>
        &copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.
      </p>
    </div>
    <!-- end of footer -->
  </div>

</body>
</html>