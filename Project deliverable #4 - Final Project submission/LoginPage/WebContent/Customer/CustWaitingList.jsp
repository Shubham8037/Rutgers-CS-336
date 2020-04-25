<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Waiting List</title>
</head>
<body>
<%@ page import ="java.sql.*" %> 
 We are sorry <%=request.getParameter("airline_id")+request.getParameter("aircraft_id")%> is currently full.
 You have been added to a waiting list for this flight and will be notified as soon a seat is available.
 
 <p style="float: right;"><a href="CustomerReservations.jsp">View All Reservations</a></p>
 <br>
 <p style="float: right;"><a href="CustLogout.jsp">Log out</a></p>
 
<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();

	String userid = (String) session.getAttribute("user");
	String airlineid = request.getParameter("airline_id");
	String aircraftid = request.getParameter("aircraft_id");
	String ddate = request.getParameter("dep_date"); 
	
	 int x = stmt.executeUpdate("insert into waitinglist (username, airline_id, aircraft_id, dep_date) value ('" +userid +
			 "','" +airlineid+ "' ,'" +aircraftid+ "' ,'" +ddate+ "')");

%>









</body>
</html>