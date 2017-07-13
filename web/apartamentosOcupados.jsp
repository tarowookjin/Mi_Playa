<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>
			Listado de Apartamentos Ocupados
		</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main.css">		
	</head>
	<body>
		<header>

			<div id="header">
				<img src="${pageContext.request.contextPath}/web/img/logoplaya.png" width="70px">
			</div>
			<div id="header">
				<h6>Las Mejores Vacaciones que Disfrutaras</h6>
				<h1>Mi Playita S.A.</h1>
			</div>
			<br class="float-stopper">
		</header>
		<main>
		<div class="body-navbar">
			<a class="nav-left" href=${pageContext.request.contextPath}/web/inicio.jsp>&#60;Menu Principal</a>
		</div>
		<br id="clear">
		<h4>Listado de Apartamentos Ocupados</h4>
			<table>
			<%
			//tabla
			String str=(String)pageContext.findAttribute("ocuapart");
			if(str!=null)
	    	{
	    		out.println(str);
	    	}
			else
			{
	    		out.println("Algo salio mal :c");
			}
			%>
			</table>
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