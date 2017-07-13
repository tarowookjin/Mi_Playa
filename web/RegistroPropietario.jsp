<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<%
if(session.getAttribute("user") == null){
	%> <jsp:forward page="/web/login.jsp" /><% 
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="header.jsp"%>
<main>
 <form class="" action="${pageContext.request.contextPath}/RegistroPropietario" method="post">
    	Paso 1:
      Nombre:
      <input type="text" name="nombre" required autofocus placeholder="Nombre del Propietario" title="Nombre"><br><br>
       Apellido:
      <input type="text" name="apellido" required autofocus placeholder="Apellido del Propietario" title="Apellido"><br><br>
      Cedula:
      <input type="text" name="cedula" required autofocus placeholder="Cedula del Propietario" title="Introduzca su nombre aqui"><br><br>

     
      <input class ="button" type="submit" name="enviar" value="Enviar">
	      </form>
</main>
<%@include file="footer.jsp"%>
</body>

</html>