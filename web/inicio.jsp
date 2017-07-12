<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Inicio</title>
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
  <ul class="menuGrid">
	<a href="listadoApartamentos.html"><li><img src="img/lista.png"><p>Listado de Apartamentos</p></li></a>
	<a href="${pageContext.request.contextPath}/listclientServlet"><li><img src="img/lista.png"><p>Listado Clientes</p></li></a>
    <a href="apartamentosOcupados.html"><li><img src="img/lista.png"><p>Reporte de Apartamentos Ocupados</p></li></a>
    <a href="registroAlquiler.html"><li><img src="img/lista.png"><p>Registrar Alquiler</p></li></a>
    <a href="informeIngreso.html"><li><img src="img/lista.png"><p>Informe de ingreso</p></li></a>
  </ul>
  <br class="float-stopper">
  </main>
		<%@include file="footer.jsp"%>
</body>
</html>