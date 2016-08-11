
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro" %>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Home</title>

    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <script src="assets/js/chart-master/Chart.js"></script>
  </head>
  <body>
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
           					</div>    
		            </div>
		        </div>
		    </div>
 			<%} %>
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
