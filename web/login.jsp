<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<!DOCTYPE html>
<html>
<head>
<title>Inciar Sesión</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/css.css">
</head>
<body>


   
    

<h2 id="h2login">Inicio de Sesión</h2>

<form id="formlogin" action="${pageContext.request.contextPath}/LoginServlet" method="post" >
  <div class="containerl">
 
    <label><b>Nombre de Usuario</b></label>
    <input type="text" placeholder="Introduzca su usuario" name="uname" required>

    <label><b>Contraseña</b></label>
    <input type="password" placeholder="Introduzca su contraseña" name="psw" required>
	
    <input class="signupbtnl" type="submit">Iniciar</input>
    <input type="checkbox" checked="checked">Recuerdame
     <%
    	 String errMessage=(String)pageContext.findAttribute("errMessage");
    	if(errMessage!=null)
    	{
    		out.println("<p class= error>"+errMessage+"</p>");
    	}
  %>
  </div>

  <div class="containerl">
    <button type="button" class="cancelbtnl">Cancelar</button>
    <span class="psw"> <a href="#">Olvidó su contraseña?</a></span>
    
  </div>
</form>
</body>
</html>