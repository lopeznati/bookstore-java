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
          			<%
          				int i=0;
          				ArrayList<Libro> libros = new ControladorLibro().getAllLibros();
 						for (Libro l: libros){%>
						<div class="project-wrapper">
		                    <div class="project">		                        
		                            <div id="en-fila" class="photo hovereffect">
		                            	<img  id="galeria" src="<%=l.getFoto()%>" alt="">	                            
		                            <div class="overlay2"><h2><%=l.getTitulo()%><br>$<%=l.getPrecio()%></h2>
           								<a class="info" href="detalleLibro.jsp?idLibro=<%=l.getId() %>">Detalles</a><br>
           								<a class="info"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
           							</div>    
		                        </div>
		                    </div>
		                </div>
 						<%} %>
				</section><!--/wrapper -->
      		</section><!-- /MAIN CONTENT -->

      	<!--main content end-->
		<jsp:include page="footer.html"></jsp:include>
   		</section>   
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
	<script src="assets/js/zabuto_calendar.js"></script>	
   		<script type="text/javascript">
        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'A�adido!',
            // (string | mandatory) the text inside the notification
            text: '�Qu� quieres hacer?',             
            text: '<a href="http://blacktie.co" style="color:#ffd777">Ir al carrito</a><br><a href="http://blacktie.co" style="color:#ffd777">Seguir comprando</a>',
            // (string | optional) the image to display on the left
            image: 'assets/img/ui-sam.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
        });
	</script>
	
  	</body>
</html>
