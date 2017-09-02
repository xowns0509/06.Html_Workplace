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
		String flag = (String) request.getAttribute("flag");
	%>

	<script type="text/javascript">
	  var flag='<%=flag%>';
	  if (flag == "notlogin") {
          alert("로그인 해 주세요");
         location.href = "qa.do?cmd=shlist";
      }

      if (flag == "alreadyup") {
         alert("이미 추천 하셨습니다.");
         location.href = "qa.do?cmd=shlist";
      }
	</script>
<h1>
이화면 뜨면 안됩니다.
</h1>
</body>
</html>