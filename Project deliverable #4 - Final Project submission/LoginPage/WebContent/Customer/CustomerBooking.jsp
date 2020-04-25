<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Booking</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
	If flight is full, click on the waitlist button to be added to the waiting queue.
	<br>
<%
    String dep_air = request.getParameter("dep-air") + "";   
	String dep_date = request.getParameter("departing-date") + "";   
	
    String arr_air = request.getParameter("arr-air") + "";
    String arr_date = request.getParameter("returning-date") + "";   
    
    String triptype = request.getParameter("triptype") + "";   
    String sort = request.getParameter("button1") + ""; 
    
    String filter1 = request.getParameter("price") + "";   
    String filter2 = request.getParameter("stops") + "";
    String filter3 = request.getParameter("airline") + "";
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    String sql= "";

    

    rs1 = stmt.executeQuery("select * from flights where dep_airport= '" 
    + dep_air + "' and dep_date= '" + dep_date + "' and arr_airport= '" 
   	+ arr_air + "' and arr_date= '" +arr_date+"' and type= '" +triptype+"'  ");
 
    	
  
    
    /*if(!dep_air.equals(null)){
    	sql += "select * from flights where dep_airport= '" + dep_air + "'";
    }
    if(!dep_date.equals(null)){
    	sql += "select * from flights where dep_date= '" + dep_date + "'";
    }
    if(!arr_air.equals(null)){
    	sql += "select * from flights where arr_airport= '" + arr_air + "'";
    }
    if(!arr_date.equals(null)){
    	sql += "select * from flights where arr_date= '" + arr_date + "'";
    }
   
    rs1 = stmt.executeQuery(sql);*/
   
    
    
    
    while(rs1.next()){
 		String airlineid = rs1.getString(1);
    	String aircraftid = rs1.getString(2);
    	
    	String dair = rs1.getString(3);
    	String ddate = rs1.getString(4);
    	String dtime = rs1.getString(5);
    	String aair = rs1.getString(6);
    	
    	String econPrice = rs1.getString(11);
    	String busPrice = rs1.getString(12);
    	String firstPrice = rs1.getString(13);
    	String availability = rs1.getString(14);
    	
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
    	<form action="CustomerConfirmation.jsp">
	    	<input type="submit" name="button_clicked" value="Book for Economy Class">
	    	<input type="submit" name="button_clicked" value="Book for Business Class">
	    	<input type="submit" name="button_clicked" value="Book for First Class">
	    	<input type="hidden" name=airline_id value="<%=airlineid%>">
	    	<input type="hidden" name=aircraft_id value="<%=aircraftid%>">
	    	<input type="hidden" name=dep_air value="<%=dair%>">
	    	<input type="hidden" name=dep_date value="<%=ddate%>">
	    	<input type="hidden" name=dep_time value="<%=dtime%>">
	    	<input type="hidden" name=arr_air value="<%=aair%>">
	    	<input type="hidden" name=eprice value="<%=econPrice%>">
	    	<input type="hidden" name=bprice value="<%=busPrice%>">
	    	<input type="hidden" name=fprice value="<%=firstPrice%>">
	    	<input type="hidden" name=avail value="<%=availability%>">
    	</form>
    	
    	<form action="CustWaitingList.jsp">
	    	<input type="submit" name="button_clicked" value="Waiting Queue">
	    	<input type="hidden" name=airline_id value="<%=airlineid%>">
	    	<input type="hidden" name=aircraft_id value="<%=aircraftid%>">
	    	<input type="hidden" name=dep_date value="<%=ddate%>">
    	</form>
    	
    	
    	<%} %>
 

</body>
</html>