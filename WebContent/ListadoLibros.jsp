<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >

</head>
<body>
	   <div class="table-responsive">
	   <div class="row">
	    <div class="col-xs-12" align="center">
	    	<h2>Listado Libros</h2>
	    	
	    </div>
	   </div>
	   
            <table id="tabla" class="table table-striped">
              <thead>
             
                <tr>
                  <th>#</th>
                  <th>ISBN</th>
                  <th>Titulo</th>
                  
                  <th>Cantidad de paginas</th>
				  <th>Numero Edicion</th>
                  <th>Precio</th>
                  <th>Existencia</th>
                  <th>Editorial</th>
				  <th>Categoria</th>
				  <th>Autor</th>
				  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
			  <% 
			  ArrayList<Libro> libros=new ControladorLibro().getAllLibros();
			  for(Libro l:libros){
				  %>
				   <tr>
				    <td><%=l.getId() %></td>
				    <td><%=l.getIsbn() %></td>
				    <td><%=l.getTitulo() %></td>
				    <td><%=l.getCantidad_paginas() %></td>
				    <td><%=l.getNumero_edicion() %></td>
				    <td><%=l.getPrecio()%></td>
				    <td><%=l.getExistencia() %></td>
				    
				    <td><%=l.getEditorial().getNombre() %></td>
				    <td><%=l.getCategoria().getDescripcion() %></td>
				    <td><%=l.getAutor().getNombre() +' ' + l.getAutor().getApellido() %></td>
				    
				    <td><a href='ModificarLibro.jsp?idMod=<%=l.getId()%>'><IMG SRC="imagenes/modify.png" WIDTH=20 HEIGHT=20></a>
				        <a href='EliminarLibro.jsp?idElim=<%=l.getId()%>'> <IMG SRC='imagenes/gnome_edit_delete.png' WIDTH=30 HEIGHT=30>  </a></td>
 
				  <% } %>
 
              </tbody>
            </table>
            <div align="right">
              <a href="NuevoLibro.jsp" target="black"><button class="btn btn-primary" >Nuevo Libro</button></a>
            </div>
            
            
			
			
			
			
		
          </div>




<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>
