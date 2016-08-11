<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
 		<meta charset="utf-8">
    	<title>Alta autor</title>

    	<link href="assets/css/bootstrap.css" rel="stylesheet">
	    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
    	<link href="assets/css/style.css" rel="stylesheet">
    	<link href="assets/css/style-responsive.css" rel="stylesheet">
  	</head>
	<body>
		<%if(session.getAttribute("rolUsuario").equals("admin")){ %>
		<section id="container" >
      		<jsp:include page="navbar.jsp"></jsp:include>
      		<jsp:include page="sidebarAdmin.jsp"></jsp:include>
      		<section id="main-content">
          		<section class="wrapper">
          			<h3><i class="fa fa-angle-right"></i> Agregar un Autor</h3>
          			<div class="row mt">
          				<div class="col-lg-12">
                  			<div class="form-panel">
                  	  			<h4 class="mb"><i class="fa fa-angle-right"></i> Completar el formulario</h4>
                      			<form class="form-horizontal style-form" action="altaAutor" method="POST">
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
                          			<div class="centrar-cont">
                          				<input type="submit" class="btn btn-primary" value="Aceptar">
                          				<input type="button" name="btnCancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='inicio.jsp'">	
                          			</div>                          
                      			</form>
                  			</div>
          				</div>  	
          			</div>
          		</section>
          	</section>      
  		</section> 
  	 	<%}else{
	  			response.sendRedirect("login.jsp");
	  	}%>
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