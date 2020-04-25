<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Landing Page</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="CustomerLogin.jsp">Please Login</a>
<%} else {
%>
 Welcome <%=session.getAttribute("user") %> 
 	<p style="float: right;"><a href="CustomerReservations.jsp">View All Reservations</a></p>
 	<br>
    <p style="float: right;"><a href="CustLogout.jsp">Log out</a></p>

<form action="CustomerBooking.jsp" method="POST">
	<input type="text" name="triptype" placeholder="Trip Type"> 
	<br>
	Sort By:
	<input type="radio" name="button1" value="econ_rate" > Economy Price
	<input type="radio" name="button1" value="bus_rate" > Business Class Price
	<input type="radio" name="button1" value="first_rate" > First Class Price
    <input type="radio" name="button1" value="dep_time" > Departure Time
    <input type="radio" name="button1" value="arr_time"> Arrival Time
	<br>
	
	Filter By:
	<input type="text" name="price" placeholder="Price"> 
	<input type="date" name="stops" placeholder="Number of Stops"> 
	<input type="date" name="airline" placeholder="Airline"> 
	<br>
	
	<input type="text" name="dep-air" placeholder="Departure Airport"> 
	<input type="date" name="departing-date" placeholder="Departing Date"> 
	

	<br>
 	<input type="text" name="arr-air" placeholder="Arrival Airport" > 
	<input type="date" name="returning-date" placeholder="Returning Date"> 
	<br>
	
	<form action="CustomerBooking.jsp">
		<input type="submit" value="Search">
	</form>	
	
	<br>
	
	</form>
<%
    }
%>
</body>
</html>