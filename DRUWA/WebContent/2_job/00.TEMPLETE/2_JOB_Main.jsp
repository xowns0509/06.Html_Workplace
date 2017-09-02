<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="hire.model.*"%>

<%
	//  for(int i = 1; i<=16 ; i++){
	//request.getAttribute("resultJob" + String.valueOf(i) + "HireTop10");
	//  }
	ArrayList<List<Hire>> ary = new ArrayList<List<Hire>>();

	for (int i = 1; i <= 16; i++) {
		ary.add((List<Hire>) request.getAttribute("resultJob" + String.valueOf(i) + "HireTop10"));
	}

	List<Job> jobList = (List) request.getAttribute("result16Job");
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

<link href="/DRUWA/css/JOB_main.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
  <div id="wrapper">

    <div id="header-wrapper">
      <div id="header" class="container">
        <div id="logo">
          <h1>
            <a href="index.jsp">아이티드루와</a>
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
    <!-- end of header-wrapper -->


    <div id="page" class="container">
      <div id="content" style="width: 70%;
	padding-left: 20px;">
        <!-- style="background-color:#FF00CC" -->
<!--                 <div class="post" id="hihi"> -->
<!--                   <div class="post-title"> -->
        <section>
          <h2>IT에 관련된 다양한 분야들을 확인하세요</h2>
<!--           <div class="box alt"> -->
            <div class="row 50% uniform">

              <%
              	for (int i = 0; i < jobList.size(); i++) {
              %>
              <div class="3u view view-first">

                <!-- 마우스 오버 전 -->
                <h4><%=jobList.get(i).getJobName()%></h4>
                <ul>
                  <li><%=jobList.get(i).getJobSummary()%></li>
                </ul>

                <!-- 마우스 오버 후 -->
                <div class="mainpic">
                  <a href="/DRUWA/ff.tj?cmd=total-list-page&hireJob=<%=jobList.get(i).getJobName()%>" class="enter">
                    <h2><%=jobList.get(i).getJobName()%></h2>
                  </a>
                  <p>
                    <%
                    	for (int j = 0; j < ary.get(i).size(); j++) {
                    %>
                    <a href="/DRUWA/ff.tj?cmd=company-list-page&companyId=<%=ary.get(i).get(j).getCompanyId()%>" class="enter"><%=ary.get(i).get(j).getHireTitle()%>
                    </a>
                    <br />

                    <%
                    	}
                    %>
                  </p>
                </div>

              </div>
              <%
              	}
              %>

            </div>
            <!-- end of row 50% uniform -->
<!--           </div> -->
          <!-- end of box alt -->


        </section>

<!--          </div> -->
        <!-- end of post-title -->
<!--         </div> -->
        <!-- end of post -->

      </div>
      <div id="sidebar1" style="width: 30%;
	padding-left: 50px;
	padding-right: 20px;
	margin-right: 0px">
        <!--        style="width:30%" -->
        <div>
          <h2>회사명 검색</h2>
          <ul class="style2">
            <li class="first"><input name="search" type="text" placeholder="회사명 입력 후 Enter!" /></li>
            <li>
              <h3>
                <a href="#">취업관련 용어</a>
              </h3>

              <table>
                <tr>
                  <td>
                    <p>
                      *외부스키마: 사용자 관점에서 필요로 하는 데이터 베이스 일반사용자가 SQL(질의어)를 이용해서 데이터 베이스에 접근
                      <br />
                      <br />
                      *개념스키마: 데이터베이스의 접근권한, 보안정책, 무결성규칙 명세화 모든 사용자 관점을 하나로 통합. 접근 권한, 보안, 무결성 등 정의. DBA에 의해 구성
                      <br />
                      <br />
                      *내부스키마: 물리적 저장구조 , 데이터가 실제적으로 저장되는 방법을 표현, 시스템 프로그래머, 시스템 설계자가 보는 관점 스키마 데이터 모델링: 통합관점의 뷰를 가지고 있는 개념스키마를 만들어가는 과정
                    </p>
                  </td>
                </tr>
              </table>

            </li>
          </ul>
        </div>
      </div>
      <!-- end of sidebar1 -->

    </div>


    <div id="footer" class="copyright">
      <p>
        &copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.
      </p>
    </div>
    <!-- end of footer -->
  </div>
  <!-- end of wrapper -->
</body>
</html>