<%@page import="qa.model.Mw"%>
<%@page import="qa.model.Sh"%>
<%@page import="qa.model.Qa"%>
<%@page import="java.util.List"%>
<%@page import="qa.command.MainQaShCommand"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="company.model.Company" %>
<!-- 끌어오기 -->
<%
MainQaShCommand mqsc = new MainQaShCommand();
mqsc.execute(request, response);

List<Qa> qaList = (List)request.getAttribute("qaList");
List<Sh> shList = (List)request.getAttribute("shList"); 
List<Mw> mwList = (List)request.getAttribute("mwList"); 

System.out.println("메인페이지 테스트 : " + qaList.size() + " : " + shList.size() + " : " + mwList.size());

%>
<!DOCTYPE html>
<html>
<head>
<title>메인페이지</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
div{
font-family: 'Hanna', serif;
}
</style>
<script type="text/javascript">
function selectPerson(){
	document.location.replace("index.jsp");
}
</script>
<script type="text/javascript" src="/DRUWA/js/jquery.min.js"></script>

<!-- jQuery library (served from Google) -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- bxSlider Javascript file -->
<script src="/DRUWA/js/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="/DRUWA/css/jquery.bxslider.css" rel="stylesheet" />

<script type="text/javascript">
$(function(){
	$('.bxslider').bxSlider({
		mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
		speed:1000, //default:500 이미지변환 속도
		auto: true, //default:false 자동 시작
		captions: true, // 이미지의 title 속성이 노출된다.
	});	
});
</script>
</head>
<body>
<div id="wrapper">
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
	<div id="page" class="container">
		<div id="content">
			<div class="post" id="hihi">
				<h2><img src="/DRUWA/1_info/img/new.JPG" style="width:70px; height:auto;">&nbsp;IT 최신동향</h2>
				<ul class="bxslider">
				  <li><a href="http://www.ajunews.com/view/20160522175431668">
				  <img src="/DRUWA/1_info/img/newsara.JPG" title="[구글 I/O 2016] '프로젝트 아라' 조립식 스마트폰 내년 출시" style="width:800px; height:400px;" /></a></li>  
				
				  <li><a href="http://www.engadget.com/2016/06/02/fbi-tattoo-tracking-ai/">
				  <img src="/DRUWA/1_info/img/tatooTracking.JPG"  title="FBI is building a tattoo tracking AI to identify criminals"style="width:800px; height:400px;"/></a></li>
				  
				  <li><a href="http://news.naver.com/main/hotissue/read.nhn?mid=hot&sid1=105&cid=1003471&iid=24701818&oid=008&aid=0003681889&ptype=052">
				  <img src="/DRUWA/1_info/img/newsGoogle.JPG" title="구글 'AI 패키지' 나온다… 글로벌 인공지능 '戰雲'" style="width:800px; height:400px;"/></a></li>
				  
				  <li><a href="http://news.naver.com/main/hotissue/read.nhn?mid=hot&sid1=105&cid=993859&iid=1197390&oid=018&aid=0003506148&ptype=052">
				  <img src="/DRUWA/1_info/img/newIt.JPG" title="IT 공룡들이 눈독 들이는 곳…가상현실의 미래는" style="width:800px; height:400px;"/></a></li>
				  
				  <li><a href="http://news.naver.com/main/hotissue/read.nhn?mid=hot&sid1=105&cid=993859&iid=49181528&oid=008&aid=0003680640&ptype=052">
				  <img src="/DRUWA/1_info/img/newAI.JPG" title="해외 로펌, 'AI 변호사' 본격 채용…변호사에게 득?실?" style="width:800px; height:400px;"/></a></li>
				  
				  <li><a href="http://news.naver.com/main/hotissue/read.nhn?mid=hot&sid1=105&cid=993859&iid=49164946&oid=031&aid=0000374079&ptype=052">
				  <img src="/DRUWA/1_info/img/newWeather.JPG" title="IBM '왓슨' 날씨 예측 어디까지?" style="width:800px; height:400px;"/></a></li>
				  
				  <li><a href="http://news.naver.com/main/hotissue/read.nhn?mid=hot&sid1=105&cid=993859&iid=49136827&oid=001&aid=0008277988&ptype=052">
				  <img src="/DRUWA/1_info/img/newsGonmo.JPG" title="미래부 '사물인터넷 전문기업 육성사업' 공모" style="width:800px; height:400px;"/></a></li>				  
				</ul>
				<br/>
                <h3 style="font-size:30px;"><img src="/DRUWA/1_info/img/hot.JPG" style="width:50px; height:auto;">&nbsp;&nbsp;핫 키워드</h3>
                <div style="font-size:20px; margin-left:20px;">
	                <ul class="actions">
	                	<li><a href="http://techholic.co.kr/archives/53303">아이디만 넣으면 해킹 유출 여부를...</a></li>
	                	<li><a href="http://news.naver.com/main/hotissue/read.nhn?mid=hot&sid1=105&cid=1003471&iid=943792&oid=092&aid=0002094871&ptype=052">MS, 자바로 iOS앱 개발하는 ‘로보VM’ 폐기</a></li>
	                	<li><a href="http://news.naver.com/main/hotissue/read.nhn?mid=hot&sid1=105&cid=1003471&iid=49141606&oid=079&aid=0002814431&ptype=052">야후가 팔린다…마이크로소프트도 인수 나서</a></li>
	                	<li><a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=105&oid=092&aid=0002097651">침체 늪 빠진 태블릿…“하이브리드가 구세주”</a></li>
	                </ul>
      			  </div>
			</div>
			<div class="post">
           
	            <h2><img src="/DRUWA/1_info/img/like.JPG" style="width:50px; height:auto;">&nbsp;Best Shouting</h2>
	            <br/>
	            	<table>
	            		<tr style="font-size:30px;">
	            			<th>닉네임</th>
	            			<th>내용</th>
	            			<th>시간</th>
	            			<th>추천수</th>
	            		</tr>
	                       <%for(int i=0;i<shList.size();i++){ %>
	                      <tr>
	                        <td><%=shList.get(i).getNick() %></td>
	                        <td><%=shList.get(i).getShContent() %></td>
	                        <td><%=shList.get(i).getShTime() %></td>
	                        <td><%=shList.get(i).getShRate() %></td>
	                      </tr>
	                      <%} %>
	                 </table>
	                 <br/>
	                 <h2><img src="/DRUWA/1_info/img/qa2.JPG" style="width:80px; height:auto;">&nbsp;실시간 질문</h2>
	                 <br/>
	                 <table>
	                	 <tr style="font-size:30px;">
	                	 	<th>글번호</th>
	                	 	<th>글종류</th>
	                		<th>제목</th>
	                		<th>아이디</th>
	            			<th>내용</th>
	            			<th>시간</th>
	            		</tr>
	                      <%for(int i=0;i<qaList.size();i++){ %>
	                      <tr>
	                      	<td><%=qaList.get(i).getQaNum() %></td>
	                      	<td><%=qaList.get(i).getQaType() %></td>
	                        <td><%=qaList.get(i).getId() %></td>
	                        <td><%=qaList.get(i).getQaSubject() %></td>
	                        <td><%=qaList.get(i).getQaCount() %></td>
	                        <td><%=qaList.get(i).getQaTime() %></td>
	                      </tr>
	                      <%} %>
	                                        
	                </table>
			</div>
		</div>
		<div id="sidebar1">
			<h2> 용어검색</h2>
			<ul class="actions" style="margin-left:-10px;">
				<li><input name="search" type="text" style="width:150px;"/></li>
				<li><input name="search" type="button" value="검색" style="width:100px;"/></li>		
			</ul>
			<div>	
				<ul class="style2">
				<%Object obj=session.getAttribute("companylogin"); 
				if(obj==null){%>
				<li>
					<h2>로그인</h2>
					<center>
						<div class="row uniform 50%" style="margin-left:100px;">
					  		<div class="4u 12u$(xsmall)">
								<input type="radio" id="priority-low" name="priority" onclick="selectPerson()">
								<label for="priority-low">개인</label>
							</div>
							<div class="4u 12u$(xsmall)">
								<input type="radio" id="priority-normal" name="priority" checked>
								<label for="priority-normal">기업</label>
							</div>
						</div>
					</center>
					<br/>
					  <form id="frm" method="post" action='/DRUWA/CompanyControl?cmd=login-page'>
                        <table style="width:100px;">
                              <tr>
                                <th scope="row">ID</th>
                                <td><input name="companyId" type="text" style="width:100px"/></td>
                                <td rowspan="2"><input type="submit" name="login" value="로그인" style="margin-top:10px; width:100px; height:100px;"/></td>
                              </tr>
                              <tr>
                                <th scope="row">PASS</th>
                                <td><input name="companyPw" type="password" style="width:100px" /></td>
                              </tr>
                          </table>
                      </form>
                      <div id="regMember" style="text-align:center;">
                      	<h3><a href="/DRUWA/MemberControl?cmd=enroll-page">회원가입</a></h3>
                      </div>
					</li>
				<%}else{
					Company dao=(Company)obj;
				%>
					<li>
						<center><h3><%=dao.getCompanyName()%> 회사로 로그인합니다.<br/><br/>환영합니다.</h3><br/><a href="/DRUWA/logout.jsp">로그아웃</a></center><br/>
						<div style="width:300px; height:100px;">
							<button type="button" id="myselect" style="height:100px; width:250px; background:#FFF;" onclick="moveCompany()"><img src="/DRUWA/0_member/img/gongo.JPG">&nbsp; 회사 공고</button>
						</div>
						<script>
							function moveCompany(){
								document.location.replace("/DRUWA/ff.tj?cmd=company-list-page&companyId=<%=dao.getCompanyId()%>");
							}			
						</script>
					</li>
				<%} %>
					<li>
						<h3><a href="#">3일이내 채용공고</a></h3>
						<textarea name="gongo" cols="35" rows="35" readonly="readonly"></textarea>
					</li>
				</ul>
			</div>
	</div>
</div>
<div id="footer">
	<p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. Photos by <a href="http://fotogrph.com/">Fotogrph</a>.</p>
</div>
</body>
</html>