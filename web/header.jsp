<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<%
if(session.getAttribute("user") == null){
	%> <jsp:forward page="/web/login.jsp" /><% 
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/main.css">
		<script type="text/javascript">
		var myVar=setInterval(function () {myTimer()}, 1000);
		var counter = 0;
		function myTimer() {
   		var date = new Date();
    	document.getElementById("demo").innerHTML = date.toUTCString()
		}
		</script>		
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
			<form action="${pageContext.request.contextPath}/web/stopSession.jsp"><input type=submit value ="Cerrar Session"></form>
			<div id="servertime">
			<span class="more" id="demo"></span>
			</div>
			<br class="float-stopper">
		</header>
</body>
</html>