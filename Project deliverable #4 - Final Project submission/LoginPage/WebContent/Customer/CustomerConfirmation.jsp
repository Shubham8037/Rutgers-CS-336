<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Confirmation</title>
</head>
<body>
<%@ page import ="java.sql.*" %>

 	Thank you for booking your flight!
 	<p style="float: left;"><a href="CustomerReservations.jsp">View All Reservations</a></p>
    <p style="float: right;"><a href="CustLogout.jsp">Log out</a></p>
 	
<% 	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
   
    String buttonClicked = request.getParameter("button_clicked");
    
    String userid = (String) session.getAttribute("user");
	String airlineid = request.getParameter("airline_id");
   	String aircraftid = request.getParameter("aircraft_id");
   	
   	String dair = request.getParameter("dep_air");
	String ddate = request.getParameter("dep_date");
	String dtime = request.getParameter("dep_time");
	String aair = request.getParameter("arr_air");
   	
 	int econPrice = Integer.parseInt(request.getParameter("eprice"));
	int busPrice = Integer.parseInt(request.getParameter("bprice"));
	int firstPrice = Integer.parseInt(request.getParameter("fprice"));
	
	if("Book for Economy Class".equals(buttonClicked)){
		 ResultSet rs1 = stmt.executeQuery("select current_timestamp");
		// ResultSet rs2 = stmt.executeQuery("select extract(month from current_timestamp )");
		 
		 rs1.next();
		 String curr = rs1.getString("current_timestamp");
		 String cl = "Economy Class";
		 String tfare = Integer.toString (econPrice + 150);
		 
		 int x = stmt.executeUpdate("insert into tickets (username, airline_id, aircraft_id, d_airport, d_date, d_time, a_airport, purchaseDT, class, fare) value ('" +userid +
				 "','" +airlineid+ "' ,'" +aircraftid+ "' ,'" +dair+ "','" +ddate+ "','" +dtime+ "','" +aair+ "', '" +curr+ "', '"+cl+"', '" +tfare+ "')");
	}
	else if("Book for Business Class".equals(buttonClicked)){
		 ResultSet rs1 = stmt.executeQuery("select current_timestamp");
		 rs1.next();
		 String curr = rs1.getString("current_timestamp");
		 String cl = "Business Class";
		 String tfare = Integer.toString (busPrice + 150);
		 
		 int x = stmt.executeUpdate("insert into tickets (username, airline_id, aircraft_id, d_airport, d_date, d_time, a_airport, purchaseDT, class, fare) value ('" +userid +
				 "','" +airlineid+ "' ,'" +aircraftid+ "' ,'" +dair+ "','" +ddate+ "','" +dtime+ "','" +aair+ "', '" +curr+ "', '"+cl+"', '" +tfare+ "')");
	}
	else if("Book for First Class".equals(buttonClicked)){
		 ResultSet rs1 = stmt.executeQuery("select current_timestamp");
		 rs1.next();
		 String curr = rs1.getString("current_timestamp");
		 String cl = "First Class";
		 String tfare = Integer.toString (firstPrice + 150);
		 
		 int x = stmt.executeUpdate("insert into tickets (username, airline_id, aircraft_id, d_airport, d_date, d_time, a_airport, purchaseDT, class, fare) value ('" +userid +
				 "','" +airlineid+ "' ,'" +aircraftid+ "' ,'" +dair+ "','" +ddate+ "','" +dtime+ "','" +aair+ "', '" +curr+ "', '"+cl+"', '" +tfare+ "')");
		
	}
	
%>
	


</body>
</html>