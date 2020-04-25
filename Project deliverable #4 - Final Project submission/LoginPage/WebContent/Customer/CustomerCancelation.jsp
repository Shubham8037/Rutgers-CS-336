<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Cancelation </title>
</head>
<body>
<%@ page import ="java.sql.*" %>

	<p style="float: left;"><a href="CustomerReservations.jsp">View All Reservations</a></p>
    <p style="float: right;"><a href="CustLogout.jsp">Log out</a></p>

<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
   
    
    String userid = (String) session.getAttribute("user");
    String clss = request.getParameter("class");
    String airlineid = request.getParameter("airline_id");
   	String aircraftid = request.getParameter("aircraft_id");
	String ddate = request.getParameter("dep_date"); 
    
    
    
    if("Business Class".equals(clss) || "First Class".equals(clss)){
    	int x = stmt.executeUpdate("delete from tickets where username= '"+userid+"' and airline_id= '"
    		+airlineid+ "'and aircraft_id= '"+aircraftid+ "' and d_date= '" + ddate + "'  "); 
    			  
    }
    else{
    	out.println("You can't cancel this flight since it is not booked with Business or First Class.");
    }
    
   
 
 
 
 %>

</body>
</html>