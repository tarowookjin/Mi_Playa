<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ page import = "java.sql.*" %>
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "miplayaDb";
String userId = "root";
String password = "root";

try{
	Class.forName(driverName);
}catch(ClassNotFoundException e)
{
	
}

Connection con = null;
Statement stment = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

</html>
<%

	boolean goodConnection = false;
	boolean goodUser = false;
	boolean goodPass = false;
	String username = request.getParameter("uname");
	String userpassword = request.getParameter("psw");
	if(username != null)
	{
		try {
			con = DriverManager.getConnection(
			connectionUrl + dbName, userId, password);
			stment = con.createStatement();
			String sql = "SELECT * FROM employees WHERE username =\'"+username+"\'";

			resultSet = stment.executeQuery(sql);
			while (resultSet.next()) {
			}
		}
			catch(Exception e) {
				e.printStackTrace();
				}
			
	}
	else
	{
		request.setAttribute("loginStatus","badLogin"); 
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "login.jsp?loginStatus=badLogin"); 
	}

%>