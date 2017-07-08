<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

</html>
<%
	String password = request.getParameter("psw");
	if(password != null && password.equals("123"))
	{
		out.print("good");
	}
	else
	{
		request.setAttribute("loginStatus","badLogin"); 
		response.setStatus(response.SC_MOVED_TEMPORARILY);
		response.setHeader("Location", "login.jsp?loginStatus=badLogin"); 
	}

%>