<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eldojo.entities.*" %> 
<!DOCTYPE html>
<html>
<head>
<%
out.print(session.getAttribute("user") );
if(session.getAttribute("user") == null){
	
	%> <jsp:forward page="/web/login.jsp" /><% 
}
%>
<%
Integer paso = 1;
request.setAttribute("paso",paso);
Client cliente = (Client) request.getAttribute("cliente");
Rent alquiler = (Rent) request.getAttribute("alquiler");

if(cliente==null)
{
	cliente = new Client();
}
if(alquiler==null)
{
	alquiler =new Rent();
}
log(cliente.getNombre());
log(cliente.getApellido());

%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main.css">
  </head>
  <body>
	<%@include file="/web/header.jsp"%>
	    <main>
		<div class="body-navbar">
			<a class="nav-left" href="${pageContext.request.contextPath}/web/inicio.jsp">&#60;Menu Principal</a>
		</div>
		<br class="float-stopper">
    <form class="" action="${pageContext.request.contextPath}/RegistroAlquiler" method="post">
    Paso 1:
      Nombre:
      <input type="text" name="nombre" required autofocus placeholder="Nombre del Cliente" title="Nombre" value = "<%out.print(cliente.getNombre());%>"><br><br>
       Cedula:
      <input type="text" name="apellido" required autofocus placeholder="Apellido del Cliente" title="Apellido" value = "<%out.print(cliente.getCedula());%>"><br><br>
      Cedula:
      <input type="text" name="cedula" required autofocus placeholder="Cedula del Cliente" title="Introduzca su nombre aqui" value = "<%out.print(cliente.getCedula());%>"><br><br>

      Fecha de entrada:
      <input type="date" name="fecha_entrada" required value = "<%out.print(alquiler.getFecha_entrada());%>"><br><br>
      Fecha de salida:
      <input type="date" name="fecha_salida" required value = "<%out.print(alquiler.getFecha_salida());%>"><br><br>
      Cantidad de personas:
      <select class="" name="cant_personas" ">
        <option <%if(alquiler.getCantPersonas()==1)out.print("Selected"); %> value="1">1</option>
        <option <%if(alquiler.getCantPersonas()==2)out.print("Selected"); %>  value="2">2</option>
        <option <%if(alquiler.getCantPersonas()==3)out.print("Selected"); %>  value="3">3</option>
        <option <%if(alquiler.getCantPersonas()==4)out.print("Selected"); %>  value="4">4</option>
      </select><br><br>
      Forma de pago:
      <select class="" name="pago" ">
        <option <%if(alquiler.getTipoPago().equals("Efectivo"))out.print("Selected"); %> value="Efectivo">Efectivo</option>
        <option <%if(alquiler.getTipoPago().equals("Credito"))out.print("Selected"); %> value="Credito">Credito</option>
      </select><br><br>
      <input class ="button" type="submit" name="enviar" value="Enviar">
	      </form>
	    
	
    </main>
		<%@include file="/web/footer.jsp"%>
  </body>
</html>