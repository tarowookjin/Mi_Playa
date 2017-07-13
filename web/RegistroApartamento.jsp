<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<%
if(session.getAttribute("user") == null){
	%> <jsp:forward page="/web/login.jsp" /><% 
}
String propietariesSelect = (String)request.getAttribute("propietarios_disp");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="header.jsp"%>
<main>
 <form class="" action="${pageContext.request.contextPath}/RegistroApartamento" method="post">
    	Paso 1:
      Propietario:
     <select name="id_prop"> <%out.print(propietariesSelect); %></select>
      	Año:<input required type ="text" name = "ano">
      	Edificio:<input required type ="text" name = "edificio">
       Recamaras:<input required type ="number" min="1" name = "recamaras">
      Costo Alquiler:<input required type ="number" min = "0.0" name = "costo_alquiler">
      Costo Mantenimiento:<input required type ="number" min = "0.0" name = "costo_mantenimiento">
      <input class ="button" type="submit" name="enviar" value="Enviar">
	      </form>
</main>
<%@include file="footer.jsp"%>
</body>

</html>