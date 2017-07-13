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
	<%@include file="/web/header.jsp"%>
	    <main>
	    <form action="${pageContext.request.contextPath}/RegistroAlquiler" method="post">
	    <input type="hidden" name="action" value="back">
			<div class="body-navbar">
				<input class="nav-left" type="submit" value=&#60Atras>;
			</div>
		</form>
		<br class="float-stopper">
		
	      <%
	      out.println("<p>Nombre:"+cliente.getNombre()+"</p>");
	      out.println("<p>Apellido:"+cliente.getApellido()+"</p>");
	      out.println("<p>Cedula:"+cliente.getCedula()+" <br>");
	      out.println("<p>Fecha de Entrada:"+alquiler.getFecha_entrada()+"</p>");
	      out.println("<p>Fecha de Salida:"+alquiler.getFecha_salida()+"</p>");
	      out.println("<p>Cantidad de Personas:"+alquiler.getCantPersonas()+"</p>");
	      out.println("<p>Metodo de Pago:"+alquiler.getTipoPago()+"</p>");
	      %>
	      <% 
	      if(request.getAttribute("tableApartmentDisponibles")!=null)
	      {
	    	  %>
	    	<form class="" action="${pageContext.request.contextPath}/RegistroAlquiler" method="post">
    		Paso 2:
 
	      <% 
	    	  out.println(request.getAttribute("tableApartmentDisponibles"));
	    	  
	      
	      %>
	      <input type="hidden" name=action value=Resumen>
	      <input class ="button" type="submit">
	      </form>
	      <%} %>
	
    </main>
		<%@include file="footer.jsp"%>
  </body>
</html>