<%@page import="negocio.ControladorLibro"%>
<%@page import="datos.CatalogoCliente"%>
<%@page import="datos.CatalogoLibro"%>
<%@page import="datos.CatalogoLocalidad"%>
<%@page import="entidades.Localidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.ControladorCliente"%>
<%@page import="entidades.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta name="description" content="">
    	<title>Actualizar libro</title>
	
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
  	
  	<%if(session.getAttribute("usuario") != null){ %> 		
  	 		<%if((session.getAttribute("usuario") != null)){
            	if ((session.getAttribute("rolUsuario").equals("admin"))){%>
            	 <jsp:include page="sidebarAdmin.jsp"></jsp:include>
				<% 
				}
            	else{%>	
				<jsp:include page="sidebar.jsp"></jsp:include>
			 <%}%>
		  <%}else{ %>
			 	<jsp:include page="sidebar.jsp"></jsp:include>
		  <%} %>
  	     
  	   
  	      
  	      	<!-- **********************************************************************************************************************************************************
  	      	MAIN CONTENT
  	      	*********************************************************************************************************************************************************** -->
  	      	<!--main content start-->
  	      	<section id="main-content">
  	        	<section class="wrapper">
  	          		<h3><i class="fa fa-angle-right"></i> Modificar Cliente</h3>
  	       			<%Cliente cliente = new ControladorCliente().getOneCliente(Integer.parseInt(request.getParameter("idMod")));%>
  	          		<!-- BASIC FORM ELELEMNTS -->
  	          		<div class="row mt">
  		          		<div class="col-lg-12">
  	                  		<div class="form-panel">
  	                  	  		<h4 class="mb"><i class="fa fa-angle-right"></i> Completar el formulario</h4>
  	                      		<form class="form-horizontal style-form" action="modificarCliente" method="POST">   
  	                                <input type="hidden" name="id" value="<%=cliente.getId()%>" class="form-control">
  	                                <input type="hidden" name="rol" value="<%=cliente.getRol()%>">
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Usuario</label>
  	                              		<div class="col-sm-10">
  	                                  		<input type="text" name="usuario" class="form-control" value="<%=cliente.getUsuario()%>" required> 
  	                              		</div>
  	                          		</div>
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Clave</label>
  	                              		<div class="col-sm-10">
  	                                  		<input type="text" name="clave" class="form-control" value="<%=cliente.getClave() %>" required>
  	                              		</div>
  	                          		</div>
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Nombre</label>
  	                              		<div class="col-sm-10">
  	                                  		<input type="text" name="nombre" class="form-control" value="<%=cliente.getNombre()%>" required>
  	                              		</div>
  	                          		</div>
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Apellido</label>
  	                              		<div class="col-sm-10">
  	                              			<input type="text" name="apellido" class="form-control" value="<%=cliente.getApellido()%>" required>
  	                             		</div>
  	                          		</div>	
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Fecha Nacimiento</label>
  	                              		<div class="col-sm-10">
  	                                  		<input type="text" name="fecha_nacimiento" class="form-control" value="<%=cliente.getFecha_nacimiento()%>" required>
  	                              		</div>
  	                          		</div>
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Telefono</label>
  	                              		<div class="col-sm-10">
  	                                  		<input type="text" class="form-control" name="telefono" value="<%=cliente.getTelefono()%>" required>
  	                              		</div>
  	                          		</div>
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Mail</label>
  	                              		<div class="col-sm-10">
  	                                  		<input type="text" name="mail" class="form-control" value="<%=cliente.getMail()%>" required>
  	                              		</div>
  	                          		</div>
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Dirección</label>
  	                              		<div class="col-sm-10">
  	                                  		<input type="text" name="direccion" class="form-control" value="<%=cliente.getDireccion()%>" required>
  	                              		</div>
  	                          		</div>
  	                          		<div class="form-group">
  	                              		<label class="col-sm-2 col-sm-2 control-label">Localidad</label>
  	                              		<div class="col-sm-10">
  	                              		
  	                          				<select name="localidad_id">
  							  					<option>...</option>
  							  					<%String sel;
  							  					ArrayList<Localidad> localidades = new ControladorCliente().getAllLocalidades();
  								   				for(Localidad l:localidades){
  								   					if(l.getId()==cliente.getLocalidad().getId()){
  														sel="selected";
  													}else sel="";%>
  								  			    <option <%=sel %>  value="<%=l.getId()%>"><%=l.getNombre()%></option>
  												<%} %>						  			
  											</select>
  	                              		</div>
  	                          		</div>
  	                          <div class="centrar-cont">
  	                          	<button class="btn btn-primary">Aceptar</button>
  	                          	<input type="button" name="btnCancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='inicio.jsp'">		
  	                          </div>
  	                      </form>
  	                  </div>
  	          		</div><!-- col-lg-12-->      	
  	          	</div><!-- /row -->       
  	      <!--footer start-->
  	       <jsp:include page="footer.html"></jsp:include>
  	      <!--footer end-->
  		</section>
	  	<% }%>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>

   <!--  common script for all pages -->
    <script src="assets/js/common-scripts.js"></script>

    <!-- script for this page -->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!-- custom switch -->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!-- custom tagsinput -->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!-- custom checkbox & radio -->
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script src="assets/js/form-component.js"></script>   
	
	<!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	 
  </body>
</html>