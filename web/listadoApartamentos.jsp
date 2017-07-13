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
			<a class="nav-left" href="${pageContext.request.contextPath}/web/inicio.jsp">&#60;Menu Principal</a>
		</div>
		<br class="float-stopper">
		<h2>Listado de Apartamentos</h2>
		<div class="form-wrapper">
		<form id="formlistapart" action="${pageContext.request.contextPath}/listapartServlet" method="post">
			<div class="fieldset-wrapper">	
			<fieldset  class="filter-left" >
				<h4>Filtros</h4>
				<div class="input-combo">Propietario:<input type="text" name="propiet_name"></div>	
				<div class="input-combo">Edificio:<input type="text" name="edif_name"></div>
				<div class="input-combo">Año:<input type="number" name="ano" min="1950"></div>
				<br>
				<span>Recamaras</span>
				<br>
				<div class="input-combo">Minimo:<input type="number" name="recam_min" min="0"></div>
				<div class="input-combo">Maximo:<input type="number" name="recam_max" min="0"></div>
				<br>
				<span>Costo de Alquiler</span>
				<br>
				<div class="input-combo">Minimo:<input type="number" name="cost_alq_min" min="0"></div>
				<div class="input-combo">Maximo:<input type="number" name="cost_alq_max"min="0" ></div>
				<br>
				<span>Costo de Mantenimiento</span>
				<br>
				<div class="input-combo">Minimo:<input type="number" name="cost_man_min" min="0"></div>
				<div class="input-combo">Maximo:<input type="number" name="cost_man_max"min="0" ></div>
				<br>
				<span>Estado</span>
				<br>
				<div class="input-combo">Disponibles:<input type="radio" name="estado" value="ocupado"></div>
				
				<div class="input-combo">Ocupados:<input type="radio" name="estado" value="ocupados"></div>
				<div class="input-combo">Todos:<input type="radio" name="estado" value="todos"></div>
				
				<br>
			</fieldset></div>
			</form>
			<div class="fieldset-wrapper"><fieldset class="table-prop-right">
			<h4>Incluir</h4>

				<div class="input-combo">ID:<input type="checkbox" name="showProp"></div><br>
				<div class="input-combo">Propietario:<input type="checkbox" name="showProp"></div><br>
				<div class="input-combo">Edificio:<input type="checkbox" name="showProp"></div><br>
				<div class="input-combo">Año:<input type="checkbox" name="showProp"></div><br>
				<div class="input-combo">Recamaras:<input type="checkbox" name="showProp"></div><br>
				<div class="input-combo">Costo de Alquiler:<input type="checkbox" name="showProp"></div><br>
				<div class="input-combo">Estado:<input type="checkbox" name="showProp"></div><br>
				</fieldset></div>
			
		<br class="float-stopper">
		<div class="submit-wrapper"><input type="submit" name="Filtrar"></div>
		</form>
		</div>
			<table>
			<%
			//tabla
			String str=(String)pageContext.findAttribute("listapart");
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
