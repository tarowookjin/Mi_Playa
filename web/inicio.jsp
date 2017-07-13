<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Inicio</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main.css">
</head>
<body>
  <%@include file="/web/header.jsp"%>
  <main>
  <ul class="menuGrid">
	<a href="${pageContext.request.contextPath}/listapartServlet"><li><img src="${pageContext.request.contextPath}/web/img/lista.png""><p>Listado de Apartamentos</p></li></a>
	<a href="${pageContext.request.contextPath}/listclientServlet"><li><img src="${pageContext.request.contextPath}/web/img/lista.png"><p>Listado Clientes</p></li></a>
    <a href="${pageContext.request.contextPath}/listapartocuServlet"><li><img src="${pageContext.request.contextPath}/web/img/lista.png""><p>Reporte de Apartamentos Ocupados</p></li></a>
    <a href="${pageContext.request.contextPath}/RegistroAlquiler"><li><img src="${pageContext.request.contextPath}/web/img/lista.png""><p>Registrar Alquiler</p></li></a>
    <a href="${pageContext.request.contextPath}/inforingreServlet"><li><img src="${pageContext.request.contextPath}/web/img/lista.png""><p>Registrar Propietario</p></li></a>
    <a href="${pageContext.request.contextPath}/inforingreServlet"><li><img src="${pageContext.request.contextPath}/web/img/lista.png""><p>Informe de ingreso</p></li></a>

  </ul>
  <br class="float-stopper">
  </main>
		<%@include file="/web/footer.jsp"%>
</body>
</html>