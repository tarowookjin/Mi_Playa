<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.eldojo.entities.*" %> 
    <%


Client cliente = (Client) request.getAttribute("cliente");
Rent alquiler = (Rent) request.getAttribute("alquiler");
Apartment apt = (Apartment) request.getAttribute("apartment");
if(cliente!=null)
{
	
}
if(alquiler!=null)
{
	
}

	

%>
<!DOCTYPE html>
<html>
  <head>
    <title>Confirmacion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/css.css">
  </head>
  <body>

    <header>
      <img src="img/logoplaya.png" alt="">
      <ul>
        <li><a href="#">Inicio</a></li>
        <li><a href="#">Registrarse</a></li>
        <li><a href="#">Login</a></li>
        <li><a href="#">Cliente</a>
            <ul>
              <li><a href="#">Registrar</a></li>
              <li><a href="#">Confirmacion</a></li>
            </ul>
        </li>
      </ul>
    </header>

    <section>
    <form action=/RegistroAlquiler method=post>
      <%
	      out.println("<p>Nombre:"+cliente.getNombre()+"</p>");
	      out.println("<p>Apellido:"+cliente.getApellido()+"</p>");
	      out.println("<p>Cedula:"+cliente.getCedula()+" <br>");
	      out.println("<p>Fecha de Entrada:"+alquiler.getFecha_entrada()+"</p>");
	      out.println("<p>Fecha de Salida:"+alquiler.getFecha_salida()+"</p>");
	      out.println("<p>Cantidad de Personas:"+alquiler.getCantPersonas()+"</p>");
	      out.println("<p>Metodo de Pago:"+alquiler.getMonto()+"</p>");
	      out.println("<p>SubTotal:"+apt.getCosto_alquiler()+"</p>");
	      out.println("<p>Total:"+apt.getCosto_alquiler()*1.07+"</p>");
	   %>
	   <input type="hidden" name=action value=Confirm>
	      <input type="submit" value="Aceptar">
	      </form>
    </section>
    <footer>
      Propiedad de Mi Playa, S.A. 2017
    </footer>
  </body>
</html>