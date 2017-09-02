<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="hire.model.*"%>
<%@page import="company.model.*"%>
<%@ page import="member.model.Member"%>
<%
	// 개인이 로그인 시 정보 끌어오는 거.
	Member daoMem = (Member) (session.getAttribute("loginView"));
	// 기업이 로그인 시 정보 끌어오는 거.
	Company daoComp = (Company) session.getAttribute("companylogin");

	//기업의 공고, 평점, 후기, 회사 정보 갖고 오는 거.
	List<Hire> hireList = (List) request.getAttribute("resultCompanyHire");
	List<Rate> rateList = (List) request.getAttribute("resultCompanyRate");
	List<Review> reviewList = (List) request.getAttribute("resultCompanyReview");
	Company company = (Company) request.getAttribute("resultCompanyInfo");

	String personId = null;
	String personName = null;
	String personTel = null;
	String personPw = null;

	String loginCompId = null;
	String viewCompId = company.getCompanyId();

	if (daoMem != null) {//개인 로그인 체크
		personId = daoMem.getId();
		personName = daoMem.getName();
		personTel = daoMem.getTel();
		personPw = daoMem.getPw();

	} else if (daoComp != null) {
		loginCompId = daoComp.getCompanyId();
	}

	//response.sendRedirect("/DRUWA/CompanyControl?cmd=please-login-page");

	//기업전용 공고 갖고 오는 거
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
<title>CompanyDetailAndHire</title>
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
<script src="/DRUWA/js/accordionJquery.js"></script>
<script src="/DRUWA/js/hideAndSk.js"></script>
<!-- 위의 4개의 script import하면 화면 사이즈 작아저도 알아서 맞춰줌 및 버튼나옴. -->
<script type="text/javascript">
	window.onload = init;

	function init() {
		var loginCompId = '<%=loginCompId%>';
		var viewCompId = '<%=viewCompId%>';

		if (loginCompId == viewCompId) {
			alert('해당 기업으로 로그인 하셨습니다. 기업정보 수정과 채용공고 상세보기를 활성화 합니다.');
		}

	}
</script>
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

    <section>
      <div class="container">


        <div id="page" class="container">
          <h2><%=company.getCompanyName()%></h2>
          <%
          	if (loginCompId == null) {
          %>
          <%
          	} else if (loginCompId.equals(viewCompId)) {
          %><a href="#" class="button alt small"> 기업정보 수정하기</a>
          <%
          	}
          %>
          <p class="txt">
            <%=company.getCompanyDetail()%>
          </p>

          <table summary="기본정보">
            <colgroup>
              <col class="col1">
              <col class="col2">
              <col class="col3">
              <col class="col4">
            </colgroup>
            <tbody>
              <tr>
                <th scope="row">대표자명</th>
                <td colspan="3"><%=company.getMgr()%></td>
              </tr>
              <tr>
                <th scope="row">업종</th>
                <td colspan="3"><%=company.getCompanyJob()%></td>
              </tr>
              <tr>
                <th scope="row">사업내용</th>
                <td colspan="3"><%=company.getCompanySales()%></td>
              </tr>
              <tr>
                <th scope="row">기업형태</th>
                <td colspan="3" class="position1"><%=company.getCompanyType()%></td>
              </tr>
              <tr>
                <th scope="row">설립일</th>
                <td class="position2" colspan="3">
                  <%=company.getSetupDate()%>
                  <a href="#none" class="ico_wrap"> <i class="ico_a1"><img src="//www.saraminimage.co.kr/ui/company_info/ico_a1.png" alt="A"></i>
                  </a>
                </td>
                <!--                 <th scope="row">채용현황</th> -->
                <!--                 <td> -->
                <!--                   <a href="javascript:scrollTo({'target':'#company_info_section5','speed':'100'});" class="link_job_view">채용 진행중 <strong class="point">1건</strong></a> -->
                <!--                 </td> -->
              </tr>
              <tr>
                <th scope="row">자본금</th>
                <td><%=company.getMoney()%></td>
                <th scope="row">매출액</th>
                <td><%=company.getTotalSel()%></td>
              </tr>
              <tr>
                <th scope="row">대표전화</th>
                <td><%=company.getCompanyTel()%></td>
                <th scope="row">FAX</th>
                <td><%=company.getFax()%></td>
              </tr>
              <tr>
                <th scope="row">홈페이지</th>
                <td colspan="3">
                  <a href="http://www.cjfoodville.co.kr" class="link_site" target="_blank">http://www.cjfoodville.co.kr</a>
                </td>
              </tr>
              <tr>
                <th scope="row">기업주소</th>
                <td colspan="3"><%=company.getAddr()%></td>
              </tr>
            </tbody>

            <!-- tfoot: 테이블 맨 아래 -->
            <tfoot>
              <tr>
                <th scope="row" colspan="4"><br />우리는 이런사람을 원해요!
                  <div class="12u$">
                    <textarea name="message" id="message" placeholder="Enter your message" rows="3" disabled><%=company.getCompanyIntro()%></textarea>
                  </div></th>
              </tr>
            </tfoot>

          </table>
          <!-- end of 기업정보테이블>
        </div>
        <!-- end of  id="page" class="container">


        <!-- 현재 진행 중인 공고 Table -->
          <section>
            <h4>
              현재 진행 중인 공고
              <%=hireList.size()%>건
            </h4>
            <div class="table-wrapper">


              <table>
                <thead>
                  <tr>
                    <th>업종명</th>
                    <th>공고명</th>
                    <th>희망언어</th>
                    <th>마감날짜</th>
                    <th>지원자수</th>
                    <th>지원하기</th>
                  </tr>
                </thead>

                <!-- tbody: 테이블 몸체 -->
                <tbody class="research">
                  <!--                   for (Hire hire : hireList) { -->
                  <%
                  	for (int i = 0; i < hireList.size(); i++) {
                  %>

                  <tr class="trheader">
                    <td><%=hireList.get(i).getHireJob()%></td>
                    <!--업종-->
                    <td><%=hireList.get(i).getHireTitle()%></td>
                    <!--공고명-->
                    <td><%=hireList.get(i).getHireLang()%></td>
                    <!--희망언어-->
                    <td><%=hireList.get(i).getExpDate()%></td>
                    <!--마감날짜-->
                    <td><%=hireList.get(i).getApplicantMan()%></td>
                    <!--지원자수-->
                    <td>
                      <%
                      	if (loginCompId == null & personId == null) {
                      %>
<a href="/DRUWA/MemberControl?cmd=please-login-page" class="button small"> 개인 로그인</a>
<a href="/DRUWA/CompanyControl?cmd=please-login-page" class="button small"> 회사 로그인</a>
                  </td>
                  </tr>
                      <%
                      	} else if ( loginCompId != null && loginCompId.equals(viewCompId)) {
                      			//해당기업이라면
                      %>
                      <a href="/DRUWA/ff.tj?cmd=modifyhire-and-viewapli&hireNum=<%=hireList.get(i).getHireNum()%>" class="button alt small"> 상세보기</a>
                      <%
                      	} else if (personId != null) {
                      			//해당기업은 아닌데 개인로그인 한 상태라면
                      %>
                      <input type="button" class="button alt small apply" value="지원하기" style="background: #fff">
                    </td>
                  </tr>

                  <form name="frmApli[<%=i%>]" action="/DRUWA/HireControl?cmd=insert-apli&companyId=<%=company.getCompanyId()%>" method="post">
                  <tr>
                    <td>지원자명</td>
                    <td>
                      <input type="text" value="<%=personName%>" placeholder="지원자명" readonly /> <input type="hidden" id="personId[<%=i%>]" name="id" value="<%=personId%>" />
                    </td>
                    <td>연락처</td>
                    <td colspan="3">
                      <input type="text" name="apliTel" value="<%=personTel%>" id="apliTel[<%=i%>]" placeholder="연락처" />
                      <input type="hidden" id="hireNum[<%=i%>]" name="hireNum" value="<%=hireList.get(i).getHireNum()%>" />
                    </td>
                  </tr>
                  <tr style="background: #fff;">
                    <td>가능한 프로그래밍 언어</td>
                    <td colspan="5">
                      <div class="6u 12u$(small)">
                        <%
                        	StringTokenizer tokens = new StringTokenizer(hireList.get(i).getHireLang(), ",");
                        			while (tokens.hasMoreTokens()) {
                        				String str = null;
                        				str = tokens.nextToken();
                        %>
                        <input type="checkbox" id="<%=str%>[<%=i%>]" name="apliLang" value="<%=str%>"> <label for="<%=str%>[<%=i%>]"><%=str%></label>
                        <%
                        	}
                        %>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>이력서 파일첨부</td>
                    <td colspan="4">
                      <!--                         <div class="filebox"> -->
                      <!--                           <input class="upload-name" value="파일선택" readonly > <label for="ex_filename">업로드</label> <input type="file" id="ex_filename" class="upload-hidden"> -->
                      <!--                         </div> -->
                      <input type="file" id="apliResume[<%=i%>]" name="apliResume" readonly />
                    </td>
                    <td>
                      <input type="submit" id="enrollBtn[<%=i%>]" value="지원" class="button special small" />
                    </td>
                  </tr>
                  </form>
                  <%
                  	} else {
                  			//해당기업이 아니거나 개인이 로그인 안했을 경우.
                  %>
                  기업으로 로그인 하셨습니다.
                  </td>
                  </tr>
                  <%
                  	} // if끝.
                  %>

                  <%
                  	} // 채용공고 for문 끝.
                  %>
                </tbody>

                <!-- tfoot: 테이블 맨 아래 -->
                <tfoot>
                  <tr>
                  </tr>
                </tfoot>
              </table>


            </div>
          </section>
          <!-- end of table -->


          <!-- 회사평가 Table -->

          <section>
            <h4>회사평가</h4>
            <div class="table-wrapper">

              <table>
                <thead>
                  <tr>
                    <th>닉네임</th>
                    <th>회사 평가내용</th>
                    <th>작성시간</th>
                    <th>삭제</th>
                  </tr>
                </thead>

                <!-- tbody: Rate 테이블 몸체 -->
                <tbody class="forDelete">
                  <%
                  	for (int i = 0; i < rateList.size(); i++) {
                  %>
                  <form name="frmRateDel[i]" action="/DRUWA/HireControl?cmd=delete-review-rate&sw=rate" method="post">
                    <tr>
                      <td><%=rateList.get(i).getNick()%></td>
                      <!--닉네임-->
                      <td><%=rateList.get(i).getRateContent()%></td>
                      <!--내용-->
                      <td>
                        <div class="rateTime"><%=rateList.get(i).getRateTime()%></div>
                        <input type="text" name="ratePass" class="pwField" placeholder="비밀번호를 입력하세요" required /><input type="submit" class="button small" value="확인" />
                      </td>
                      <!--작성시간-->
                      <td>
                        <input type="hidden" name="companyId" value="<%=company.getCompanyId()%>" /> <input type="button" class="button alt small deleteBtn" value="삭제"> <input type="hidden" value="<%=rateList.get(i).getRatePass()%>"> <input type="hidden" name="rateNum" value="<%=rateList.get(i).getRateNum()%>">
                      </td>
                    </tr>
                  </form>
                  <%
                  	}
                  %>
                </tbody>

                <!-- tfoot: 테이블 맨 아래 -->
                <form name="frmRate" action="/DRUWA/HireControl?cmd=insert-review-rate&sw=rate" method="post">
                  <tfoot>
                    <tr>
                      <td width="20%">
                        <input type="text" name="nick" placeholder="닉네임을 입력하세요" required />
                      </td>
                      <td width="50%">
                        <input type="text" name="rateContent" placeholder="회사 소감을 짧게 입력하세요" required />
                      </td>
                      <td>
                        <input type="text" name="ratePass" placeholder="비번입력" required />
                      </td>
                      <td>
                        <input type="hidden" name="companyId" value="<%=company.getCompanyId()%>" /> <input type="submit" class="button small" value="등록" />
                      </td>
                    </tr>
                  </tfoot>
                </form>
              </table>
            </div>
          </section>

          <!-- end of table -->
          <!-- style="display: inline; width: 50%"  -->

          <!-- 면접후기 Table -->

          <section>
            <h4>면접후기</h4>
            <div class="table-wrapper">

              <table>
                <thead>
                  <tr>
                    <th>닉네임</th>
                    <th>면접후기 내용</th>
                    <th>작성시간</th>
                    <th>삭제</th>
                  </tr>
                </thead>

                <!-- tfoot: 테이블 몸체 -->
                <tbody class="forDelete">
                  <%
                  	for (int i = 0; i < reviewList.size(); i++) {
                  %>
                  <form name="frmReviewDel[i]" action="/DRUWA/HireControl?cmd=delete-review-rate&sw=review" method="post">
                    <tr>
                      <td><%=reviewList.get(i).getNick()%></td>
                      <!--닉네임-->
                      <td><%=reviewList.get(i).getReviewContent()%></td>
                      <!--내용-->
                      <td>
                        <div class="reviewTime"><%=reviewList.get(i).getReviewTime()%></div>
                        <input type="text" name="reviewPass" class="pwField" placeholder="비밀번호를 입력하세요" required style="display: inline;
	width: 50%" /><input type="submit" class="button small" value="확인" />
                      </td>
                      <!--작성시간-->
                      <td>
                        <input type="hidden" name="companyId" value="<%=company.getCompanyId()%>" /> <input type="button" class="button alt small deleteBtn" value="삭제"> <input type="hidden" value="<%=reviewList.get(i).getReviewPass()%>"> <input type="hidden" name="reviewNum" value="<%=reviewList.get(i).getReviewNum()%>">
                      </td>
                    </tr>
                  </form>
                  <%
                  	}
                  %>
                </tbody>

                <!-- tfoot: 테이블 맨 아래 -->
                <form name="frmReview" action="/DRUWA/HireControl?cmd=insert-review-rate&sw=review" method="post">
                  <tfoot>
                    <tr>

                      <td width="20%">
                        <input type="text" name="nick" placeholder="닉네임을 입력하세요" required />
                      </td>

                      <td width="50%">
                        <input type="text" name="reviewContent" placeholder="면접 후기를 짧게 등록해주세요" required />
                      </td>

                      <td>
                        <input type="text" name="reviewPass" placeholder="비번입력" required />
                      </td>

                      <td>
                        <input type="hidden" name="companyId" value="<%=company.getCompanyId()%>" /> <input type="submit" class="button small" value="등록" />
                      </td>

                    </tr>
                  </tfoot>
                </form>
              </table>
            </div>
          </section>


          <ul class="actions">
            <li><input type="text" name="" id="" value="" placeholder="비번입력" /></li>
            <li><input type="button" class="button small" value="등록" /></li>
          </ul>

          <!-- end of table -->

          <!-- <a href="#" class="button alt small">회사등록</a> -->

        </div>
      </div>
    </section>

  </div>
</body>
</html>

