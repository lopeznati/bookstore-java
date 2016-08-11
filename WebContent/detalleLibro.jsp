<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro" %>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
    	<title>Detalle Libro</title>
    	
    	<link href="assets/css/bootstrap.css" rel="stylesheet">
    	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    	<link href="assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    	<link href="assets/css/style.css" rel="stylesheet">
    	<link href="assets/css/style-responsive.css" rel="stylesheet">
    	<script src="assets/js/jquery.js"></script>
  	</head>
  	<body>
		<section id="container" >
    		<jsp:include page="navbar.jsp"></jsp:include>
				<%
			 		if (((session.getAttribute("usuario") == null)) ||(session.getAttribute("rolUsuario").equals("user"))){%>	
						<jsp:include page="sidebar.jsp"></jsp:include>
					<%}
			 		else if ((session.getAttribute("rolUsuario").equals("admin"))){%>
            			<jsp:include page="sidebarAdmin.jsp"></jsp:include>
			 	<%}%> 
      		<section id="main-content">
        		<section class="wrapper site-min-height">
          		<%
					Libro l = new ControladorLibro().getOneLibro(Integer.parseInt(request.getParameter("idLibro")));
				%>
          		<h3><i class="fa fa-angle-right"></i><%out.print(l.getTitulo()); %></h3>
          		<hr>
					<section class="wrapper">
		  				<div class="row">				
			            	<div class="col-md-12">
	    	              		<div class="content-panel">
		    	                	<table class="table table-striped">		                       
		        	                	<tbody>
		            	              		<tr>
		                	            		<img width="200px" class="img-responsive" src="<%=l.getFoto()%>"/>
		                    	      		</tr>
		                      				<form action="carrito" method="post">
              					  				<table class="table table-striped">
		                          					<tr>
		                              					<td>ISBN: <%=l.getIsbn()%></td>
		                          					</tr>
		                          					<tr>
              						  					<td>Precio: $ <%=l.getPrecio()%></td>
              					  					</tr>
              		 			  					<tr>
              			   			 					<td>Paginas: <%=l.getCantidad_paginas()%></td>
              					  					</tr>            		
              					  					<tr>
              											<td>Autor: <%=l.getAutor().getNombre()%></td>
				              						</tr>
              					  					<tr>
              											<td>Categoría: <%=l.getCategoria().getDescripcion()%></td>
              					  					</tr>
              					  					<tr>
              											<td>Editorial: <%=l.getEditorial().getNombre()%></td>
                             	  					</tr>
                             	  					<tr>		                          		
		                          						<td Colspan="2">Sinopsis: <%=l.getSipnosis()%></td>
		                          					</tr>
                             	  						<tr>
                             	  							<input type="hidden" name="id" id="id" value="<%=l.getId()%>">
                             	  							<input type="hidden" name="existencia" id="existencia" value="<%=l.getExistencia() %>">
                             	  						<td>	
                             	  							<button type="submit" id="btnComprar" class="btn btn-primary">Comprar +</button>		
                             	  						</td>
                             	  					</tr>
                             	  				</table>
                              				</form>
		                          		</tbody>
		                      		</table>
	                  	  		</div>	
		                  	</div>			
						</div> 
					</section>
      			</section>
      		</section>	
   		</section>  

   		<script src="assets/js/jquery.js"></script>
	   		<script>
   				$(document).ready(function(){
   					$("form").submit(function(event){
	   					var existencia=parseInt($("#existencia").attr("value")); 
   						if(existencia<1){
   						alert("No hay existencia de este libro");
   						window.location="inicio.jsp";
   				
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
