<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    rs1 = stmt.executeQuery("select * from customerrep where repuser='" + userid + "'");
    if (rs1.next()){
    	 ResultSet rs2;
    	    rs2 = stmt.executeQuery("select * from customerrep where repuser='" + userid + "' and reppass='" + pass + "'");
    	    if (rs2.next()) {
    	    	session.setAttribute("user", userid); // the username will be stored in the session
    	        response.sendRedirect("CustRepSuccess.jsp");
    	    } else {
    	        out.println("Invalid password <a href='CustomerRepLogin.jsp'>try again</a>");
    	    }
    }
    else{
    	out.println("Username doesn't exist <a href= 'NewCustRepAcc.jsp'>Create An Account</a>");
    }
%>

</body>
</html>