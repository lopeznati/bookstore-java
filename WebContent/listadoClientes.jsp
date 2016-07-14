<%@page import="negocio.ControladorCliente"%>
<%@page import="entidades.Cliente"%>
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
		<jsp:include page="navbar.jsp"></jsp:include>
		<jsp:include page="sidebarAdmin.html"></jsp:include>
	  	<section id="main-content">
          <section class="wrapper">  	
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i>Listado Clientes</h4>
	                  	  	  <hr>
                              <table id="tabla" class="table table-striped">
              					<thead>
                					<tr>
                  						<th>#</th>
                  						<th>Usuario</th>
                  						<th>Nombre</th>
				  						<th>Apellido</th>
				  						<th>Fecha Nacimiento</th>
                  						<th>Telefono</th>
                  						<th>Mail</th>
                  						<th>Dirección</th>
                  						<th>Rol</th>
				  						<th>Foto</th>
				  						<th>Acciones</th>
                					</tr>
              					</thead>
                              	<tbody>
                              		<%ArrayList<Cliente> clientes = new ControladorCliente().getAllClientes();
			  						for(Cliente c: clientes)
			  						{%>
                              		<tr>
                                		<td><%=c.getId() %></td>
				    					<td><%=c.getUsuario() %></td>
				    					<td><%=c.getNombre() %></td>
				    					<td><%=c.getApellido() %></td>
				    					<td><%=c.getFecha_nacimiento() %></td>
				    					<td><%=c.getTelefono() %></td>
				    					<td><%=c.getMail() %></td>
				    					<td><%=c.getDireccion() %></td>
				    					<td><%=c.getRol() %></td>
				    					<td><%=c.getFoto() %></td>
				    					<td><%=c.getLocalidad().getNombre()%></td>
                                  		<td>
                                      		<button class="btn btn-primary btn-xs" onClick="window.location.href='modificarCliente.jsp?idMod=<%=c.getId()%>'"><i class="fa fa-pencil"></i></button>
                                      		<button class="btn btn-danger btn-xs" onClick="window.location.href='eliminarCliente.jsp?idElim=<%=c.getId()%>'"><i class="fa fa-trash-o "></i></button>
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
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</body>
</html>