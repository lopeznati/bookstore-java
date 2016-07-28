<%@page import="negocio.ControladorCliente"%>
<%@page import="datos.CatalogoCliente"%>
<%@page import="datos.CatalogoLibro"%>
<%@page import="entidades.Localidad"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  	<head>
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta name="description" content="">
    	<meta name="author" content="Dashboard">
    	<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    	<title>Alta cliente</title>
    
    	<!-- Bootstrap core CSS -->
    	<link href="assets/css/bootstrap.css" rel="stylesheet">
    
    	<!--external css-->
    	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
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
	
  		<section id="container" >
      		<jsp:include page="navbar.jsp"></jsp:include>
      		
      		<!-- **********************************************************************************************************************************************************
      				MAIN SIDEBAR MENU
      		*********************************************************************************************************************************************************** -->
      		
      		<jsp:include page="sidebarAdmin.html"></jsp:include>
      
      		<!-- **********************************************************************************************************************************************************
      				MAIN CONTENT
      		*********************************************************************************************************************************************************** -->
      		<!--main content start-->
      		
      		<section id="main-content">
          		<section class="wrapper">
          			<h3><i class="fa fa-angle-right"></i> Nuevo Cliente</h3>	
          			<!-- BASIC FORM ELELEMNTS -->
          			<div class="row mt">
          				<div class="col-lg-12">
                  			<div class="form-panel">
                  	  			<h4 class="mb"><i class="fa fa-angle-right"></i> Completar el formulario</h4>
                      			<form class="form-horizontal style-form" onSubmit="return validarPasswd()" action="altaCliente" method="POST">
                      	 			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Usuario</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="usuario" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Contraseña</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="clave" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Repetir contraseña</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="clave2" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Nombre</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="nombre" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Apellido</label>
                              			<div class="col-sm-10">
                              				<input type="text" name="apellido" required class="form-control">    
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Fecha Nacimiento</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="fecha_nacimiento" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Telefono</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="tel" required class="form-control">
                              			</div>
                          			</div>
                         			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Mail</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="mail" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Dirección</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="direccion" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Rol</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="rol" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Localidad</label>
                              			<div class="col-sm-10">
                                  			<select name="localidad_id" class="form-control">
						  						<option>...</option>
						  							<%ArrayList<Localidad> localidades= new ControladorCliente().getAllLocalidades();
													for(Localidad l:localidades){%>
						  						<option value="<%=l.getId()%>"><%=l.getNombre()%></option>
						  						<%} %>						  			
											</select>
                              			</div>
                          			</div>
                          			<div class="centrar-cont">
                          				<button class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">GUARDAR</button>	
                          			</div>
                    		 	</form>
                  			</div>
          				</div><!-- col-lg-12-->      	
          			</div><!-- /row -->       
      				<!--footer start-->
      				<footer class="site-footer">
          				<div class="text-center">
              				2016 - Castellarín - Lopez Leiva - Pintener
              				<a href="form_component.html#" class="go-top">
                  				<i class="fa fa-angle-up"></i>
              				</a>
          				</div>
      				</footer>
      				<!--footer end-->
  				</section>
  				
  				  	 	
    			
    			<!-- js placed at the end of the document so the pages load faster -->
    			<script src="assets/js/jquery.js"></script>
    			<script src="assets/js/bootstrap.min.js"></script>
    			<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    			<script src="assets/js/jquery.scrollTo.min.js"></script>
    			<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>

    			<!--common script for all pages-->
    			<script src="assets/js/common-scripts.js"></script>
		
    			<!--script for this page-->
    			<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

				<!--custom switch-->
				<script src="assets/js/bootstrap-switch.js"></script>
	
				<!--custom tagsinput-->
				<script src="assets/js/jquery.tagsinput.js"></script>
		
				<!--custom checkbox & radio-->
				<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
				<script src="assets/js/form-component.js"></script>    
  				<script>
      				//custom select box
					$(function(){
          				$('select.styled').customSelect();
      				});
      				//validate password
      				function validarPasswd(){
      					var c1 = document.getElementById("clave").value;
          				var c2 = document.getElementById("clave2").value;
          				if(c1!== c2){      					
          					  alert("Las passwords deben de coincidir");
          					  return false;
          				}	
      				}
  				</script>
	</body>
</html>