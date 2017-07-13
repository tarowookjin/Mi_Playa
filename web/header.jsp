<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
		<script type="text/javascript">
		var myVar=setInterval(function () {myTimer()}, 1000);
		var counter = 0;
		function myTimer() {
   		var date = new Date();
    	document.getElementById("demo").innerHTML = date.toUTCString()
		}
		</script>
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
			<div id="servertime">
			<span class="more" id="demo"></span>
			</div>
			<br class="float-stopper">
		</header>
</body>
</html>