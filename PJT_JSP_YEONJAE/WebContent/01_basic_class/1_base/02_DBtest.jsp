<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ page errorPage = "02_NormalErrorPage.jsp" %>

<%	
	//1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//2. 연결객체 얻어오기
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1522:orcl", "scott", "tiger");
	
	//3. sql 문장 만들기
	String sql = "SELECT * FROM emp2";
	
	//4. sql 전송객체 얻어오기
	Statement stmt = con.createStatement();
	
	//5. sql 전송하기
	ResultSet rs = stmt.executeQuery(sql);	
%>


<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border=2 cellSpacing=3>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>

	<% while(rs.next()){ %>
	  <tr>
		<td><%= rs.getString("empno") %></td>
		<td><%= rs.getString("ename") %></td>
		<td><%= rs.getString("job") %></td>
		<td><%= rs.getString("mgr") %></td>
		<td><%= rs.getString("hiredate") %></td></tr>
	<% } //class of while %>

</table>
</div>
</body>
</html>
