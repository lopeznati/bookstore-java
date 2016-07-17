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
          	<h3><i class="fa fa-angle-right"></i>Novedades</h3>
          	<hr>
          	<%ArrayList<Libro> libros = new ControladorLibro().getAllLibros();
 										for (Libro l: libros){%>
				<div class="row mt">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 desc">
						<div class="project-wrapper">
		                    <div class="project">		                        
		                            <div id="en-fila" class="photo hovereffect">
		                       
		                            	<img class="img-responsive" src="<%=l.getFoto()%>" alt="">	                            
		                            <div class="overlay2"><h2><%=l.getTitulo()%><br>$<%=l.getPrecio()%></h2>
           								<a class="info" href="detalleLibro.jsp?idLibro=<%=l.getId() %>">Detalles</a>
           								<a class="info" href="#"><i class="fa fa-cart-plus" aria-hidden="true"></i></a>
           							</div>    
		                        </div>
		                    </div>
		                </div>
					</div><!-- col-lg-4 -->
				</div><!-- /row -->
				<%}%>

		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      
<jsp:include page="footer.html"></jsp:include>
   </section>   

  </body>
</html>
