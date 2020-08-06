<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "bank";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
	<BODY bgcolor="#FFFFF">
		<CENTER>
			<h>TOTAL BALANCE=  10000</h>
			<br>
			<br>
			<table border="5"style="background-color: #FFFFF;" WIDTH="50%">
			<tr>
				<td>account holder name</td>
				<td>account number</td>
				<td>available balance</td>
			</tr>
			<%
			try{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				String sql ="select * from accounts";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){
					%>
					<tr>
					<td><%=resultSet.getString("account_holder") %></td>
					<td><%=resultSet.getString("account_number") %></td>
					<td><%=resultSet.getString("amount_transfer") %></td>
					</tr>
					<%
				}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</table>
		</CENTER>
	</body>
</html>
