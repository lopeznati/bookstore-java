<%@page import="entidades.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Animate CSS -->
    <link rel="stylesheet" href="http://s.mlcdn.co/animate.css">
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
  </head>
  <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
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
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>
