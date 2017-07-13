<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
	<head>
		<meta charset="utf-8">
		<title>
			Inventario de Apartamento
		</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main.css">		
	</head>
	<body>
	<%@include file="/web/header.jsp"%>
		<main>
		<div class="body-navbar">
			<a class="nav-left" href="listadoApartamentos.html">&#60;Listado de Apartamentos</a>
		</div>
		<br class="float-stopper">
		<h4>Informacion del Apartamento</h4>
		<ul>
			<li>ID:41</li>
			<li>Propietario:Elmer Santos</li>
			<li>Recamaras:3</li>
			<li>Año:2002</li>
			<li>Costo de Alquiler:300$/Mes</li>
			<li>Costo de Mantenimiento:10$/Año</li>
		</ul>
		<h4>Equipo Permanente</h4>
			<table>
				<tr>
					<th>
						Nombre del Equipo
					</th>	
					<th>
						Cantidad
					</th>
					<th>
						Descripccion	
					</th>	
				</tr>
				<tr>
					<td>
						Estufa
					</td>
					<td>
						1
					</td>
					<td>
						Black & Decker 21
					</td>
				</tr>
				<tr>
					<td>
						Refrigeradores
					</td>
					<td>
						2
					</td>
					<td>
						Samsung Gear 3000X
					</td>
				</tr>
				<tr>
					<td>
						Aires Acondicionados
					</td>
					<td>
						2
					</td>
					<td>
						Selectron 420 Blazing
					</td>
				</tr>
				<tr>
					<td>
						Lavadoras-Secadoras
					</td>
					<td>
						1
					</td>
					<td>
						Whirpool Breeze 4
					</td>
				</tr>
				<tr>
					<td>
						Camas
					</td>
					<td>
						4
					</td>
					<td>
						Doctor Dream FULL
					</td>
				</tr>
				<tr>
					<td>
						Comedor
					</td>
					<td>
						1
					</td>
					<td>
						Ikea
					</td>
				</tr>
				<tr>
					<td>
						Sillones de saña
					</td>
					<td>
						4
					</td>
					<td>
						Reclinables
					</td>
				</tr>



			</table>


		<h4>Equipo Temporal</h4>
			<table>
				<tr>
					<th>
						Nombre del Equipo
					</th>	
					<th>
						Cantidad
					</th>
					<th>
						Descripccion	
					</th>	
				</tr>
				<tr>
					<td>
						Platos	
					</td>
					<td>
						20
					</td>
					<td>
						Ceramica y plastico
					</td>
				</tr>
				<tr>
					<td>
						Tazas
					</td>
					<td>
						5
					</td>
					<td>
						Ceramica
					</td>
				</tr>
				<tr>
					<td>
						Ollas	
					</td>
					<td>
						4
					</td>
					<td>
						Acero Inoxidable
					</td>
				</tr>
				<tr>
					<td>
						Vasos	
					</td>
					<td>
						10
					</td>
					<td>
						Plastico y aluminio
					</td>
				</tr>
				<tr>
					<td>
						Cubiertos
					</td>
					<td>
						30
					</td>
					<td>
						Aluminio
					</td>
				</tr>
				<tr>
					<td>
						Microondas
					</td>
					<td>
						1
					</td>
					<td>
						Panasonic Waxy Coocker 2
					</td>
				</tr>
				<tr>
					<td>
						Televisores
					</td>
					<td>
						4
					</td>
					<td>
						Sony Bravia 32'
					</td>
				</tr>
				<tr>
					<td>
						Programacion por cable	
					</td>
					<td>
						200
					</td>
					<td>
						Plan Platinum de Sky
					</td>
				</tr>
				<tr>
					<td>
						Cafetera
					</td>
					<td>
						1
					</td>
					<td>
						Black & Decker NoSleepToday XL
					</td>
				</tr>



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
