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
              										<td>Categor�a: <%=l.getCategoria().getDescripcion()%></td>
              					  				</tr>
              					  				<tr>
              										<td>Editorial: <%=l.getEditorial().getNombre()%></td>
                             	  				</tr>
                             	  				<tr>
                             	  					<input type="hidden" name="id" id="id" value="<%=l.getId()%>">
                             	  					<input type="hidden" name="existencia" id="existencia" value="<%=l.getExistencia() %>">
                             	  					<td>
                             	  						<button type="submit" id="comprar" class="btn btn-theme03">Comprar +</button>
                             	  					</td>
                             	  				</tr>
                             	  			</table>
                              			</form>
		                          	</tbody>
		                         	<tfoot>
		                          		<tr>
		                          			<td Colspan="2">Sinopsis: <%=l.getSipnosis()%></td>
		                          		</tr>
		                          	</tfoot>
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
 
 		<script src="assets/js/bootstrap.min.js"></script>
 		<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
    	<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    	<script src="assets/js/form-component.js"></script>    
     	<script src="assets/js/jquery.scrollTo.min.js"></script>		
     	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>		
 	
     	<!--common script for all pages-->		
    	<script src="assets/js/common-scripts.js"></script>		
 				
     	<!--script for this page-->		
     	<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>		
 		
 		<!--custom switch-->		
 		<script src="assets/js/bootstrap-switch.js"></script>		
 			
 		<!--custom tagsinput-->		
 		<script src="assets/js/jquery.tagsinput.js"></script>		
 				
 		<!--custom checkbox & radio-->		
 		<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>		
 		<script src="assets/js/form-component.js"></script> 
	</body>
</html>
