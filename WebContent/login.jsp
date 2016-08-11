<%@page import="entidades.*" %>

<!DOCTYPE html>
<html¡>
	<head>
    	<title>Login</title>
    	<link href="assets/css/bootstrap.css" rel="stylesheet">
    	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" href="http://s.mlcdn.co/animate.css">
    	<link href="assets/css/style.css" rel="stylesheet">
    	<link href="assets/css/style-responsive.css" rel="stylesheet">
    	<link href="css/styles.css" rel="stylesheet">   
  	</head>
  	<body> 
	  	<div id="login-page">
	  		<div class="container">
	  			<%session.setAttribute("usuario",null);
	  			session.setAttribute("rolUsuario",null);
	  			session.setAttribute("nombreUsuario", null);
	  			session.setAttribute("carrito",null);%>	  			
		      	<form class="form-login" action="loginCliente" method="post">
		        	<h2 class="form-login-heading">INICIAR SESIÓN</h2>
		        	<div class="login-wrap">
		      			<%if(session.getAttribute("msj") != null){ %>
		      				<p class="error">Usuario o contraseña incorrectos</p>
		      			<%} %>
		            	<input type="text" name="usuario" class="form-control" placeholder="usuario" autofocus>
		            	<br>
		            	<input type="password" name="clave" class="form-control" placeholder="clave">
		            	<br>
		            	<input class="btn btn-theme btn-block" type="submit" value="Ingresar">
		          		<input class="btn btn-theme btn-block" type="button" value="Volver al inicio" onclick="location.href='inicio.jsp'">
		            	<hr>
		            	<div class="registration">
		                	Si no estas registrado, hacé click acá<br/>
		                	<a class="" href="nuevoCliente.jsp">
			                    Crear una cuenta
			                </a>
		            	</div>
		        	</div>
		      	</form>	  	
	  		</div>
	  	</div>
    	<script src="assets/js/jquery.js"></script>
    	<script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>
