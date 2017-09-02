<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="hire.model.Hire"%>
<%
	List<Hire> hireList = (List) request.getAttribute("resultCompanyHire");
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
          <li class="current_page_item"><a href="#" accesskey="1" title="">Info</a></li>
          <li><a href="#" accesskey="1" title="">Job</a></li>
          <li><a href="#" accesskey="2" title="">Q&A</a></li>
          <li><a href="#" accesskey="3" title="">shouting</a></li>
        </ul>
      </div>
    </div>

    <section>
      <div class="container">


        <div id="page" class="container">
          <h2>CJ 푸드빌</h2>

          <p class="txt">
            ‘더스테이크하우스 바이 빕스’는 최상 등급의 원육만을 엄선해 뉴욕 전통 스테이크 조리법으로 완벽하게 구운 최상의 스테이크를 경험할 수 있는 Fine Dining Restaurant입니다.
            <br>
            <br>
            더스테이크하우스 바이 빕스는 T자 모양의 뼈를 중심으로 양 옆에 두툼한 등심과 안심이 붙어 있어 두 가지 스테이크 맛을 동시에 즐길 수 있는 포터하우스 스테이크(Porterhouse Steak)와 최상급 립아이를 전용 에이징 쿨러 안의 적정 온도와 습도에서 말리듯이 2~3주간 숙성해 농축된 맛과 부드러운 육질이 뛰어난 드라이 에이지드 스테이크(Dry Aged Steak)등 다양한 정통 스테이크를 선보입니다. 또한 세련된 프리미엄 이탈리안 스타일의 퀴진과 전 세계에서 공수된 다양한 와인은 진정한 미식의 경험을 선사할 것입니다.
            <br>
            <br>
            뉴욕 맨하탄의 감성이 느껴지는 더스테이크하우스 바이 빕스에서 프리미엄 스테이크의 진수를 느껴 보세요!
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
                <th scope="row">기업명</th>
                <td>CJ푸드빌</td>
                <th scope="row">대표자명</th>
                <td>정문목</td>
              </tr>
              <tr>
                <th scope="row">업종</th>
                <td colspan="3">외식업·식음료</td>
              </tr>
              <tr>
                <th scope="row">사업내용</th>
                <td colspan="3">경양식점 운영,외식사업</td>
              </tr>
              <tr>
                <th scope="row">기업형태</th>
                <td colspan="3" class="position1">대기업, 법인사업체</td>
              </tr>
              <tr>
                <th scope="row">설립일</th>
                <td class="position2" colspan="3">
                  2000년 7월 1일 (업력 16년) <a href="#none" class="ico_wrap"> <i class="ico_a1"><img src="//www.saraminimage.co.kr/ui/company_info/ico_a1.png" alt="A"></i>
                  </a>
                </td>
                <!--                 <th scope="row">채용현황</th> -->
                <!--                 <td> -->
                <!--                   <a href="javascript:scrollTo({'target':'#company_info_section5','speed':'100'});" class="link_job_view">채용 진행중 <strong class="point">1건</strong></a> -->
                <!--                 </td> -->
              </tr>
              <tr>
                <th scope="row">매출액</th>
                <td colspan="3" class="position4">1조 1,211억 2,936만원</td>
              </tr>
              <tr>
                <th scope="row">자본금</th>
                <td>636억 5,141만원</td>
                <th scope="row">당기순이익</th>
                <td>50억 9,025만원</td>
              </tr>
              <tr>
                <th scope="row">대표전화</th>
                <td>02-548-1366</td>
                <th scope="row">FAX</th>
                <td>02-6244-0096</td>
              </tr>
              <tr>
                <th scope="row">홈페이지</th>
                <td colspan="3">
                  <a href="http://www.cjfoodville.co.kr" class="link_site" target="_blank">http://www.cjfoodville.co.kr</a>
                </td>
              </tr>
              <tr>
                <th scope="row">기업주소</th>
                <td colspan="3">서울 강남구 신사동 651-15번지 청담 CGV 2층 더스테이크하우스</td>
              </tr>
            </tbody>

            <!-- tfoot: 테이블 맨 아래 -->
            <tfoot>
              <tr>
                <th scope="row" colspan="4"><br />우리는 이런사람을 원해요!
                  <div class="12u$">
                    <textarea name="message" id="message" placeholder="Enter your message" rows="3" disabled></textarea>
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
                  <%
                  	for (Hire hire : hireList) {
                  %>
                  <tr class="trheader">
                    <td><%=hire.getHireJob()%></td>
                    <!--업종-->
                    <td><%=hire.getHireTitle()%></td>
                    <!--공고명-->
                    <td><%=hire.getHireLang()%></td>
                    <!--희망언어-->
                    <td><%=hire.getExpDate()%></td>
                    <!--마감날짜-->
                    <td><%=hire.getApplicantMan()%></td>
                    <!--지원자수-->
                    <td>
                      <input type="button" class="button alt small" value="지원하기">
                    </td>
                  </tr>
                  <tr>
                    <td>지원자ID</td>
                    <td>
                      <input type="text" name="companyName" id="companyName" value="지원자ID" placeholder="지원자ID" readonly />
                    </td>
                    <td>지원자명</td>
                    <td colspan="3">
                      <input type="text" name="companyName" id="companyName" value="지원자명" placeholder="지원자명" readonly />
                    </td>
                  </tr>
                  <tr style="background: #fff;">
                    <td>가능한 프로그래밍 언어</td>
                    <td colspan="5">
                      <div class="6u 12u$(small)">
                        <%
                        	StringTokenizer tokens = new StringTokenizer(hire.getHireLang(), ",");
                        		while (tokens.hasMoreTokens()) {
                        			String str = null;
                        			str = tokens.nextToken();
                        %>
                        <input type="checkbox" id="<%=str%>" name="apliResume" value="<%=str%>"> <label for="<%=str%>"><%=str%></label>

                        <%
                        	}
                        %>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>이력서 파일첨부</td>
                    <td colspan="4">
                      <input type="text" name="companyName" id="companyName" value="이력서 파일첨부" placeholder="이력서 파일첨부" readonly />
                    </td>
                    <td>
                      <a href="" class="button special small">지원완료</a>
                    </td>
                  </tr>
                  <%
                  	}
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
          <form name="frmRate" action="/DRUWA/HireControl?cmd=insert-save" method="post">
            <section>
              <h4>회사평가</h4>
              <div class="table-wrapper">

                <table>
                  <thead>
                    <tr>
                      <th>닉네임</th>
                      <th>내용</th>
                      <th>작성시간</th>
                    </tr>
                  </thead>

                  <!-- tfoot: 테이블 몸체 -->
                  <tbody>
                    <tr>
                      <td>제안서남</td>
                      <td>집에 가고 싶다.</td>
                      <td>2015년 15월 99일</td>
                    </tr>
                    <tr>
                      <td>도시남자</td>
                      <td>집에 가고 싶다2.</td>
                      <td>2015년 15월 99일</td>
                    </tr>
                    <tr>
                      <td>잠돌이</td>
                      <td>집에 가고 싶다3.</td>
                      <td>2015년15월99일</td>
                    </tr>
                  </tbody>

                  <!-- tfoot: 테이블 맨 아래 -->
                  <tfoot>
                    <tr>
                      <td>
                        <input type="text" name="" id="" value="" placeholder="닉네임을 입력하세요" />
                      </td>
                      <td>
                        <input type="text" name="" id="" value="" placeholder="회사 소감을 짧게 입력하세요" />
                      </td>
                      <td>
                        <a href="#" class="button small">등록버튼</a>
                      </td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </section>
          </form>
          <!-- end of table -->


          <!-- 면접후기 Table -->
          <form name="frmReview" action="/DRUWA/HireControl?cmd=insert-save" method="post">
            <section>
              <h4>면접후기</h4>
              <div class="table-wrapper">

                <table>
                  <thead>
                    <tr>
                      <th>닉네임</th>
                      <th>내용</th>
                      <th>작성시간</th>
                    </tr>
                  </thead>

                  <!-- tfoot: 테이블 몸체 -->
                  <tbody>
                    <tr>
                      <td>제안서남</td>
                      <td>집에 가고 싶다.</td>
                      <td>2015년 15월 99일</td>
                    </tr>
                    <tr>
                      <td>도시남자</td>
                      <td>집에 가고 싶다2.</td>
                      <td>2015년 15월 99일</td>
                    </tr>
                    <tr>
                      <td>잠돌이</td>
                      <td>집에 가고 싶다3.</td>
                      <td>2015년15월99일</td>
                    </tr>
                  </tbody>

                  <!-- tfoot: 테이블 맨 아래 -->
                  <tfoot>
                    <tr>
                      <td>
                        <input type="text" name="" id="" value="" placeholder="닉네임을 입력하세요" />
                      </td>
                      <td>
                        <input type="text" name="" id="" value="" placeholder="면접 후기를 짧게 등록해주세요" />
                      </td>
                      <td>
                        <a href="#" class="button small">등록버튼</a>
                      </td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </section>
          </form>
          <!-- end of table -->

          <!-- <a href="#" class="button alt small">회사등록</a> -->

        </div>
    </section>

  </div>
</body>
</html>

<!--                   <tr class="trheader"> -->
<!--                     <td>응용소프트웨어</td> -->
<!--                     <td>학사프로그램 프로젝트 관련 프리랜서 채용</td> -->
<!--                     <td>jQuery</td> -->
<!--                     <td>마감날짜</td> -->
<!--                     <td>지원자수</td> -->
<!--                     <td> -->
<!--                       <input type="button" class="button alt small" value="지원하기"> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td>지원자ID</td> -->
<!--                     <td> -->
<!--                       <input type="text" name="companyName" id="companyName" value="지원자ID" placeholder="지원자ID" readonly /> -->
<!--                     </td> -->
<!--                     <td>지원자명</td> -->
<!--                     <td colspan="3"> -->
<!--                       <input type="text" name="companyName" id="companyName" value="지원자명" placeholder="지원자명" readonly /> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td>가능한 프로그래밍 언어</td> -->
<!--                     <td colspan="5"> -->
<!--                       <div class="6u 12u$(small)"> -->
<!--                         <input type="checkbox" id="C++" name="hireLang" value="C++"> <label for="C++">C++</label> -->
<!--                       </div> -->
<!--                     </td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                     <td>이력서 파일첨부</td> -->
<!--                     <td colspan="4"> -->
<!--                       <input type="text" name="companyName" id="companyName" value="이력서 파일첨부" placeholder="이력서 파일첨부" readonly /> -->
<!--                     </td> -->
<!--                     <td> -->
<!--                       <a href="" class="button alt small">진짜 지원!</a> -->
<!--                     </td> -->
<!--                   </tr> -->

