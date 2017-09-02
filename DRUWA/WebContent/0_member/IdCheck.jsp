<%@ page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
	String driver="oracle.jdbc.driver.OracleDriver";
	String user="DRUWA";
	String pass="1234";
	String dbURL="jdbc:oracle:thin:@192.168.0.106:1521:orcl";


	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql="select company_id from company where company_id='"+ request.getParameter("id")+"' UNION select id from member where id='"+ request.getParameter("id")+"'";

	System.out.println(sql);
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(sql);		

	
	//지금은 간단하게 문자열로 받지만 나중에 xml이나 json으로 받음
	String result="NO";
	if (rs.next()){		
		result = "YES";
	}		
	out.print(result);
%>

