<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<html>
<head>
<title>알고리즘</title>

<link rel="stylesheet" href="/DRUWA/css/style.css">
<link rel="stylesheet" href="css/coverflow.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
div{
font-family: 'Hanna', serif;
}
li { list-style: none; }
a { text-decoration: none; }
body { min-width: 760px; }

#wrap { overflow: hidden;}
#wrap > #main_lnb {
	margin-top: 50px; 
    float: left;
    width: 200px;
}

#main_lnb > ul > li > a {
    display: block;
    font-size: 18px;
    height:60px; 
    line-height: 40px;
    padding-left: 15px;
    border-bottom: 3px solid #483D8B;
    color: 	#696969;
}

</style>
<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
<!-- Modernizr -->
<script src="js/libs/modernizr.js"></script>
<script type="text/javascript">
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
		<div id="menu" class="container">
		<ul>
			<li class="current_page_item"><a href="/DRUWA/LearnControl?cmd=learnlist">Info</a></li>
			<li><a href="/DRUWA/ff.tj?cmd=job-main-page">Job</a></li>
			<li><a href="/DRUWA/qa.do?cmd=qalist">Q&A</a></li>
			<li><a href="/DRUWA/qa.do?cmd=shlist">shouting</a></li>
		</ul>
		</div>
	</div>

	<!-- 옆에 존재하는 사이드 메뉴바 -->
	<div id="wrap" class="container">
        <nav id="main_lnb">
            <ul>
            	<li><a href="/DRUWA/LearnControl?cmd=learnlist">모두의이론</a></li>
				<li class="/DRUWA/1_info/current_page_item"><a href="/DRUWA/AlgoControl?cmd=algo-page">알고리즘</a></li>
				<li><a href="/DRUWA/1_info/3_dictionary.jsp">IT백과사전</a></li>
				<li><a href="/DRUWA/1_info/4_community.jsp">소모임</a></li>
            </ul>
        </nav>
    </div>

	<div id="coverflow">
		<section onclick="select1()" data-cover="/DRUWA/1_info/img/1.jpg"></section>
		<section onclick="select2()" data-cover="/DRUWA/1_info/img/2.jpg"></section>
		<section onclick="select3()" data-cover="/DRUWA/1_info/img/3.jpg"></section>
		<section onclick="select4()" data-cover="/DRUWA/1_info/img/4.jpg"></section>
		<section onclick="select6()" data-cover="/DRUWA/1_info/img/6.jpg"></section>
		<section onclick="select5()" data-cover="/DRUWA/1_info/img/5.jpg"></section>
		<section onclick="select7()" data-cover="/DRUWA/1_info/img/7.jpg"></section>
		<section onclick="select7()" data-cover="/DRUWA/1_info/img/8.jpg"></section>
	</div>

	<nav id="controls">
		<a id="prev">Left</a> & <a id="next">Right</a>
	</nav>

	<!-- Javascript  -->
	<script src="js/coverflow.js"></script>
	<script src="/DRUWA/js/index.js"></script>
</body>
</html>
