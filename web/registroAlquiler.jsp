<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title></title>
    <link rel="stylesheet" type="text/css" href=""${pageContext.request.contextPath}/web/css/main.css"">
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
		<div class="body-navbar">
			<a class="nav-left" href=Inicio.html>&#60;Menu Principal</a>
		</div>
		<br class="float-stopper">
    <form class="" action="confirmacion.html" method="get">
      Nombre:
      <input type="text" name="Nombre" value="" required="" autofocus="" placeholder="" title="Introduzca su nombre aqui"><br><br>
      Fecha de entrada:
      <input type="date" name="fecha_entrada" value="" required=""><br><br>
      Fecha de salida:
      <input type="date" name="fecha_salida" value=""><br><br>
      Cantidad de personas:
      <select class="" name="cant_personas">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
      </select><br><br>
      Tipo de apartamento:
      <select class="" name="tipo_apt">
        <option value="perm">Permanente</option>
        <option value="temp">Temporal</option>
      </select><br><br>
      Forma de pago:
      <select class="" name="pago">
        <option value="efec">Efectivo</option>
        <option value="cred">Credito</option>
      </select><br><br>
      <input type="submit" name="enviar" value="Enviar">
 <a class="button" href="factura.html">Enviar</a>
	      </form>
    </main>
		<%@include file="footer.jsp"%>
  </body>
</html>