<%@page import="negocio.ControladorLibro"%>
<%@page import="datos.CatalogoCliente"%>
<%@page import="datos.CatalogoLibro"%>
<%@page import="datos.CatalogoLocalidad"%>
<%@page import="entidades.Localidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.ControladorCliente"%>
<%@page import="entidades.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
	    <meta charset="utf-8">
    	<title>Actualizar usuario</title>

    	<link href="assets/css/bootstrap.css" rel="stylesheet">
    	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    	<link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    	<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    	<link href="assets/css/style.css" rel="stylesheet">
    	<link href="assets/css/style-responsive.css" rel="stylesheet">
    	<script src="assets/js/chart-master/Chart.js"></script>
  	</head>
  	<body>
  		<section id="container" >
	    	<jsp:include page="navbar.jsp"></jsp:include>
  			<%if(session.getAttribute("usuario") != null){ %> 		
  	 			<%if((session.getAttribute("usuario") != null)){
            		if ((session.getAttribute("rolUsuario").equals("admin"))){%>
            	 		<jsp:include page="sidebarAdmin.jsp"></jsp:include>
				<%}else{%>	
					<jsp:include page="sidebar.jsp"></jsp:include>
			 	<%}%>
		  	<%}else{ %>
				<jsp:include page="sidebar.jsp"></jsp:include>
		  	<%} %>
  	      	<section id="main-content">
  	        	<section class="wrapper">
  	          		<h3><i class="fa fa-angle-right"></i> Modificar Usuario</h3>
  	       			<%Cliente cliente = new ControladorCliente().getOneCliente(Integer.parseInt(request.getParameter("idMod")));%>
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
  	          		</div>  	
  	          	</div>      
  		</section>
  		</section>
	  	<% }%>
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