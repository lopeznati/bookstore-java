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

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
	  			<%session.setAttribute("usuario",null);
	  			session.setAttribute("rolUsuario",null);
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
		            <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal"> Olvidé mi contraseña</a>
		
		                </span>
		            </label>
		            
		            <input class="btn btn-theme btn-block" type="submit" value="Ingresar">
		          	<input class="btn btn-theme btn-block" type="submit" value="Volver al inicio" onclick="javascript:history.back()">
		            <hr>
		            <div class="registration">
		                Si no estas registrado, hacé click acá<br/>
		                <a class="" href="altaCliente.jsp">
		                    Crear una cuenta
		                </a>
		            </div>
		
		        </div>
		
		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Olvidaste tu contraseña ?</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p>Por favor, ingresa tu email para resetearla</p>
		                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-default" type="button">Cancelar</button>
		                          <button class="btn btn-theme" type="button">Aceptar</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/White-Background.jpg", {speed: 500});
    </script>


  </body>
</html>
