<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro" %>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/jquery.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
   
  </head>
  <body>
	<section id="container" >
    	<jsp:include page="navbar.jsp"></jsp:include>
      	<!-- **********************************************************************************************************************************************************
      	MAIN SIDEBAR MENU
      	*********************************************************************************************************************************************************** -->
      	<!--sidebar start-->
      	<jsp:include page="sidebar.jsp"></jsp:include>
      	<!--sidebar end-->
      
	      <!-- **********************************************************************************************************************************************************
      	MAIN CONTENT
      	*********************************************************************************************************************************************************** -->
      	<!--main content start-->
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
                             	  						<%if (session.getAttribute("rolUsuario").equals("admin")){%>
							    						<input type="button" name="btnCancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='inicioAdmin.jsp'">	
														<% 
						    							}else {  %>	
														<input type="button" name="btnCancelar" value="Cancelar" class="btn btn-primary" onClick="location.href='inicio.jsp'">
														<%} %>	
                             	  					</td>
                             	  				</tr>
                             	  			</table>
                              			</form>
		                          	</tbody>
		                      	</table>
	                  	  	</div>
	                  	</div><!-- /col-md-12 -->			
					</div> <!-- end row -->
				</section><!--/wrapper -->
      		</section><!-- /MAIN CONTENT -->
      		</section>
      		<!--main content end-->
			<jsp:include page="footer.html"></jsp:include>
   		</section>  

   		<script src="assets/js/jquery.js"></script>
   		<script>
   			$(document).ready(function(){
   				$("form").submit(function(event){
   					var existencia=parseInt($("#existencia").attr("value")); 
   					if(existencia<1){
   					alert("No hay existencia de este libro");
   				
   					//cancela el evento
   					event.preventDefault();
   					}
   				});
   			});
   		</script>

   		<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
    	<!-- js placed at the end of the document so the pages load faster -->
    	<script src="assets/js/jquery.js"></script>
    	<script src="assets/js/jquery-1.8.3.min.js"></script>
    	<script src="assets/js/bootstrap.min.js"></script>
    	<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    	<script src="assets/js/jquery.scrollTo.min.js"></script>
    	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    	<script src="assets/js/jquery.sparkline.js"></script>


    	<!--common script for all pages-->
    	<script src="assets/js/common-scripts.js"></script>
    
    	<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    	<!--script for this page-->
    	<script src="assets/js/sparkline-chart.js"></script>  
	</body>
</html>
