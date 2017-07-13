<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eldojo.entities.*" %> 
<!DOCTYPE html>
<html>
<head>
<%
Integer paso = 2;
request.setAttribute("paso",paso);
Client cliente = (Client) request.getAttribute("cliente");
Rent alquiler = (Rent) request.getAttribute("alquiler");
if(cliente!=null)
{
	
}
if(alquiler!=null)
{
	
}

	

%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main.css">
  </head>
  <body>
		<header>

			<div id="header">
				<img src="img/logoplaya.png" width="70px">
			</div>
			<div id="header">
				<h6>Las Mejores Vacaciones que Disfrutaras</h6>
				<h1>Mi Playita S.A.</h1>
			</div>
			<br class="float-stopper">
		</header>
	    <main>
	    <form action="${pageContext.request.contextPath}/RegistroAlquiler" method="post">
	    <input type="hidden" name="action" value="back">
			<div class="body-navbar">
				<input class="nav-left" type="submit">&#60;Atras</a>
			</div>
		</form>
		<br class="float-stopper">

	      <%
	      if(request.getAttribute("tableApartmentDisponibles")!=null)
	      {
	    	  %>
	    	<form class="" action="${pageContext.request.contextPath}/RegistroAlquiler" method="post">
    		Paso 2:
 
	      <% 
	    	  out.println(request.getAttribute("tableApartmentDisponibles"));
	    	  
	      
	      %>
	      </form>
	      <%} %>
	
    </main>
		<%@include file="footer.jsp"%>
  </body>
</html>