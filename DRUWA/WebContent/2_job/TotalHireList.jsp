<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="hire.model.*"%>
<%
	List<Hire> hireList = (List) request.getAttribute("hireList");
	Job job = (Job) request.getAttribute("resultJob");
%>
<!-- 체크아이콘은 favicon.ico. -->
<!-- font 폴더가 없으면 추가 못 함. 이거 웹에서 오는 거임. -->
<!-- 기본 Style에서 h1 ~ h2까지 속성 해제. 해제 안할 시 글 엄청 작아짐 -->
<!-- TableButtonSytle에 button, form, table 적용. -->
<!-- 표에 윤곽선 주는 건 Grid. skel.css에서 따와서 TableButtonSytle에 적용. -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JOB_SUB</title>
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

<!-- 위의 4개의 script import하면 화면 사이즈 작아저도 알아서 맞춰줌 및 버튼나옴. -->
</head>
<body>

  <div id="wrapper">
    <div id="header-wrapper">
      <div id="header" class="container">
        <div id="logo">
          <h1>
            <a href="#">아이티드루와</a>
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

    <section id="main" class="wrapper">
      <div class="container">

        <div id="page" class="container">

          <h2><%=job.getJobName()%></h2>
          <p><%=job.getJobDetail()%></p>

          <a href="/DRUWA/ff.tj?cmd=insert-form" class="button small">회사공고등록</a> <a href="#" class="button alt small">회사등록</a>

        </div>
        <!-- end of  id="page" class="container">


        <!-- Table -->
        <section>
          <h3>응용소프트웨어 관련 채용공고</h3>
          <br />
          <div class="table-wrapper">
            <table>
              <thead>
                <tr>
                  <th>회사명</th>
                  <th>공고명</th>
                  <th>희망언어</th>
                  <th>마감날짜</th>
                  <th>채용인원</th>
                  <th>지원자수</th>
                </tr>
              </thead>

              <!-- tfoot: 테이블 몸체 -->
              <tbody>
                <%
                	for (Hire hire : hireList) {
                %>
                <tr>
                  <td><%=hire.getCompanyId()%></td>
                  <td>
                    <a href="/DRUWA/ff.tj?cmd=company-list-page&companyId=<%=hire.getCompanyId()%>"> <%=hire.getHireTitle()%></a>
                  </td>
                  <td><%=hire.getHireLang()%></td>
                  <td><%=hire.getExpDate()%></td>
                  <td><%=hire.getHireMan()%></td>
                  <td><%=hire.getApplicantMan()%></td>
                </tr>
                <%
                	}
                %>
              </tbody>

              <!-- tfoot: 테이블 맨 아래 -->
<!--               <tfoot> -->
<!--                 <tr> -->
<!--                   <td colspan="5"></td> -->
<!--                   <td>100.00</td> -->
<!--                 </tr> -->
              </tfoot>
            </table>
          </div>
        </section>
        <!-- end of table -->

        <!-- Form -->
        <!--         <section> -->
        <!--                     <h3>Form</h3> -->
        <!--           <form method="post" action="#"> -->
        <!--             <div class="6u 12u$(xsmall)"> -->
        <!--               <input type="text" name="jobSearchBox" id="jobSearchBox" value="" placeholder="검색어를 입력하세요" /> <input type="button" name="jobSearchBox" id="jobSearchBox" value="검색" /> -->
        <!--             </div> -->

        <!--           </form> -->
        <!--         </section> -->
        <!-- end of Form -->

        <!--         <a href="#" class="button small">검색</a> -->

      </div>
    </section>
  </div>
</body>
</html>

<%--     <% --%>
<!-- //       for (Comment comment : mList) { -->
<%--     %> --%>
<!--     <tr> -->
<%--       <td><%=comment.getCommentNo()%></td> --%>
<!--       <td> -->
<%--         <a href="viewComment.jsp?cId=<%=comment.getCommentNo()%>"><%=comment.getUserId()%> 님이 쓴 글</a> --%>
<!--       </td> -->
<%--       <td><%=comment.getRegDate()%></td> --%>
<!--     </tr> -->
<%--     <% --%>
<!-- //       } -->
<%--     %> --%>
