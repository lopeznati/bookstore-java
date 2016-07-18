<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
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

<%
Libro l = new ControladorLibro().getOneLibro(Integer.parseInt(request.getParameter("idLibro")));
%>


<table class="table table-striped">
            
              <tbody>
              <tr>
              
              	<td width="100"><img width="200" src="<%=l.getFoto()%>"/></td>
              	<td>
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
              			<td>Categoria: <%=l.getCategoria().getDescripcion()%></td>
              		</tr>
              		<tr>
              			<td>Editorial: <%=l.getEditorial().getNombre()%></td>              			
              		</tr>
              		
              		<tr>
              		<input type="hidden" name="id" id="id" value="<%=l.getId()%>">
              			<td><input  type='submit' class='btn btn-primary' value='Comprar +'/></td>
              		</tr>
              		
              		
														
              		
              		
              		</table>
              		</form>
              	
              	</td>
              	
              	
             
              	
              	
              	
              	
              	
              	
              </tr>
              
              <tr>
              	<td Colspan="2">Sinopsis: <%=l.getSipnosis()%></td>
              
              </tr>
              
              
              

				

               
              </tbody>
			 
            </table>
			

        	<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>