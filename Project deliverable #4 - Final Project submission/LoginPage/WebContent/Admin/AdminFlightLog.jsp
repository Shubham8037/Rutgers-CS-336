<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Flight Log</title>
</head>
<body>
<%@ page import ="java.sql.*" %> 
<p style="float: right;"><a href="AdminLogout.jsp">Log out</a></p>

<% 
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	ResultSet rs1;

	String airportid = request.getParameter("airport_id") + "";
		
	rs1 = stmt.executeQuery("select * from flights where dep_airport= '"+airportid+"' or arr_airport= '"+airportid+"' "); 
	
	 
	  while(rs1.next()){
	    	out.println(rs1.getString(1) + rs1.getString(2));
	    	out.println(rs1.getString(3));
	    	out.println(rs1.getString(4));
	    	out.println(rs1.getString(5));
	    	out.println(rs1.getString(6));
	    	out.println(rs1.getString(7));
	    	out.println(rs1.getString(8));
	    	out.println(rs1.getString(9));
	    	out.println(rs1.getString(10));
	    	out.println(rs1.getString(11));
	    	out.println(rs1.getString(12));
	    	out.println(rs1.getString(13));
	    	out.println(rs1.getString(14));
	   %>
	   <br>
	   <%} %>
	    	

</body>
</html>