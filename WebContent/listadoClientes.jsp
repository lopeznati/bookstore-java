<%@page import="negocio.ControladorCliente"%>
<%@page import="entidades.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Listado clientes</title>
		
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
		<jsp:include page="sidebarAdmin.jsp"></jsp:include>
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
				    					<td><%=c.getLocalidad().getNombre()%></td>
                                  		<td>
                                      		<%-- <button class="btn btn-primary btn-xs" onClick="window.location.href='modificarCliente.jsp?idMod=<%=c.getId()%>'"><i class="fa fa-pencil"></i></button> --%>
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
	  	
	  	<%}else{
	  		response.sendRedirect("login.jsp");
	  	}%>
		<!-- Latest compiled and minified JavaScript -->
		 <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>

   <!--  common script for all pages -->
    <script src="assets/js/common-scripts.js"></script>

    <!-- script for this page -->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!-- custom switch -->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!-- custom tagsinput -->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!-- custom checkbox & radio -->
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script src="assets/js/form-component.js"></script>   
	
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