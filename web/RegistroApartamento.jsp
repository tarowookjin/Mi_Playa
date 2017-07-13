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
<div class="body-navbar">
			<a class="nav-left" href="${pageContext.request.contextPath}/web/inicio.jsp">&#60;Menu Principal</a>
		</div>
		<br class="float-stopper">
 <form class="" action="${pageContext.request.contextPath}/RegistroApartamento" method="post">
    	Paso 1:
      Propietario:
     <select name="id_prop"> <%out.print(propietariesSelect); %></select><br><br>
      	Año:<input required type ="text" name = "ano"><br><br>
      	Edificio:<input required type ="text" name = "edificio"><br><br>
       Recamaras:<input required type ="number" min="1" name = "recamaras"><br><br>
      Costo Alquiler:<input required type ="number" min = "0.0" name = "costo_alquiler"><br><br>
      Costo Mantenimiento:<input required type ="number" min = "0.0" name = "costo_mantenimiento"><br><br>
      <input class ="button" type="submit" name="enviar" value="Enviar">
	      </form>
</main>
<%@include file="footer.jsp"%>
</body>

</html>