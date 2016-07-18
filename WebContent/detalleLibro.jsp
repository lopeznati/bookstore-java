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

  <section id="container white-backround" >
  
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
		                              <td width="100"><img class="img-responsive" src="<%=l.getFoto()%>"/></td>
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
                             	  <input type="hidden" name="id" id="id" value="<%=l.getId()%>">
                             	  	<td><button type="submit" class="btn btn-theme03">Comprar +</button></td>
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

      <!--main content end-->
      
<jsp:include page="footer.html"></jsp:include>
   </section>   

  </body>
</html>
