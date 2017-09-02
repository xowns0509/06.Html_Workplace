<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="learn.model.Learn" %>
<%@ page import="java.util.List" %>

<% List<Learn> learnList=(ArrayList)request.getAttribute("learnList"); %>

<!DOCTYPE html>
<html>
<head>
<title>job 모두의 이론</title>
<link href="/DRUWA/css/TableButtonStyle.css" rel="stylesheet" type="text/css" media="all" />
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#content_wrap{
	margin-top:-250px;
	margin-left:350px;
}
#infoSearch{
	margin-left:300px;
}
#infoTable{
	margin-left:290px;
}
</style>
<script type="text/javascript">
	function selectCombo(){
		var sel=document.getElementById("leType").value;
		document.getElementById('infoSelect').innerHTML=sel;
	}

</script>
</head>
<body>
	<!-- 상단 메뉴바 -->
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1>
					<a href="/DRUWA/index.jsp">아이티드루와</a>
				</h1>
				<p>
					Design by <a href="http://templated.co" rel="nofollow">yuk jo</a>
				</p>
			</div>
		</div>
		<nav id="menu" class="container">
		<ul>
			<li class="current_page_item"><a href="/DRUWA/LearnControl?cmd=learnlist">Info</a></li>
			<li><a href="/DRUWA/ff.tj?cmd=job-main-page">Job</a></li>
			<li><a href="/DRUWA/qa.do?cmd=qalist">Q&A</a></li>
			<li><a href="/DRUWA/qa.do?cmd=shlist">shouting</a></li>
		</ul>
		</nav>
		
	</div>

	<div id="wrap" class="container">
        <nav id="main_lnb">
            <ul>
               <li class="/DRUWA/1_info/current_page_item"><a href="/DRUWA/LearnControl?cmd=learnlist">모두의이론</a></li>
				<li><a href="/DRUWA/AlgoControl?cmd=algo-page">알고리즘</a></li>
				<li><a href="/DRUWA/1_info/3_dictionary.jsp">IT백과사전</a></li>
				<li><a href="/DRUWA/1_info/4_community.jsp">소모임</a></li>
            </ul>
        </nav>
    </div>
    
    
   <div id="content_wrap">
            <div id="content">
            	<div></div>
                <div id="infoSearch">
                	<div id="infoSelect" style="font-size:30px;">전체보기</div><br/><br/>
                	<div>
                	<ul class="actions small">
                	<li>글 종류를 선택하세요</li>
                	<li>
                		<select id="leType" name="leType" onchange="selectCombo()" style="width:200px;">
                		<option value="전체보기" selected>전체보기</option>
						<option value="기술면접대비하기">기술면접대비하기</option>
						<option value="ABOUT JAVA">ABOUT JAVA</option>
						<option value="ABOUT C">ABOUT C</option>
						<option value="ABOUT DATABASE">ABOUT DATABASE</option>
						</select>
					</li>
					</ul>
					</div> 
					
					<div style="margin-left:400px; margin-top:-80px;">
					<ul class="actions">
						<li>
							<select name="category" id="category">
								<option value="제목">제목</option>
								<option value="글쓴이">글쓴이</option>
							</select>
						</li>
						<li><input name="searchInput" type="text"></li>
						<li><input name="searchButton" type="button" value="검색"></li>
					</ul>
					</div>
                </div>

                <div id="infoTable" style="width:900px;">
                	<table>
					<tr>
						<td width="100px">글번호</td>
						<td width="150px">글 종류</td>
						<td width="300px">제 목</td>
						<td width="100px">작성자</td>
						<td width="150px">작성일자</td>
						<td width="100px">조회수</td>
					</tr>
					<%for(int i=0;i<learnList.size();i++){ %>
					<tr>
						<td><%=learnList.get(i).getLeNum() %></td>
						<td><%=learnList.get(i).getLeType() %></td>
						<td><a href="/DRUWA/LearnControl?cmd=view-page&leNum=<%=learnList.get(i).getLeNum()%>"><%=learnList.get(i).getLeTitle()%></td>
						<td><%=learnList.get(i).getId()%></td>
						<td><%=learnList.get(i).getLeTime() %></td>
						<td><%=learnList.get(i).getLeCount() %></td>
					</tr>
					<%} %>
					</table>
					<br/>
					<br/>

					<a href="/DRUWA/LearnControl?cmd=learn-page">글쓰기</a>

					<br/>
					<br/>
                </div>        
            </div>
        </div>
</body>
</html>
