<%@page import="negocio.ControladorAutor"%>
<%@page import="entidades.Autor"%>
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
<%if(session.getAttribute("rolUsuario").equals("admin")){ %>
<jsp:include page="navbar.jsp"></jsp:include>
<jsp:include page="sidebarAdmin.jsp"></jsp:include>
	  <section id="main-content">
          <section class="wrapper">
          	
              <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i> Listado de Autores</h4>
	                  	  	  <hr>
                              <table id="tabla" class="table table-striped">
              					<thead>
                					<tr>
                  						<th>#</th>
                  						<th>Nombre</th>
                 					 	<th>Apellido</th>
                 					
				  					<th>Acciones</th>
                					</tr>
              					</thead>
                              <tbody>
                              <%ArrayList<Autor> autores=new ControladorAutor().getAllAutores();
			  					for(Autor a:autores){%>
                              <tr>
                                <td><%=a.getId() %></td>
				    			<td><%=a.getNombre() %></td>
				    			<td><%=a.getApellido() %></td>
                                  <td>
                                      <button class="btn btn-primary btn-xs" onClick="window.location.href='modificarAutor.jsp?idMod=<%=a.getId()%>'"><i class="fa fa-pencil"></i></button>
                                      <button class="btn btn-danger btn-xs" onClick="window.location.href='eliminarAutor.jsp?idElim=<%=a.getId()%>'"><i class="fa fa-trash-o "></i></button>
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
      
      
  				  	 	<%}else{
	  		response.sendRedirect("login.jsp");
	  	}%>


<jsp:include page="footer.html"></jsp:include>

      <!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   		<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>
    	<!-- js placed at the end of the document so the pages load faster -->
    	<script src="assets/js/jquery.js"></script>
    	<script src="assets/js/jquery-1.8.3.min.js"></script>
    	<script src="assets/js/bootstrap.min.js"></script>
    	<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    	<script src="assets/js/jquery.scrollTo.min.js"></script>
    	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    	<script src="assets/js/jquery.sparkline.js"></script>


    	<!--common script for all pages-->
    	<script src="assets/js/common-scripts.js"></script>
    
    	<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    	<!--script for this page-->
    	<script src="assets/js/sparkline-chart.js"></script> 

</body>
</html>
