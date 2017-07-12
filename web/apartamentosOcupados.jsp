<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
!DOCTYPE html>
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
		<br id="clear">
		<h4>Listado de Apartamentos Ocupados</h4>
			<table>
				<tr>
					<th>
						ID-Cliente
					</th>	
					<th>
						Nombre
					</th>
					<th>
						ID-Apartamento	
					</th>
					<th>
						Propietario
					</th>
					<th>
						Noches Restantes
					</th>
					<th>
						Dia de Entrada
					</th>
					<th>
						Dia de Salida
					</th>	
				</tr>
				<tr>
					<td>
						999
					</td>
					<td>
						Pepe Frog
					</td>
					<td>
						666
					</td>
					<td>
						Klel Wolfram
					</td>
					<td>
						7
					</td>
					<td>
						1/1/17
					</td>
					<td>
						8/1/17
					</td>
				</tr>
				<tr>
					<td>
						1234
					</td>
					<td>
						TaroWJ
					</td>
					<td>
						098
					</td>
					<td>
						Alcalde Diaz
					</td>
					<td>
						3
					</td>
					<td>
						5/2/16
					</td>
					<td>
						10/2/16
					</td>
				</tr>
				<tr>
					<td>
						644
					</td>
					<td>
						AuronPlay
					</td>
					<td>
						573
					</td>
					<td>
						Vegeta777
					</td>
					<td>
						4
					</td>
					<td>
						8/2/16
					</td>
					<td>
						12/2/16
					</td>
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