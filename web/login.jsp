<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<title>Inciar Sesión</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css.css">
</head>
<body>
<h2 id="h2login">Inicio de Sesión</h2>

<form id="formlogin" action="startSession.jsp" >
  <div class="containerl">
  <%
  	if(request.getParameter("loginStatus")=="conectionError")
 	{
  		out.print("<span class=\"errorText\">*Error de Coneccion</span>");
  	}
  	else
  	{
  		if(request.getParameter("loginStatus") !=null&& request.getParameter("loginStatus").equals("badLogin"))
  		{
  			out.println("<span class=\"errorText\">*Usuario/Contraseña erronea.</span>");
  		}
  	}
  %>
    <label><b>Nombre de Usuario</b></label>
    <input type="text" placeholder="Introduzca su usuario" name="uname" required>

    <label><b>Contraseña</b></label>
    <input type="password" placeholder="Introduzca su contraseña" name="psw" required>

    <input class="signupbtnl" type="submit">Iniciar</input>
    <input type="checkbox" checked="checked">Recuerdame
  </div>

  <div class="containerl">
    <button type="button" class="cancelbtnl">Cancelar</button>
    <span class="psw"> <a href="#">Olvidó su contraseña?</a></span>
    
  </div>
</form>
</body>
</html>