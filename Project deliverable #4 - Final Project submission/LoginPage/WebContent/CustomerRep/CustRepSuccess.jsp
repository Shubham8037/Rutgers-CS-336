<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="CustomerRepLogin.jsp">Please Login</a>
<%} else {
%>
 Welcome <%=session.getAttribute("user") %> 
<p style="float: right;"><a href="CustomerRepLogout.jsp">Log out</a></p>
	<br>
<form action="CustRepWaitingList.jsp" method="POST">
	Retrieve Passenger Waiting List:
	<input type="text" name="airline_id" placeholder="Enter Airline"> 
	<input type="text" name="aircraft_id" placeholder="Enter Aircraft"> 
	<input type="date" name="dep_date" placeholder="Departing Date"> 
	
	<form action="CustRepWaitingList.jsp">
		<input type="submit" value="Retrieve">
	</form>	
	

	
</form>

<%
    }
%>
</body>
</html>