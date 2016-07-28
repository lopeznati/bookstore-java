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
		<jsp:include page="sidebarAdmin.html"></jsp:include>
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
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</body>
</html>
