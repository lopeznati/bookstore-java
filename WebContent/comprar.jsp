<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="negocio.ControladorCliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Arrays"%>
<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Tipo_Tarjeta"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="datos.CatalogoCliente"%>
<%@page import="datos.CatalogoLibro"%>
<%@page import="entidades.Localidad"%>
<%@page import="entidades.Pedido"%>
<%@page import="negocio.ControladorPedido"%>
<%@page import="entidades.Libro"%>

<!DOCTYPE html>
<html>
  	<head>
    	 <meta charset="utf-8">
    	<title>Alta pedido</title>
    	<link href="assets/css/bootstrap.css" rel="stylesheet">
    	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    	<link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
    	<link href="assets/css/style.css" rel="stylesheet">
    	<link href="assets/css/style-responsive.css" rel="stylesheet">
	</head>
	<body>
		<%if(session.getAttribute("usuario") != null){ %>	
      		<jsp:include page="navbar.jsp"></jsp:include>
      		<%if (session.getAttribute("rolUsuario").equals("admin")){%>
		  		<jsp:include page="sidebarAdmin.jsp"></jsp:include>
			<%}else {  %>	
      			<jsp:include page="sidebar.jsp"></jsp:include>
      		<%} %>
      		<section id="main-content">
          		<section class="wrapper">
          			<h3><i class="fa fa-angle-right"></i> Nuevo Pedido</h3>	
          			<div class="row mt">
          				<div class="col-lg-12">
                  			<div class="form-panel">
                  	  			<h4 class="mb"><i class="fa fa-angle-right"></i> Completar el formulario</h4>
                      			<form class="form-horizontal style-form" action="altaPedido" method="POST" >
                      	 			 <div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Cliente</label>
                              			<div class="col-sm-10">
                                  			<input READONLY type="hidden" name="cliente_id" value="<%=session.getAttribute("usuario")%>" class="form-control">
                                  			<input READONLY type="text" value="<%=session.getAttribute("cliente")%>" class="form-control">
                              			</div>
                          			</div>
                          		   <div class="form-group">
                          		   		<input type="hidden" name="msj" id="msj" value="<%=session.getAttribute("msj")%>">
                              			<label class="col-sm-2 col-sm-2 control-label">Libro</label>
                              			<div class="col-sm-10">
                              				<%
                              					ArrayList<Libro> carrito=(ArrayList<Libro>)session.getAttribute("carrito");
                          						String tituloLibro[] = new String[carrito.size()];
                          						double subtotal = 0;
                          						ArrayList titulosLibros = new ArrayList();
                              					for(int i=0;i<carrito.size();i++){
                        							tituloLibro[i] = carrito.get(i).getTitulo();
                              						subtotal = subtotal + carrito.get(i).getPrecio();
                              						titulosLibros.add(tituloLibro[i]);
                              						} %>                 
                              				<select multiple class="form-control" readonly>
						  							<%	for(Libro c:  carrito){%>
						  							<option><%=c.getTitulo()%></option>
						  						<%} %>						  			
											</select>	
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Direccion</label>
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
                              		<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Numero de tarjeta</label>
                              			<div class="col-sm-10">
                                  			<input type="text" name="numero_tarjeta" id="numero_tarjeta" required class="form-control">
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Tarjeta</label>
                              			<div class="col-sm-10">
                                  			<select name="tipo_tarjeta_id" id="tipo_tarjeta_id" class="form-control">
						  						<option value="" selected="selected">...</option>
						  							<%ArrayList<Tipo_Tarjeta> tiposTarjetas= new ControladorPedido().getAllTipoTarjeta();
													for(Tipo_Tarjeta tt:tiposTarjetas){%>
						  						<option value="<%=tt.getId()%>"><%=tt.getNombre()%></option>
						  						<%} %>						  			
											</select>
                              			</div>
                          			</div>
                          			<div class="form-group">
                              			<label class="col-sm-2 col-sm-2 control-label">Subtotal</label>
                              			<div class="col-sm-10">
                                  			<input READONLY type="text" name="subtotal" value="<%=subtotal%>" class="form-control">
                              			</div>
                          			</div>
                          			<div class="centrar-cont">
                          				<input type="submit" value="Aceptar" class="btn btn-primary">
                          				<input type="button" name="Cancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='carrito.jsp'">
                          			</div>	
                    		 	</form>
                  			</div>
          				</div>    	
          			</div>   
  				</section>
  			</section>
  			<%}else{
	  			response.sendRedirect("login.jsp");
	  		}%>	
    	<script src="assets/js/jquery.js"></script>
    	<script>
			$(document).ready(function(){
			$("form").submit(function(event){
				
  				var localidad=$("#localidad_id").val();
  				if(localidad === ''){
  					alert("El campo Localidad no puede quedar vacio, seleccione una opcion.");	  
  				//cancela el evento
   					event.preventDefault();
  				}
				
  				//valido la existencia del libro
				if($("#msj").attr("value")!=" "){
	  		 		alert("No hay mas existencia");
	  		 		event.preventDefault();
	  		 	}  
				//valido la longitud de la tarjeta
				else if($("#numero_tarjeta").val().length !=16){
  		 			alert("El numero de tarjeta debe tener 16 caracteres");
  		 			event.preventDefault()
   					$("#numero_tarjeta").focus();
  		 		}
  				
  				//valido que el campo de numero de tarjeta sean solo numeros
  				
				var num_tarjeta=$("#numero_tarjeta").val();
  				if(isNaN(num_tarjeta)){
  					alert("El campo Numero de Tarjeta debe ser numerico");
  					
  				//cancela el evento
   					event.preventDefault();
   					$("#numero_tarjeta").val("");
   					$("#numero_tarjeta").focus();
  				}
  				
  				var tipo_tarjeta=$("#tipo_tarjeta_id").val();
  				if(tipo_tarjeta === ''){
  					alert("El campo Tipo Tarjeta no puede quedar vacio, seleccione una opcion.");	  
  				//cancela el evento
   					event.preventDefault();
  				}
			});
		});	
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