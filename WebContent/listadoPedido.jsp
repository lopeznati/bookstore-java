<%@page import="negocio.ControladorPedido"%>
<%@page import="entidades.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Listado Pedidos</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 		<link href="css/styles.css" rel="stylesheet">
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
	</head>
	<body>
		<%if(session.getAttribute("rolUsuario").equals("admin")){ %>
		<jsp:include page="navbar.jsp"></jsp:include>
		<jsp:include page="sidebarAdmin.jsp"></jsp:include>
	  	<section id="main-content">
        	<section class="wrapper">
            	<div class="row mt">
                	<div class="col-md-12">
                    	<div class="content-panel">
                        	<table class="table table-striped table-advance table-hover">
	                  	  		<h4><i class="fa fa-angle-right"></i> Listado de Pedidos</h4>
	                  	  	  	<hr>
                              	<table id="tabla" class="table table-striped">
              						<thead>
                						<tr>
                  							<th>#</th>
                  							<th>Cliente</th>
                 					 		<th>Libro</th>     				    	
                 					 		<th>Direccion</th>
                 					 		<th>Localidad</th>
                 					 		<th>Subtotal</th>
				  							<th>Tipo tarjeta</th>
                						</tr>
              						</thead>
                              		<tbody>
                             	 	<%
                             	 		ArrayList<Pedido> pedidos=new ControladorPedido().getAllPedidos();
			  							for(Pedido p:pedidos){
			  				  	 	%>
                              			<tr>
                                			<td><%=p.getId() %></td>
				    						<td><%=p.getCliente().getApellido().concat(" ," + p.getCliente().getNombre())%></td>
				    						<td><%=p.getLibro().getTitulo()%></td>
				    						<td><%=p.getDireccion()%></td>
				    						<td><%=p.getLocalidad().getNombre()%></td>
				    						<td><%=p.getSubtotal()%></td>
				    						<td><%=p.getTipo_tarjeta().getNombre() %></td>
                              			</tr>                    
                               		<% } %>
                              		</tbody>
                          		</table>
                      		</div><!-- /content-panel -->
                  		</div><!-- /col-md-12 -->
              		</div><!-- /row -->
				</section><!--/wrapper -->
      		</section><!-- /MAIN CONTENT -->
  	  	 	<%}else{
		  		response.sendRedirect("login.jsp");
	  		}%>
			<jsp:include page="footer.html"></jsp:include>
		
			<!-- Latest compiled and minified JavaScript -->
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
