<%@page import="negocio.ControladorCliente"%>
<%@page import="datos.CatalogoCliente"%>
<%@page import="datos.CatalogoLibro"%>
<%@page import="entidades.Localidad"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  	<head>
    	<meta charset="utf-8">
    	<title>Alta cliente</title>
    
    	<link href="assets/css/bootstrap.css" rel="stylesheet">
    	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
    	<link href="assets/css/style.css" rel="stylesheet">
    	<link href="assets/css/style-responsive.css" rel="stylesheet">
	</head>
	<body>
  		<section id="container" >
      		<jsp:include page="navbar.jsp"></jsp:include>
      		<section id="main-content">
          		<section class="wrapper">
          			<h3><i class="fa fa-angle-right"></i> Nuevo Cliente</h3>	
          			<div class="row mt">
          				<div class="col-lg-12">
                  			<div class="form-panel">
                  	  			<h4 class="mb"><i class="fa fa-angle-right"></i> Completar el formulario</h4>
                      			<form name="formAltaCliente" class="form-horizontal style-form" action="altaCliente" method="POST">
									<input type="hidden" name="rol" value="user">
                      	 			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Usuario</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="usuario" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Contraseña</label>
                              			<div class="col-sm-10">
                                  			<input type="password" name="clave" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Repetir contraseña</label>
                              			<div class="col-sm-10">
                                  			<input type="password" name="clave2" required class="form-control">
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
                                  			<input type="Date" name="fecha_nacimiento" required class="form-control">
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
                                  			<input type="email" name="mail" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Dirección</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="direccion" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Localidad</label>
                              			<div class="col-sm-10">
                                  			<select name="localidad_id" id="localidad_id" class="form-control">
						  						<option value="" selected="selected">...</option>
						  							<%ArrayList<Localidad> localidades= new ControladorCliente().getAllLocalidades();
													for(Localidad l:localidades){%>
						  						<option value="<%=l.getId()%>"><%=l.getNombre()%></option>
						  						<%} %>						  			
											</select>
                              			</div>
                          			</div>
                          			<div class="centrar-cont">
										<input type="submit" name="btnAceptar" value="Aceptar" class="btn btn-primary" onClick="validarPassword()">		
                          				<input type="button" name="btnCancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='inicio.jsp'">		
                          			</div>
                    		 	</form>
                  			</div>
          				</div> 	
          			</div>    
      			</section>	
  			</section>
  		</section>
  		<script src="assets/js/jquery.js"></script>
  		<script>
  		$(document).ready(function(){
  			$("form").submit(function(event){
  				var localidad = $("#localidad_id").val();
  				if(localidad === ''){
  					alert("El campo Localidad no puede quedar vacio, seleccione una opcion.");	  
  				//cancela el evento
   					event.preventDefault();
  				}
  			});
  		});
      	//validate password
      	function validarPassword(){
      		var c1 = document.formAltaCliente.clave.value;
          	var c2 = document.formAltaCliente.clave2.value;
          	
          	if(c1 != c2){      					
          		alert("Las contraseñas deben de coincidir");
          	}	
      	}
  		</script>
    	<script src="assets/js/jquery.js"></script>
    	<script src="assets/js/jquery-1.8.3.min.js"></script>
    	<script src="assets/js/bootstrap.min.js"></script>
    	<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    	<script src="assets/js/jquery.scrollTo.min.js"></script>
    	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    	<script src="assets/js/jquery.sparkline.js"></script>
    	<script src="assets/js/common-scripts.js"></script>
    	<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
    	<script src="assets/js/sparkline-chart.js"></script>    
		<script src="assets/js/zabuto_calendar.js"></script>
	</body>
</html>