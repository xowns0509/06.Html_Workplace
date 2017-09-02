<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>기업회원가입</title>
<link rel="stylesheet" href="/DRUWA/css/style.css">
<link href="/DRUWA/css/header.css" rel="stylesheet" type="text/css"/>
<link href="/DRUWA/css/sidemenu.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
body{
	text-align:center;
}
form{line-height:25px; font-size:20px;}
h1{font-size: 80px;}
h3{ font-size: 25px; }
h5{ color: red; font-size: 15px;}
</style>
<script type="text/javascript">
function moveEnroll(){
	document.location.replace("/DRUWA/MemberControl?cmd=enroll-page");
}
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#id_check').click(function(){
		$.ajax({
			url:'/DRUWA/0_member/CompanyIdCheck.jsp',
			type: 'GET',
			data: ({companyId: $("#companyId").val()}),
			dataType: 'text',
			success: function(data){
				//처리 콜백 함수: beforeSend, complete, error, success
				if(jQuery.trim(data)=='YES'){
					$('#idmessage').text('이미 사용중인 아이디 입니다.');
					$('#idmessage').show();
				}else{
					$('#idmessage').text('사용가능한 아이디 입니다.');
					$('#idmessage').show();

				}
			}
		});
	});
});

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
			<li><a href="/DRUWA/4_shouting/shoutingmain.jsp">shouting</a></li>
		</ul>
		</div>
	</div>
	<br/><br/>
	<br/><br/>
	
	<!-- 회원 가입 폼 -->
	<div id="enroll">
		<div id="enroll_head">
			<h1> << 기 업 회 원 가 입 >> </h1>	
		</div>
		<br/><br/>
		<br/><br/>
		<div>
			<h3>신  &nbsp;&nbsp; 분 &nbsp;&nbsp;
		  	<label><input type="radio" name="radioSelect" id="personal" onclick="moveEnroll()"/>개인</label>&nbsp;&nbsp;
		    <label><input type="radio" name="radioSelect"id="enterprise" checked="checked" />기업</label><br />
		    </h3>
		
		</div>

		<div id="enroll_center">
			<form id="form" name="form" method="post" action="/DRUWA/CompanyControl?cmd=enroll-confirm" enctype="multipart/form-data">
			<h5>*** 하나도 빠짐없이 기입해주십시오. ***</h5>
			
			기업명&nbsp;<input id="companyName" name='companyName' type='text' size="30" required> &nbsp;&nbsp;&nbsp;&nbsp; 대표자명&nbsp;<input id="mgr" name='mgr' type='text' size="30" required><br /><br />
			업 종&nbsp;
				<select id="companyJob" name="companyJob" required>
					<option value="웹프로그래머">웹프로그래머</option>
				    <option value="웹디자인">웹디자인</option>
				    <option value="응용프로그래머">응용프로그래머</option>
				    <option value="시스템프로그래머">시스템프로그래머</option>
				    <option value="ERP,시스템분석설계">ERP,시스템분석설계</option>
				    <option value="통신,모바일">통신,모바일</option>
				    <option value="H/W,S/W">H/W,S/W</option>
				    <option value="게임">게임</option>
				    <option value="서버,네트워크,보안">서버,네트워크,보안</option>
				</select>
			<br /><br />
			
			사  업  내  용 <input id="companySales" name='companySales' type='text' size="80" required><br /><br /> 
			기  업  형  태 <input id="companyType" name='companyType' type='text' size="80" required><br /><br />
			설    립    일 <input id="setupDate" name='setupDate' type='text' size="25">달력  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 매  출  액 <input id="totalSel" name='totalSel' type='text' size="30" required><br /><br />
			사    원    수<input id="totalMan" name='totalMan' type='text' size="30" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 자  본  금 <input id="money" name='money' type='text' size="30" required><br /><br />
			대표전화번호 <input id="companyTel" name='companyTel' type='tel' size="30" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; F A X <input id="fax" name='fax' type='tel' size="30" required><br /><br />
			사  업  주  소 <input id='addr' name='addr' type='text' size="85" required><br /> 
			<br /><br />
			<div style="margin-right:500px">기업정보</div>
			<textarea name="companyDetail" cols="100" rows="8"></textarea><br/>
			
			<div style="margin-right:500px">우리 회사는 이런사람을 원해요</div>
			<textarea name="companyIntro" cols="100" rows="8"></textarea><br/>
			회사브로셔<strong>(pdf파일)</strong>
			
			<input id="companyResume" name='companyResume' type='file' size="50" required>
			
			<br /> 
			
			<br/><br/>
			<div style="margin-left:850px">
				<div style="text-align: left; width: 520px;">
					<h5>*** 기업 로그인시 필요한 기본정보를 입력하세요 ***</h5>
					아  이  디 <input id='companyId' name='companyId' type='text' required>&nbsp;<input type='button' id='id_check' value='중복확인'/>
					<div id="idmessage" style="display:none; float:right;"></div><br/><br/>
					비밀번호 <input id="companyPw" name='companyPw' type='password' required><br /><br />
					비밀번호확인 <input name='companyPwConfirm' type='companyPwConfirm' required><br /><br /> 
				</div>
			</div>
			<input type='submit' value='가입하기'>
			<input type="button" id="cancle" value="취소하기">
			</form>
		</div>
		
		<br/><br/><br/>
		<br/><br/><br/>

	</div>


</body>
</html>