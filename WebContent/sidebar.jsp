<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro" %>
<%@page import="entidades.Categoria" %>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="inicio.jsp"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Book Store</h5>
              	  
              	  <% ArrayList<Categoria> categorias = new ControladorLibro().getAllCategorias(); 
						for (Categoria c: categorias){%>
                  <li class="mt">                            
                          <a class="change-size" href="#"><%=c.getDescripcion()%></a>             
                  </li> 
                  <%} %>  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
</body>
</html>