<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Carrito de compras</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
	    <link href="assets/css/bootstrap.css" rel="stylesheet">
	    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
	    <link href="assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
	    <!-- Custom styles for this template -->
	    <link href="assets/css/style.css" rel="stylesheet">
	    <link href="assets/css/style-responsive.css" rel="stylesheet">
	    <script src="assets/js/jquery.js"></script>
	</head>
	<body>
		<%if(session.getAttribute("usuario") != null){ %>	
			<section id="container white-backround" >
      		<jsp:include page="navbar.jsp"></jsp:include>
	   		 <%if (session.getAttribute("rolUsuario").equals("admin")){%>
		 		 <jsp:include page="sidebarAdmin.jsp"></jsp:include>
				 <%}else {%>	
      				<jsp:include page="sidebar.jsp"></jsp:include>
      			<%} %>
	  			<section id="main-content">
          			<section class="wrapper">  	
              			<div class="row mt">
                  		<div class="col-md-12">
                  		<h4><i class="fa fa-angle-right"></i>Tu carrito</h4>
	              		<hr>
                      	<div class="content-panel">	                  	  	  
                        	<table id="tabla" class="table table-striped">
              					<thead>
                					<tr>
                  						<th>Libro</th>
                  						<th>Categoría</th>
                 					 	<th>Editorial</th>
                 					 	<th>Precio</th>               					
                					</tr>
              					</thead>
                              	<tbody>
                              	<% 
									session.setAttribute("msj", " ");
									double total=0;
									int totalArticulos=0;
									if(session.getAttribute("carrito")!=null){
									ArrayList<Libro> carrito =(ArrayList<Libro>)session.getAttribute("carrito");
							
									for(int i=0;i<carrito.size();i++){
									total=total + carrito.get(i).getPrecio();
									totalArticulos+=1;
							  	%>
                              		<tr>
                                		<td><%=carrito.get(i).getTitulo() %></td>
										<td><%=carrito.get(i).getCategoria().getDescripcion() %></td>
										<td><%=carrito.get(i).getEditorial().getNombre() %></td>
										<td><%=carrito.get(i).getPrecio() %></td>
										<td align="center"><a href="borracar.jsp?id=<%=i%>"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
										<td><input name="idlibro" type="hidden" id="idlibro" value="<%= carrito.get(i).getId() %>"> </td>
                              		</tr>                    
                               		<%} %>
                               <%} %>
                              	</tbody>
                          	</table>
                          	<div align="center"><span >Total de Articulos:<%=totalArticulos %>
								</span> 
									</div><br>
									<div  align="center" id='total'><span >Total:$ <%=total %>
								</span> 
								</div><br>
								<%if(total!=0){ %>
									<div  align="center">
										<span>Continuar la seleccion de productos</span>
										<a href="inicio.jsp">
										<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a> 
									</div>
									<div  align="center">
										<input type="button" name="btnComprar" value="Comprar" class="btn btn-primary" onClick="location.href='comprar.jsp'">	
									</div>
									<br>
									<%}else{ %>
									<div align="center"> 
										<span class="prod">No hay productos seleccionados</span>	
							    		<a href="inicioAdmin.jsp">			
										<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a> 
									</div>
									<div  align="center">
										<input disabled type="button" name="btnComprar" value="Comprar" class="btn btn-primary" onClick="location.href='comprar.jsp'">	
									</div>
									<%} %>
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