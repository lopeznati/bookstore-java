<%@page import="negocio.ControladorCliente"%>
<%@page import="entidades.Cliente"%>
<%@page import="negocio.ControladorPedido"%>
<%@page import="entidades.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta charset="utf-8">
    		<title>Listado de Pedidos</title>
 		
    		<link href="assets/css/bootstrap.css" rel="stylesheet">
    		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    		<link href="assets/css/style.css" rel="stylesheet">
    		<link href="assets/css/style-responsive.css" rel="stylesheet">
			<link href="assets/css/bootstrap.css" rel="stylesheet">
    		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    		<link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
		</head>
		<body>
			<jsp:include page="navbar.jsp"></jsp:include>
			<jsp:include page="sidebar.jsp"></jsp:include>
	  		<section id="main-content">
        		<section class="wrapper">
        			<%
					Cliente c = new ControladorCliente().getOneCliente(Integer.parseInt(request.getParameter("idCliente")));
					%>
            		<div class="row mt">
                		<div class="col-md-12">
                    		<div class="content-panel">
                        		<table class="table table-striped table-advance table-hover">
	                  	  			<h4><i class="fa fa-angle-right"></i> Listado de Pedidos</h4>
	                  	  	  		<hr>
                              		<table id="tabla" class="table table-striped">
              							<thead>
                							<tr>
                 					 			<th>Libro</th>     				    	
                 					 			<th>Direccion</th>
                 					 			<th>Localidad</th>
                 					 			<th>Subtotal</th>
				  								<th>Tipo tarjeta</th>
                							</tr>
              							</thead>
                              			<tbody>
                             	 			<%
                             	 			ArrayList<Pedido> pedidos=new ControladorPedido().getAllPedidosCliente();
			  								for(Pedido p:pedidos){
			  									if (c.getId() == p.getCliente().getId()){
			  				  	 			%>
                              				<tr>
				    							<td><%=p.getLibro().getTitulo()%></td>
				    							<td><%=p.getDireccion()%></td>
				    							<td><%=p.getLocalidad().getNombre()%></td>
				    							<td><%=p.getSubtotal()%></td>
				    							<td><%=p.getTipo_tarjeta().getNombre() %></td>
                              				</tr>                    
                               			<% } %><%} %>
                              			</tbody>
                          			</table>
                          		</table>
                      		</div>
                  		</div>
              		</div>
				</section>
      		</section>
      	</section>
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