<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Libro" %>
<%@page import="entidades.Categoria" %>
<%@page import="negocio.ControladorLibro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Sidebar Admin</title>
	</head>
	<body>
    	<aside>
        	<div id="sidebar"  class="nav-collapse ">
           		<ul class="sidebar-menu" id="nav-accordion">
            		<p class="centered"><a href="inicio.jsp"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
            		<h5 class="centered">The Open Book</h5>
            		<li class="sub-menu">
                    	<a class="active" href="javascript:;" >
                      		<i class="fa fa-book" aria-hidden="true"></i>                          
                          	<span>Mi Cuenta</span>
                      	</a>                      
                      	<ul class="sub">
                      		<li>
                      	  		<a href='modificarCliente.jsp?idMod=<%=session.getAttribute("usuario")%>'>
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Editar Datos</span>
                      	  		</a>
                      	  	</li>
                      	</ul>
                  	</li>
                  	<li class="sub-menu">
                    	<a href="javascript:;" >
                      		<i class="fa fa-book" aria-hidden="true"></i>                          
                          	<span>LIBROS</span>
                      	</a>                      
                      	<ul class="sub">
                      		<li>
                      	  		<a href="listadoLibros.jsp">
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Lista</span>
                      	  		</a>
                      	  	</li>
                         	 <li>
                          		<a href="nuevoLibro.jsp">
                          			<i class="fa fa-plus-circle" aria-hidden="true"></i>
                          			<span>Nuevo</span>
                          		</a>
						  	</li>
                      	</ul>
                  	</li>
                  	<li class="sub-menu">
                      	<a href="javascript:;" >
                      	  	<i class="fa fa-male" aria-hidden="true"></i>                         
                          	<span>AUTORES</span>
                      	</a>	
                      	<ul class="sub">
                      	  	<li>
                      	  		<a  href="listadoAutor.jsp">
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Lista</span>
                      	  		</a>
                      	  	</li>
                          	<li>
                          		<a  href="nuevoAutor.jsp">
                          			<i class="fa fa-plus-circle" aria-hidden="true"></i>
                          			<span>Nuevo</span>
                          		</a>
						  	</li>
                      	</ul>
                  	</li>    
                  	<li class="sub-menu">
                      	<a href="javascript:;" >
                      	  	<i class="fa fa-male" aria-hidden="true"></i>                         
                          	<span>CLIENTES</span>
                     	</a>
                      	<ul class="sub">
                      	  	<li>
                      	  		<a  href="listadoClientes.jsp">
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Lista</span>
                      	  		</a>
                      	  	</li>
                      	</ul>
                  	</li>
                 	<li class="sub-menu">
                      	<a href="javascript:;" >
                      	  	<i class="fa fa-book" aria-hidden="true"></i>                         
                          	<span>PEDIDOS</span>
                      	</a>
                      	<ul class="sub">
                      	  	<li>
                      	  		<a  href="listadoPedido.jsp">
                      	  			<i class="fa fa-list" aria-hidden="true"></i>
                      	  			<span>Lista</span>
                      	  		</a>
                      	  	</li>
                      	</ul>
                  	</li>       
              	</ul>
          	</div>
    	<script src="assets/js/common-scripts.js"></script>
    	<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
		<script src="assets/js/bootstrap-switch.js"></script>
		<script src="assets/js/jquery.tagsinput.js"></script>
	</body>
</html>