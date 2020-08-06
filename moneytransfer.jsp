<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*" %>
<%
String account_holder=request.getParameter("account_holder");
String account_number=request.getParameter("account_number");
String amount_transfer=request.getParameter("amount_transfer");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
Statement st=conn.createStatement();
st.executeUpdate("insert into accounts(account_holder,account_number,amount_transfer)values('"+account_holder+"','"+account_number+"','"+amount_transfer+"')");
response.sendRedirect("success.html");
}
catch(Exception e)
{
response.sendRedirect("error.html");
System.out.print(e);
e.printStackTrace();
}
%>
System.out.print(e);
e.printStackTrace();
}
%>