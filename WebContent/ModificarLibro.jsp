<%@page import="negocio.ControladorLibro"%>
<%@page import="entidades.Libro"%>
<%@page import="negocio.ControladorAutor"%>
<%@page import="entidades.Autor"%>
<%@page import="negocio.ControladorCategoria"%>
<%@page import="entidades.Categoria"%>
<%@page import="negocio.ControladorEditorial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Editorial"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
<body>

<%Libro libro=new ControladorLibro().getOneLibro(Integer.parseInt(request.getParameter("idMod"))); %>


<div class="row">
	    <div class="col-xs-12" align="center">
	    	<h2>Nuevo Libros</h2>
	    	
	    </div>
	   </div>

 <form action="ModificarLibro" method="POST" >
		  <table class="table table-striped">
		  
              <tr>
                  
                  <td><input type="hidden" name="id" value="<%=libro.getId() %>" required></td>
                </tr>
               
                <tr>
                  <td>ISBN</td>
                  <td><input type="text" name="isbn" value="<%=libro.getIsbn() %>" required></td>
                </tr>
				
				<tr>
                  <td>Titulo</td>
                  <td><input type="text" name="titulo" value="<%=libro.getTitulo() %>" required></td>
                </tr>
				
				<tr>
                  <td>Sipnosis</td>
                  <td><textarea rows="8" cols="50" name="sipnosis"  required><%=libro.getSipnosis() %></textarea></td>
                </tr>
				
				
				
				<tr>
                  <td>Cantidad de Paginas</td>
                  <td><input type="text" name="cpaginas" value="<%=libro.getCantidad_paginas()%>" required></td>
                </tr>
				
				<tr>
                  <td>Numero Edicion</td>
                  <td><input type="text" name="nedicion" value="<%=libro.getNumero_edicion() %>" required></td>
                </tr>
				
				<tr>
                  <td>Precio</td>
                  <td><input type="text" name="precio" value="<%=libro.getPrecio() %>" required></td>
                </tr>
				
				<tr>
                  <td>Existencia</td>
                  <td><input type="text" name="nexistencia" value="<%=libro.getExistencia() %>" required></td>
                </tr>
				
				<tr>
                  <td>Editorial</td>
				  
                  <td>
					<select name="editorial_id">
						<option>Elegir Opcion</option>
						<%
						String sel;
							ArrayList<Editorial> editoriales=new ControladorEditorial().getAllEditoriales();
										for(Editorial e:editoriales){
											if(e.getId()==libro.getEditorial().getId()){
												sel="selected";
											}else sel="";
						%>
							<option <%=sel %> value="<%=e.getId()%>"><%=e.getNombre()%></option>
							<%
								}
							%>
						
					
						
					</select>
				  </td>
                </tr>
				
				<tr>
				
				<tr>
                  <td>Categorias</td>
				  
                <td>
					<select name="categoria_id">
						<option>Elegir Opcion</option>
						<%
							ArrayList<Categoria> categorias=new ControladorCategoria().getAllCategorias();
							
										for(Categoria c:categorias){
											
											if(c.getId()==libro.getCategoria().getId()){
												sel="selected";
											}else sel="";
						%>
							<option <%=sel %> value="<%=c.getId()%>"><%=c.getDescripcion()%></option>
							<%
								}
							%>
						
					
						
					</select>
				  </td>                </tr>
				  
				  	<tr>
                  <td>Autor</td>
				  
                  <td>
					<select name="autor_id">
						<option>Elegir Opcion</option>
						<%
							ArrayList<Autor> autores=new ControladorAutor().getAllAutores();
										for(Autor a:autores){
											

											if(a.getId()==libro.getAutor().getId()){
												sel="selected";
											}else sel="";
						%>
							<option <%=sel %> value="<%=a.getId()%>"><%=a.getNombre() + ' ' + a.getApellido()%></option>
							<%} %>
						
					
						
					</select>
				  </td>
                </tr>
				
				<tr>
                  <td>Imagen</td>
                  <td><input type="text" value="<%=libro.getFoto() %>" name="foto"><br /></td>
                </tr>
				
				
				
				<tr>
                  <td></td>
                  <td><input type="submit" class="btn btn-primary" value="Guardar"></td>
				  
	
                </tr>
				
           </table>
           
           </form>


<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>