<%@page import="datos.CatalogoLibro"%>
<%@page import="entidades.Libro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Libro l=new CatalogoLibro().getOneLibro(Integer.parseInt(request.getParameter("idLibro")));
%>


<table class="table table-striped">
            
              <tbody>
              <tr>
              
              	<td width="100"><img width="200" src="<%=l.getFoto()%>"/></td>
              	<td>
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
              			<td>Autor: <%=l.getCategoria().getDescripcion()%></td>
              		</tr>
              		<tr>
              			<td>Autor: <%=l.getEditorial().getNombre()%></td>
              		</tr>
              		
              		
              		</table>
              	
              	</td>
              	
              	
             
              	
              	
              	
              	
              	
              	
              </tr>
              
              <tr>
              	<td Colspan="2">Sinopsis: <%=l.getSipnosis()%></td>
              
              </tr>

				

               
              </tbody>
			 
            </table>
			

</body>
</html>