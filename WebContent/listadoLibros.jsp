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
 <link href="css/styles.css" rel="stylesheet">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >

</head>
<body>
	<!-- Valido que el usuario sea administrador, caso contrario lo mando al login -->
	<%if(session.getAttribute("rolUsuario").equals("admin")){ %>
<jsp:include page="navbar.jsp"></jsp:include>
<jsp:include page="sidebarAdmin.html"></jsp:include>
	  <section id="main-content">
          <section class="wrapper">
          	
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Listado de Libros</h4>
	                  	  	  <hr>
                              <table id="tabla" class="table table-striped">
              					<thead>
                					<tr>
                  						<th>#</th>
                  						<th>ISBN</th>
                 					 	<th>Titulo</th>
                 					 	
                  					<th>Cantidad de paginas</th>
				  					<th>Numero Edicion</th>
                  					<th><i class="fa fa-money" aria-hidden="true"></i></th>
                  					<th><i class="fa fa-archive" aria-hidden="true"></i> Existencia</th>
                  					<th>Editorial</th>
				  					<th>Categoria</th>
				  					<th><i class="fa fa-male" aria-hidden="true"></i> Autor</th>
				  					<th>Acciones</th>
                					</tr>
              					</thead>
                              <tbody>
                              <%ArrayList<Libro> libros=new ControladorLibro().getAllLibros();
			  					for(Libro l:libros){%>
                              <tr>
                                <td><%=l.getId() %></td>
				    			<td><%=l.getIsbn() %></td>
				    			<td><%=l.getTitulo() %></td>
				    			<td><%=l.getCantidad_paginas() %></td>
				    			<td><%=l.getNumero_edicion() %></td>
				    			<td>$<%=l.getPrecio()%></td>
				    			<td><%=l.getExistencia() %></td>
				    
				    			<td><%=l.getEditorial().getNombre() %></td>
				    			<td><%=l.getCategoria().getDescripcion() %></td>
				    			<td><%=l.getAutor().getNombre() +' ' + l.getAutor().getApellido() %></td>
                                  <td>
                                      <button class="btn btn-primary btn-xs" onClick="window.location.href='modificarLibro.jsp?idMod=<%=l.getId()%>'"><i class="fa fa-pencil"></i></button>
                                      <button class="btn btn-danger btn-xs" onClick="window.location.href='eliminarLibro.jsp?idElim=<%=l.getId()%>'"><i class="fa fa-trash-o "></i></button>
                                  </td>
                              </tr>                    
                               <% } %>
                              </tbody>
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->

		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->


<jsp:include page="footer.html"></jsp:include>

 	<%}else{
	  		response.sendRedirect("login.jsp");
	  	}%>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>
