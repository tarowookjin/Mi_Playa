<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>
			Factura
		</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main.css">		
	</head>
	<body>
	<%@include file="/web/header.jsp"%>
		<main>

		<div class="body-navbar">
			<a class="nav-left" href=registroAlquiler.html>&#60;Registro de Alguiler</a>
		</div>
		<br class="float-stopper">
		<h4>Informacion del Cliente</h4>
		<ul>
			<li>ID:999</li>
			<li>Cliente: Pepe Frog</li>
			<li>Fecha de Entrada:1/1/17</li>
			<li>Fecha de Salida:8/1/17</li>
			<li>Noches totales:7 noches</li>
		</ul>
		<h4>Informacion del Apartamento</h4>
		<ul>
			<li>ID:666</li>
			<li>Propietario:Klel Wolfram</li>
			<li>Recamaras:3</li>
			<li>Año:2001</li>
			<li>Costo por Noche: 35$</li>
		</ul>
		</ul>
		<h4>Resumen</h4>
			<table>
				<tr>
					<th>
						Descipcion
					</th>	
					<th>
						Cantidad
					</th>
					<th>
						Precio	
					</th>	
				</tr>
				<tr>
					<td>
						Noche Totales:
					</td>
					<td>
						7
					</td>
					<td>
						245.00$
					</td>
				</tr>
				<tr>
					<td>
						Desayuno Continental(10$/Dia):
					</td>
					<td>
						7
					</td>
					<td>
						70.00$
					</td>
				</tr>
				<tr>
					<td>
						Seguro:
					</td>
					<td>
						-
					</td>
					<td>
						2.00$
					</td>
			</table>
			<p>
				<b>Subtotal:			</b>317.00$<br>
				<b>Impuestos 7%-ITBMS:	</b> 22.19$<br>
				<b>Total a Pagar:		</b>339.19$<br>
			</p>
		<br>
		</main>
		<%@include file="footer.jsp"%>
	</body>


</html>