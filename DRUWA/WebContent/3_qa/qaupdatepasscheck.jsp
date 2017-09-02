<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="qa.model.Qa"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

	<%
		String qaNum = (String) request.getAttribute("qaNum");
		String flag = (String) request.getAttribute("flag");
	%>

	<script type="text/javascript">
  
	  var flag='<%=flag%>';
	  
			if (flag == "success") {
// 				alert("비밀번호 맞음 수정페이지로 이동");
				location.href = "qa.do?cmd=update&qanum=" + "<%=qaNum%>";
			}

			if (flag == "fail") {
				alert("비밀번호 틀림");
				location.href = "qa.do?cmd=detail&qanum=" + "<%=qaNum%>";
			}

		 
	</script>


<h1>
업데이트 체크
</h1>


</body>
</html>