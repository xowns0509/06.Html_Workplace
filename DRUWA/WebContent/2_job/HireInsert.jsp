<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*"%>
<%@page import="hire.model.Hire"%>
<%@ page import="company.model.Company"%>
<%
	//  List<Hire> hireList = (List) request.getAttribute("hireList");

	Object obj = session.getAttribute("companylogin");
	Company dao = null;
  
	if (obj == null) {
		response.sendRedirect("/DRUWA/CompanyControl?cmd=please-login-page");

	} else {
		dao = (Company) obj;

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JOB Main페이지</title>
<link href="/DRUWA/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<!-- <link href="/DRUWA/css/skel.css" rel="stylesheet" /> -->
<!-- <link href="/DRUWA/css/style-xlarge.css" rel="stylesheet" /> -->
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

div {
	font-family: 'Hanna', serif;
}
</style>
<script src="/DRUWA/js/jquery.min.js"></script>
<script src="/DRUWA/js/skel.min.js"></script>
<script src="/DRUWA/js/skel-layers.min.js"></script>
<script src="/DRUWA/js/init.js"></script>
<script type="text/javascript">
	window.onload = init;

	function init() {
		var today = new Date();

		document.getElementById("strDate").value = today.toLocaleDateString()
				+ "  " + today.toLocaleTimeString();
		//값을 넣을 때도 그냥 getElementById 해줘도 됨.
	}
</script>
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
    <form name="frm" action="/DRUWA/HireControl?cmd=insert-save" method="post">
      <div id="page" class="container">
        <!-- <div id="content"> -->
        <!-- 이건 포스팅 할 때. 왼쪽에 줄 나타남. -->

        <!-- Table -->
        <section>

          <h2>채용 공고 화면</h2>
          <br />

          <div class="table-wrapper">
            <table>
              <thead>
                <tr>
                  <th>회사명</th>
                  <td>
                    <input type="text" name="companyName" value="<%=dao.getCompanyName()%>" readonly /> <input type="hidden" name="companyId" value="<%=dao.getCompanyId()%>" />

                  </td>
                  <th>등록날짜</th>
                  <td>
                    <input type="text" name="strDate" id="strDate" />
                  </td>
                </tr>
              </thead>

              <!-- tfoot: 테이블 몸체 -->
              <!-- 2열 -->
              <tbody>
                <tr>
                  <th>공고명</th>
                  <td colspan="3">
                    <input type="text" name="hireTitle" id="hireTitle" />
                  </td>
                </tr>

                <!-- 3열 -->
                <tr>
                  <th>업종</th>
                  <td>
                    <div class="12u$">
                      <div class="select-wrapper">
                        <select name="hireJob" id="hireJob">
                          <option value="아무나">- 업종을 선택하세요 -</option>
                          <option value="웹기획·웹마케팅·PM">웹기획·웹마케팅·PM</option>
                          <option value="웹디자인">웹디자인</option>
                          <option value="웹프로그래머">웹프로그래머</option>
                          <option value="응용프로그래머">응용프로그래머</option>
                          <option value="시스템프로그래머">시스템프로그래머</option>
                          <option value="ERP·시스템분석·설계">ERP·시스템분석·설계</option>
                          <option value="하드웨어·소프트웨어">하드웨어·소프트웨어</option>
                          <option value="서버·네트워크·보안">서버·네트워크·보안</option>
                          <option value="데이터베이스·DBA">데이터베이스·DBA</option>
                          <option value="HTML·웹표준·UI개발">HTML·웹표준·UI개발</option>
                          <option value="통신·모바일">통신·모바일</option>
                          <option value="동영상·편집·코덱">동영상·편집·코덱</option>
                          <option value="IT·디자인·컴퓨터교육">IT·디자인·컴퓨터교육</option>
                          <option value="컨텐츠·사이트운영">컨텐츠·사이트운영</option>
                          <option value="게임·Game">게임·Game</option>
                          <option value="웹마스터·QA·테스터">웹마스터·QA·테스터</option>
                        </select>
                      </div>
                    </div>
                  </td>
                  <th>채용인원</th>
                  <td>
                    <input type="text" name="hireMan" id="hireMan" />
                  </td>
                </tr>

                <!-- 4열 -->
                <tr>
                  <th>프로그래밍 언어</th>
                  <td colspan="3">
                    <div class="6u 12u$(small)">
                      <input type="checkbox" id="C++" name="hireLang" value="C++"> <label for="C++">C++</label> <input type="checkbox" id="JAVA" name="hireLang" value="JAVA"> <label for="JAVA">JAVA</label> <input type="checkbox" id="C#" name="hireLang" value="C#"> <label for="C#">C#</label> <input type="checkbox" id="Python" name="hireLang" value="Python"> <label for="Python">Python</label> <input type="checkbox" id="SQL" name="hireLang" value="SQL"> <label for="SQL">SQL</label> <input type="checkbox" id="LUA" name="hireLang" value="LUA"> <label for="LUA">LUA</label>
                    </div>
                  </td>
                </tr>

                <!-- 5열 -->
                <tr>
                  <th>마감날짜</th>
                  <td>
                    <input type="text" name="expDate" id="expDate" />
                  </td>
                  <td></td>
                  <td>
                    <div class="4u 12u$(xsmall)">
                      <input type="radio" id="hire_sw_on" name="hireSw" value="on" checked /> <label for="hire_sw_on">채용중</label> <input type="radio" id="hire_sw_off" name="hireSw" value="off" /> <label for="hire_sw_off">채용마감</label>
                    </div>
                  </td>
                </tr>



              </tbody>

              <!-- tfoot: 테이블 맨 아래 -->
              <tfoot>
                <tr>
                  <td colspan="4">
                    <section>
                      <div class="6u 12u$(xsmall)">
                        <input type="submit" id="enrollBtn" value="등록" class="special" /> <input type="button" id="cancelBtn" value="취소" />
                      </div>
                    </section>
                  </td>
                </tr>
              </tfoot>
            </table>
            <!-- end of table -->


          </div>
        </section>




      </div>
    </form>
    <!-- end of form -->

    <div id="footer">
      <p>
        &copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.
      </p>
    </div>
    <!-- end of footer -->
  </div>

</body>
</html>