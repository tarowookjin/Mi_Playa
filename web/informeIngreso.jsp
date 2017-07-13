<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>
			Informe Ingreso 
		</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main.css">		
	</head>
	<body>
	<%@include file="/web/header.jsp"%>
		<main>
		<div class="body-navbar">
			<a class="nav-left" href="${pageContext.request.contextPath}/web/inicio.jsp">&#60;Menu Principal</a>
		</div>
		<br id="clear">
		<br>
		<form action="${pageContext.request.contextPath}/inforingreServlet" method="post">
			<div class=input-combo>
			Propietario: 
			<select class="" name="chose_propietario">
        	<%
			//tabla
			String str=(String)pageContext.findAttribute("propietarios_disp");
			if(str!=null)
	    	{
	    		out.println(str);
	    	}
			else
			{
	    		out.println("Algo salio mal :c");
			}
			%>
      		</select><br><br>
			</div>
			<input class ="button" type="submit" name="enviar" value="Enviar">
		</form>
		<h4>Informe para Propietario</h4>
			<table>
			<%
			//tabla
			String str2=(String)pageContext.findAttribute("lista_monto");
			if(str2!=null)
	    	{
	    		out.println(str2);
	    	}
			else
			{
	    		out.println("Algo salio mal :c");
			}
			%>
			</table>
			<br>
			<div class="body-navbar">
				<a class="nav-left" href=#>DESCARGAR</a>
			</div>
			<div class="imprimir">
				<a class="nav-left" href=#>IMPRIMIR</a>
			</div>
			<br class="float-stopper">	
		</main>
		<%@include file="footer.jsp"%>
	</body>


</html>